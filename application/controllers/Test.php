<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2017/3/24
 * Time: 15:24
 */
class Test extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $segment = $this->uri->segment(1);
        $this->$segment();
    }

    public function news()
    {
        var_dump('新闻列表');
        die;
    }

    public function cases()
    {
        var_dump('案例列表');
        die;
    }

    public function about()
    {
        var_dump('关于我们');
        die;
    }

}