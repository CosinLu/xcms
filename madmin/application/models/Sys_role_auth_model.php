<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/30
 * Time: 12:51
 */
class Sys_role_auth_model extends MY_Model
{
    protected $role_id;

    public function __construct()
    {
        parent::__construct();
        $this->role_id = $this->input->get('role_id');
        $this->load->library('category', array('tb_name' => 'sys_col'), 'category');
    }

    //获得列表
    public function get_list()
    {
        $this->db->select('sys_col.*');
        $this->db->select('GROUP_CONCAT(sys_dict.name) as auth_name_str,GROUP_CONCAT(sys_dict.ident) as auth_ident_str');
        $this->db->select('GROUP_CONCAT(sys_role_auth.sys_col_auth_ident) as sys_col_auth_ident_str,sys_role_auth.sys_col_id');
        $this->db->from('sys_col');
        $this->db->join('sys_col_auth', 'sys_col_auth.sys_col_id = sys_col.id', 'left');
        $this->db->join('sys_dict', 'sys_dict.ident = sys_col_auth.sys_col_auth', 'left');
        $this->db->join('sys_role_auth', 'sys_role_auth.sys_col_id=sys_col.id and sys_role_auth.sys_role_id=' . $this->role_id, 'left');
        $this->db->where(array(
            'sys_col.display' => "show",
            'sys_col.user_type' => 'pro'
        ));
        $this->db->group_by('sys_col.id');
        $res = $this->db->get()->result_array();
        $list = $this->category->children($res);
        echo $this->db->last_query();
        var_dump($list);
        die;
        return $list;
    }

    //删除
    public function del()
    {
        $this->db->where('sys_role_id', $this->role_id);
        $this->db->delete('sys_role_auth');
        $rows = $this->db->affected_rows();
        return $rows;
    }

    //添加权限
    public function add()
    {
        $sys_col_id_arr = $this->input->post('id');
        $sys_col_auth_ident_arr = $this->input->post('auth');
        $vals = array();
        foreach ($sys_col_id_arr as $val) {
            if (empty($sys_col_auth_ident_arr[$val])) {
                $vals[] = array(
                    'sys_role_id' => $this->role_id,
                    'sys_col_id' => $val,
                    'sys_col_auth_ident' => ''
                );
            } else {
                foreach ($sys_col_auth_ident_arr[$val] as $item) {
                    $vals[] = array(
                        'sys_role_id' => $this->role_id,
                        'sys_col_id' => $val,
                        'sys_col_auth_ident' => $item
                    );
                }
            }
        }
        $bool = $this->db->insert_batch('sys_role_auth', array_reverse($vals));
        return $bool;
    }

}