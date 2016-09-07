<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/9/6
 * Time: 11:52
 */
class Uploadifive extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('uploadifive_model', 'uploadifive');
    }

    public function do_upload()
    {
        $file_input = $this->input->post('fileInput');
        $config = array(
            'upload_path' => '/uploads/',
            'allowed_types' => '*',
            'file_name' => md5(uniqid(microtime(TRUE), TRUE))
        );
        $this->load->library('upload', $config);
        $this->upload->do_upload($file_input);
        $data = $this->upload->data();
        $data['errors'] = $this->upload->display_errors();
        $data['id'] = $this->uploadifive->save($data);
        //$data['file_upload'] = $_FILES['file_upload'];
        echo json_encode($data);
    }

    public function check_exists()
    {
        echo 0;
    }
}