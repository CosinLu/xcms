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

}