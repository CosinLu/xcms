<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2017/3/24
 * Time: 16:08
 */
class Show extends CI_Controller
{
    protected $id;

    public function __construct()
    {
        parent::__construct();
        $this->id = $this->uri->segment(3, 0);
        if ($this->id == 0) {
            show_404('http://www.baidu.com');
            die;
        }
    }

    public function index()
    {
        $method = $this->uri->segment(1) . '_show';
        $this->$method($this->id);
    }

    public function news_show($id = '')
    {
        var_dump('新闻详情' . $id);
        die;
    }

    public function cases_show($id = '')
    {
        var_dump('案例详情' . $id);
        die;
    }

}