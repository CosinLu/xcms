<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2017/8/28
 * Time: 13:51
 */
class Uploads extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->set_url();
        $this->load->model('uploads_model');
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('uploads/get_list');
        $url['insert_btn'] = $this->auth->set(config_item('my_insert'), $this->sys_menu_auth, '<a class="btn btn-primary btn-sm" href="' . site_url('uploads/insert') . '">新增</a>');
        $url['del_btn'] = $this->auth->set(config_item('my_del'), $this->sys_menu_auth, '<a class="btn btn-danger btn-sm batch-del-hook" href="javascript:;" data-tb="uploads" data-menu="' . $this->section_name . '" data-checkname="id" data-url = "' . site_url('uploads/batch_del') . '">删除</a>');
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('uploads/index.html');
    }

    //文件列表
    public function get_list()
    {
        $page = $this->input->post('page');
        $key = $this->input->post('key');
        $data['list'] = $this->uploads_model->get_list($page, $key);
        foreach ($data['list']['list'] as $key => $val) {
            $data['list']['list'][$key]['thumb_rel_path'] = $val['is_image'] ? $val['raw_rel_path'] . config_item('my_thumb_marker') . $val['file_ext'] : '';
            $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_del'), $this->sys_menu_auth, '<a href="javascript:;" class="del-hook" data-tb="uploads" data-id="' . $val['id'] . '" data-menu="' . $this->section_name . '" data-url="' . site_url('uploads/del') . '">删除</a>', '<a href="javascript:;" class="disabled">删除</a>');
        }
        echo json_encode($data);
    }

    //云上传
    public function cloud()
    {
        $data['queueid'] = $this->input->get('queueid', TRUE);
        $data['multi'] = $this->input->get('multi', TRUE);
        $this->load->view('uploads/cloud.html', $data);
    }

    //本地上传
    public function location()
    {
        $this->load->view('uploads/location.html');
    }

    //上传图片
    public function uploads_image()
    {
        $this->load->view('uploads/uploads_image.html');
    }

    //执行上传并写入数据库
    public function do_upload()
    {
        $filename = $this->input->post('filename');
        $config['upload_path'] = standard_path(config_item('my_upload') . 'upload/' . date('Ymd', time()) . '/');
        $config['allowed_types'] = '*';
        $config['file_name'] = md5(uniqid(microtime(TRUE), TRUE));
        $this->load->library('upload', $config, 'my_upload');
        $this->my_upload->do_upload($filename);
        $data = $res = $this->my_upload->data();
        $data['id'] = $this->uploads_model->save($res);
        $data['input_name'] = $filename;
        $data['thumb_rel_path'] = '';
        //生成缩略图
        if ($data['is_image']) {
            $this->create_thumb($data['abs_path'], config_item('my_thumb_width'), config_item('my_thumb_height'));
            //拼接缩略图地址
            $data['thumb_rel_path'] = $data['raw_rel_path'] . config_item('my_thumb_marker') . $data['file_ext'];
        }
        //返回数据
        echo json_encode($data);
    }

    //创建缩略图
    public function create_thumb($path = '', $width = 120, $height = 120)
    {
        $config['image_library'] = 'gd2';
        $config['source_image'] = $path;
        $config['create_thumb'] = TRUE;
        $config['maintain_ratio'] = TRUE;
        $config['width'] = $width;
        $config['height'] = $height;
        $config['create_thumb'] = TRUE;
        $config['thumb_marker'] = '_' . $config['width'] . '_' . $config['height'];
        $this->load->library('image_lib', $config);
        $this->image_lib->resize();
    }

    //删除
    public function del()
    {
        $tbname = $this->input->post('tbname');
        $id = $this->input->post('id');
        $primary = $this->input->post('primary') ?: 'id';
        $rows = $this->uploads_model->del($tbname, $id, $primary);
        //写入日志
        $this->oplog->insert($this->section_name, '3', $rows);
        echo $rows;
    }

    //批量删除
    public function batch_del()
    {
        $tbname = $this->input->post('tbname');
        $id = explode(',', $this->input->post('id'));
        $primary = $this->input->post('primary') ?: 'id';
        $rows = $this->uploads_model->batch_del($tbname, $id, $primary);
        //写入日志
        $this->oplog->insert($this->section_name, '3', $rows);
        echo $rows;
    }


}