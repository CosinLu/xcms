<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/9/5
 * Time: 17:34
 */
class Info_model extends M_Model
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('category_lib', array('tb_name' => 'info_col'), 'category_lib');
    }

    //获得信息栏目
    public function cols()
    {
        $this->db->select('t.*');
        $this->db->select('t1.sys_tpl');
        $this->db->from('info_col as t');
        $this->db->join('sys_tpl as t1', 't1.id=t.tpl_id', 'left');
        $this->db->where('t.display', 'show');
        $this->db->order_by('t.sort asc,t.id asc');
        $res = $this->db->get()->result_array();
        $res = $this->category_lib->children($res);

        return $res;
    }

    //获得当前栏目的模板标识
    public function tpl_id($cid = '')
    {
        $this->db->select('tpl_id');
        $this->db->where(array('id' => $cid));
        $res = $this->db->get('info_col')->row_array();

        return $res['tpl_id'];
    }

}