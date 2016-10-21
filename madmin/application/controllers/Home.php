<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/22
 * Time: 10:32
 */
class Home extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('category', array('tb_name' => 'sys_col'), 'category');
    }

    public function index()
    {
        $data['username'] = $this->sys_session['username'];
        $data['realname'] = ($this->sys_session['realname']) ?: '-';
        $data['last_login_time'] = ($this->sys_session['last_login_time']) ? date('Y-m-d H:i:s', $this->sys_session['last_login_time']) : '-';
        $data['last_login_ip'] = ($this->sys_session['last_login_ip']) ?: '-';
        $data['server_info'] = $_SERVER['SERVER_SOFTWARE'];
        $data['operating_system'] = PHP_OS;
        $this->load->view('home/home.html', $data);
    }

}