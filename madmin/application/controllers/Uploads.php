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

    //上传文件列表
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
            'upload_path'   => $this->config->item('upload') . date('Ymd', time()) . '/',//上传路径
            'allowed_types' => '*',//允许上传文件类型：*=所有类型
            'file_name'     => md5(uniqid(microtime(TRUE), TRUE))//新文件名
        );
        $this->load->library('upload', $config);
        $this->upload->do_upload($filename);
        $res = $this->upload->data();
        $data = array(
            'upl_image'  => $res['is_image'],
            'upl_path'   => $res['full_path'],
            'upl_ext'    => $res['ext'],
            'upl_name'   => $res['client_name'],
            'upl_id'     => $this->uploads->save($res),
            'upl_input'  => $filename,
            'upl_width'  => $res['image_width'],
            'upl_height' => $res['image_height'],
            'upl_size'   => $res['size'],
            'upl_errors' => $this->upload->display_errors()
        );
        echo json_encode($data);
    }

    //删除
    public function del()
    {
        $id = $this->input->post('id');
        $rows = $this->uploads->del($id);
        //写入日志
        //$this->sys_log->insert($this->section_name, '3', $rows);
        echo $rows;
    }

}