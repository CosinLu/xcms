<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/26
 * Time: 19:43
 */
class Login extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->full_url = $this->input->get('url');
        $this->set_url();
        //$this->load->model('login_model', 'login');
        $this->load->library('form_validation');
        $this->load->library('category');
    }

    //设置url
    function set_url()
    {
        $url['login_url'] = site_url('login/in?url=' . $this->full_url);
        $url['code'] = site_url('login/code');
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('login/index.html');
    }

    //验证码
    public function code()
    {
        $config = array(
            'width' => 80,
            'height' => 30,
            'font_size' => 16,
            'code_len' => 1
        );
        $this->load->library('code', $config);
        $this->code->show();
    }

    //登录
    public function in(){
        
    }

    //登出
    public function out(){

    }
}