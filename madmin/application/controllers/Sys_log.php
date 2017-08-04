<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:11
 */
class Sys_log extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('sys_log_model', 'sys_log');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('sys_log/get_list?sys_cid=' . $this->sys_cid);
        $url['search_btn'] = $this->sys_auth->set_auth(MYLOOK, $this->col_auth, '<button type="button" data-name="searchbtn" class="btn btn-info">搜索</button>');
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('sys_log/index.html');
    }

    //获得列表
    public function get_list()
    {
        $data['list'] = $this->sys_log->get_list();
        foreach ($data['list']['list'] as $key => $val) {
            $data['list']['list'][$key]['time'] = date('Y-m-d H:i:s', $val['time']);
            $data['list']['list'][$key]['content'] = '用户&nbsp;<b>' . (($val['username']) ?: '-') . '</b>&nbsp;在&nbsp;<span class="text-danger">' . (($val['col_name']) ?: '-') . '</span>&nbsp;中进行了&nbsp;<span class="text-primary">' . (($val['opera_name']) ?: '-') . '</span>&nbsp;操作';
            $data['list']['list'][$key]['browser'] = $val['browser'] . '(' . $val['version'] . ')';
        }
        echo json_encode($data);
    }

}