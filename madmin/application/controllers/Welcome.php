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