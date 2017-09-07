<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2017/8/28
 * Time: 13:51
 */
class Uploads extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->set_url();
        $this->load->model('uploads_model', 'uploads');
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('uploads/get_list');
        $this->load->vars($url);
    }

    //文件列表
    public function get_list()
    {
        $page = $this->input->post('page');
        $key = $this->input->post('key');
        $data['list'] = $this->uploads->get_list($page, $key);
        echo json_encode($data);
    }

    //选择图片
    public function cloud()
    {
        $data['queueid'] = $this->input->get('queueid', TRUE);
        $data['multi'] = $this->input->get('multi', TRUE);
        $this->load->view('uploads/cloud.html', $data);
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
        $config = array(
            'upload_path' => standard_path($this->config->item('upload', 'mcms') . 'upload/' . date('Ymd', time()) . '/'),//上传路径
            'allowed_types' => '*',//允许上传文件类型：*=所有类型
            'file_name' => md5(uniqid(microtime(TRUE), TRUE))//新文件名
        );
        $this->load->library('upload', $config);
        $this->upload->do_upload($filename);
        $data = $res = $this->upload->data();
        $data['id'] = $this->uploads->save($res);
        $data['input_name'] = $filename;
        $data['thumb_full_path'] = '';
        //生成缩略图
        if ($data['is_image']) {
            $this->resize($data['full_abs_path'], $this->config->item('thumb_width', 'mcms'), $this->config->item('thumb_height', 'mcms'));
            //拼接缩略图地址
            $data['thumb_full_path'] = $data['raw_path'] . $this->config->item('thumb_marker', 'mcms') . $data['ext'];
        }
        //返回数据
        echo json_encode($data);
    }

    //删除
//    public function del()
//    {
//        $id = $this->input->post('id');
//        $rows = $this->uploads->del($id);
//        //写入日志
//        //$this->sys_log->insert($this->section_name, '3', $rows);
//        echo $rows;
//    }


    //生成缩略图
    public function resize($path = '', $width = 120, $height = 120)
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


}