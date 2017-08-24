<?php
defined('BASEPATH') OR exit('Error');

/**
 * Author: 孟祥涵
 * Date: 2016/5/9
 * Time: 16:31
 * Email: 1056811341@qq.com
 */
class Ajax extends MY_Controller
{
    protected $col_name;

    public function __construct()
    {
        parent::__construct();
        $this->load->model('ajax_model', 'ajax');
        $this->col_name = (urldecode($this->input->get('col_name'))) ?: $this->section_name;
    }

    //删除
    public function del()
    {
        $rows = $this->ajax->del();
        //写入日志
        $this->sys_log->insert($this->col_name, '3', $rows);
        echo $rows;
    }

    //批量删除
    public function batch_del()
    {
        $tbname = $this->input->post('tbname');
        $id = explode(',', $this->input->post('id'));
        $rows = $this->ajax->batch_del($tbname, $id);
        //写入日志
        $this->sys_log->insert($this->col_name, '3', $rows);
        echo $rows;
    }
}