<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/22
 * Time: 10:32
 */
class Welcome extends M_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('category', array('tb_name' => 'sys_col'), 'category');

        $config['image_library'] = 'gd2';
        $config['source_image'] = '/uploads/20170906/e76150cd62db4300380d316d3a7213b4.jpg';
        $config['create_thumb'] = TRUE;
        $config['maintain_ratio'] = TRUE;
        $config['dynamic_output'] = TRUE;
        //$config['new_image'] = '/uploads/20170906/e76150cd62db4300380d316d3a7213b4_75_50.jpg';
        $config['width'] = 75;
        $config['height'] = 50;
        $this->load->library('image_lib', $config);
        if ( ! $this->image_lib->resize())
        {
            echo $this->image_lib->display_errors();die;
        }
    }

    public function index()
    {
        $data['valid_username'] = $this->session->sys_session['valid_username'];
        $data['role_name'] = $this->session->sys_session['role_name'];
        $data['last_login_time'] = ($this->session->sys_session['last_login_time']) ? date('Y-m-d H:i:s', $this->session->sys_session['last_login_time']) : '-';
        $data['last_login_ip'] = ($this->session->sys_session['last_login_ip']) ?: '-';
        $data['server_info'] = $_SERVER['SERVER_SOFTWARE'];
        $data['server_name'] = $_SERVER['SERVER_NAME'];
        $data['upload'] = $this->config->item('upload');
        $this->load->view('welcome/index.html', $data);
    }

}