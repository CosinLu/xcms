<?php
defined('BASEPATH') OR exit('Error');

/**
 * Author: 孟祥涵
 * Date: 2016/5/9
 * Time: 16:31
 * Email: 1056811341@qq.com
 */
class Api extends MY_Controller
{
    protected $menu_name;

    public function __construct()
    {
        parent::__construct();
        $this->load->model('api_model');
        $this->menu_name = (urldecode($this->input->get('menu_name'))) ?: $this->section_name;
    }

    //删除
    public function del()
    {
        $tbname = $this->input->post('tbname');
        $id = $this->input->post('id');
        $primary = $this->input->post('primary') ?: 'id';
        $rows = $this->api_model->del($tbname, $id, $primary);
        //写入日志
        $this->oplog->insert($this->menu_name, '3', $rows);
        echo $rows;
    }

    //批量删除
    public function batch_del()
    {
        $tbname = $this->input->post('tbname');
        $id = explode(',', $this->input->post('id'));
        $primary = $this->input->post('primary') ?: 'id';
        $rows = $this->api_model->batch_del($tbname, $id, $primary);
        //写入日志
        $this->oplog->insert($this->menu_name, '3', $rows);
        echo $rows;
    }
}