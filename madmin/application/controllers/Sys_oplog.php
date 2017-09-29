<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:11
 */
class Sys_oplog extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('sys_oplog_model');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('sys_oplog/get_list');
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('sys_oplog/index.html');
    }

    //获取列表
    public function get_list()
    {
        $page = ($this->input->post('page')) ?: 1;
        $start_time = $this->input->post('start_time');
        $stop_time = $this->input->post('stop_time');
        $data['list'] = $this->sys_oplog_model->get_list($page, $start_time, $stop_time);
        foreach ($data['list']['list'] as $key => $val) {
            $data['list']['list'][$key]['status_name'] = '<span style="color:' . $val['status_color'] . ';">' . $val['status_name'] . '</span>';
            $data['list']['list'][$key]['time'] = date('Y-m-d H:i:s', $val['time']);
            $data['list']['list'][$key]['content'] = '用户&nbsp;<b>' . (($val['username']) ?: '-') . '</b>&nbsp;在&nbsp;<span class="text-danger">' . (($val['col_name']) ?: '-') . '</span>&nbsp;中进行了&nbsp;<span class="text-info">' . (($val['opera_name']) ?: '-') . '</span>&nbsp;操作';
            $data['list']['list'][$key]['browser'] = $val['browser'] . '(' . $val['version'] . ')';
        }
        echo json_encode($data);
    }

}