<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2017/8/28
 * Time: 13:51
 */
class Upload extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('upload_model');
    }

    //选择图片
    public function select_image()
    {
        $this->load->view('upload/select_image.html');
    }

    //上传图片
    public function upload_image()
    {
        $this->load->view('upload/upload_image.html');
    }

    //执行上传并写入数据库
    public function do_upload()
    {
        $file_obj_name = $this->input->post('fileObjName');
        $config = array(
            'upload_path' => $this->config->item('upload') . date('Ymd', time()) . '/',//上传路径
            'allowed_types' => '*',//允许上传文件类型：*=所有类型
            'file_name' => md5(uniqid(microtime(TRUE), TRUE))//新文件名
        );
        $this->load->library('upload', $config);
        $this->upload->do_upload($file_obj_name);
        $data = $this->upload->data();
        $data['errors'] = $this->upload->display_errors();
        $data['id'] = $this->upload_model->save($data);
        $data['file_obj_name'] = $file_obj_name;
        echo json_encode($data);
    }

    //删除
    public function del()
    {
        $id = $this->input->post('id');
        $rows = $this->upload_model->del($id);
        //写入日志
        //$this->sys_log->insert($this->section_name, '3', $rows);
        echo $rows;
    }

}