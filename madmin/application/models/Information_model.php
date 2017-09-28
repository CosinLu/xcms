<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/9/5
 * Time: 17:34
 */
class Information_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('tree');
    }

    //获取信息栏目
    public function cols()
    {
        $this->db->select('t.*');
        $this->db->select('t1.sys_tpl');
        $this->db->from('category t');
        $this->db->join('template t1', 't1.id=t.tpl_id', 'left');
        $this->db->where('t.display', 'show');
        $this->db->order_by('t.sort asc,t.id asc');
        $res = $this->db->get()->result_array();
        $res = $this->tree->serialize($res);

        return $res;
    }

    //获取当前栏目的模板标识
    public function tpl_id($cid = '')
    {
        $this->db->select('tpl_id');
        $this->db->where(array('id' => $cid));
        $res = $this->db->get('category')->row_array();

        return $res['tpl_id'];
    }

    //获取所有数据
    public function data()
    {
        $this->db->where('display', 'show');
        $res = $this->db->get('category')->result_array();

        return $res;
    }

}