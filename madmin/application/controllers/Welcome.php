<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/22
 * Time: 10:32
 */
class Welcome extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index(){
        $this->load->view('welcome/welcome.html');
    }

}