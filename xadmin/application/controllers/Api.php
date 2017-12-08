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
    public function __construct()
    {
        parent::__construct();
        $this->load->model('api_model');
    }

    //删除
    public function del()
    {
        $tbname = $this->input->post('tbname');
        $id = explode(',', $this->input->post('id'));
        $primary = $this->input->post('primary') ?: 'id';
        $menu = $this->input->post('menu');
        $rows = $this->api_model->del($tbname, $id, $primary);
        //写入日志
        $this->oplog->insert($menu, '3', $rows);
        echo $rows;
    }

    //修改指定数据
    public function editable()
    {
        $tbname = $this->input->post('tbname');
        $pk = $this->input->post('pk');
        $field = $this->input->post('field');
        $value = $this->input->post('value');
        $bool = $this->api_model->editable($tbname, $pk, $field, $value);

        return $bool;
    }
}