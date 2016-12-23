<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/9/5
 * Time: 17:34
 */
class Information_model extends MY_Model
{
    protected $cid;

    public function __construct()
    {
        parent::__construct();
        $this->load->library('category', array('tb_name' => 'info_col'), 'category');
        $this->cid = $this->input->get('cid');
    }

    //获得信息栏目
    public function info_col()
    {
        $this->db->select('t.*');
        $this->db->select('t1.sys_ctrl');
        $this->db->from('info_col as t');
        $this->db->join('sys_tpl as t1', 't1.id=t.sys_tpl_id', 'left');
        $this->db->where('t.display', 'show');
        $this->db->order_by('t.sort asc,t.id asc');
        $res = $this->db->get()->result_array();
        $res = $this->category->children($res);
        return $res;
    }

    //获得当前栏目的模板类型标识
    public function sys_tpl_id()
    {
        $this->db->select('sys_tpl_id');
        $this->db->where(array('id' => $this->cid));
        $res = $this->db->get('info_col')->row_array();
        return $res['sys_tpl_id'];
    }

}