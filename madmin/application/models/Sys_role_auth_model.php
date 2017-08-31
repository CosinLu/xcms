<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/30
 * Time: 12:51
 */
class Sys_role_auth_model extends M_Model
{
    protected $tb_sys_col;
    protected $tb_sys_col_auth;
    protected $tb_sys_dict;
    protected $tb_sys_role_auth;

    public function __construct()
    {
        parent::__construct();
        $this->tb_sys_col = $this->db->dbprefix . 'sys_col';
        $this->tb_sys_col_auth = $this->db->dbprefix . 'sys_col_auth';
        $this->tb_sys_dict = $this->db->dbprefix . 'sys_dict';
        $this->tb_sys_role_auth = $this->db->dbprefix . 'sys_role_auth';
        $this->load->library('category', array('tb_name' => 'sys_col'), 'category');
    }

    //删除
    public function del($role_id = '')
    {
        $this->db->where('role_id', $role_id);
        $this->db->delete('sys_role_auth');
        $rows = $this->db->affected_rows();

        return $rows;
    }

    //添加权限
    public function insert($role_id = '', $id_arr = array(), $auth_arr = array())
    {
        if (!empty($id_arr) && !empty($auth_arr)) {
            $vals = array();
            foreach ($id_arr as $val) {
                if (empty($auth_arr[$val])) {
                    $vals[] = array(
                        'role_id'  => $role_id,
                        'col_id'   => $val,
                        'col_auth' => ''
                    );
                } else {
                    foreach ($auth_arr[$val] as $item) {
                        $vals[] = array(
                            'role_id'  => $role_id,
                            'col_id'   => $val,
                            'col_auth' => $item
                        );
                    }
                }
            }
            $bool = $this->db->insert_batch('sys_role_auth', array_reverse($vals));

            return $bool;
        }
    }

}