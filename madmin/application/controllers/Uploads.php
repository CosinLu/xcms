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
        $this->load->model('uploads_model', 'uploads');
    }

    //选择图片
    public function select_image()
    {
        $this->load->view('uploads/select_image.html');
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
        $data = $this->upload->data();
        $data['errors'] = $this->upload->display_errors();
        $data['id'] = $this->uploads->save($data);
        $data['filename'] = $filename;
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