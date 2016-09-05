<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/9/5
 * Time: 18:28
 */
class Info_single extends MY_info_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('info_single_model', 'info_single');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['save_url'] = '';
        $this->load->vars($url);
    }

    public function index()
    {
        $data['item'] = $this->info_single->index();
        $this->load->view('info_single/update.html', $data);
    }

}