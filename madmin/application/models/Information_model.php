<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/9/5
 * Time: 17:34
 */
class Information_model extends MY_Model
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('category', array('tb_name' => 'info_col'), 'category');
    }

    //获得信息栏目
    public function info_col()
    {
        $this->db->select('t.*');
        $this->db->select('t1.sys_ctrl');
        $this->db->from('info_col as t');
        $this->db->join('info_type as t1', 't1.id=t.info_type_id', 'left');
        $this->db->where('t.display', 'show');
        $this->db->order_by('t.sort asc,t.id asc');
        $res = $this->db->get()->result_array();
        $res = $this->category->children($res);
        return $res;
    }

}