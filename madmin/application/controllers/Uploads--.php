<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:11
 */
class Uploads extends M_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('uploads_model', 'uploads');
        $this->load->library('uploadifive');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('uploads/get_list?sys_cid=' . $this->sys_cid);
        $url['insert_btn'] = $this->sys_auth->set_auth(M_INSERT, $this->col_auth, '<a class="btn btn-primary btn-sm" href="' . site_url('uploads/insert?sys_cid=' . $this->sys_cid) . '">新增</a>');
        $url['del_btn'] = $this->sys_auth->set_auth(M_DEL, $this->col_auth, '<a class="btn btn-danger btn-sm batch-del-hook" href="javascript:;" data-tb="uploads" data-checkname="id" data-url = "' . site_url('uploads/batch_del?sys_cid=' . $this->sys_cid) . '">删除</a>');
        $url['search_btn'] = $this->sys_auth->set_auth(M_LOOK, $this->col_auth, '<button type="button" class="btn btn-info btn-sm search-btn-hook">搜索</button>');
        $url['save_url'] = site_url('uploads/save?sys_cid=' . $this->sys_cid);
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('uploads/index.html');
    }

    //获得列表
    public function get_list()
    {
        $key = $this->input->post('key');
        $page = ($this->input->post('page')) ?: 1;
        $data['list'] = $this->uploads->get_list($key, $page);
        foreach ($data['list']['list'] as $key => $val) {
            $data['list']['list'][$key]['del_btn'] = $this->sys_auth->set_auth(M_DEL, $this->col_auth, '<a href="javascript:;" class="del-hook" data-tb="uploads" data-id="' . $val['id'] . '" data-url="' . site_url('uploads/del?sys_cid=' . $this->sys_cid) . '">删除</a>', '<a href="javascript:;" class="disabled">删除</a>');
        }
        echo json_encode($data);
    }

    //删除
    public function del()
    {
        $tbname = $this->input->post('tbname');
        $id = $this->input->post('id');
        $primary = ($this->input->post('primary')) ? $this->input->post('primary') : 'id';
        $rows = $this->uploads->del($tbname, $id, $primary);
        //写入日志
        $this->sys_log->insert($this->section_name, '3', $rows);
        echo $rows;
    }

    //批量删除
    public function batch_del()
    {
        $tbname = $this->input->post('tbname');
        $id = $this->input->post('id');
        $primary = ($this->input->post('primary')) ? $this->input->post('primary') : 'id';
        $rows = $this->uploads->batch_del($tbname, $id, $primary);
        //写入日志
        $this->sys_log->insert($this->section_name, '3', $rows);
        echo $rows;
    }

}