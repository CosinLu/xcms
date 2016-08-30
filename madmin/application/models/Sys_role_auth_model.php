<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/30
 * Time: 12:51
 */
class Sys_role_auth_model extends MY_Model
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('category', array('tb_name' => 'sys_col'), 'category');
    }

    public function get_list()
    {
        $this->db->select('sys_col.*');
        $this->db->select('GROUP_CONCAT(sys_dict.name) as auth_name_str,GROUP_CONCAT(sys_dict.ident) as auth_ident_str');
        $this->db->from('sys_col');
        $this->db->join('sys_col_auth', 'sys_col_auth.sys_col_id = sys_col.id', 'left');
        $this->db->join('sys_dict', 'sys_dict.ident = sys_col_auth.sys_col_auth', 'left');
        $this->db->where(array(
            'display' => "show",
            'user_type' => 'pro'
        ));
        $this->db->group_by('sys_col.id');
        $res = $this->db->get()->result_array();
        $list = $this->category->children($res);
        return $list;
    }

}