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

        $this->load->library('ueditor_lib');
        $this->ueditor_lib->edit_upload_path();

        /*ob_start();//打开输出
        readfile('https://img13.360buyimg.com/da/jfs/t7885/161/2347453549/131863/fda1bafe/59acb035N27eebd4e.jpg');//输出图片文件
        $img = ob_get_contents();//得到浏览器输出
        ob_end_clean();//清除输出并关闭

        $bool = file_put_contents('D:/wamp/www/uploads/3.jpg', $img);
        $size = getimagesize('https://img13.360buyimg.com/da/jfs/t7885/161/2347453549/131863/fda1bafe/59acb035N27eebd4e.jpg');
        var_dump($size);
        var_dump($bool);
        die;*/
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