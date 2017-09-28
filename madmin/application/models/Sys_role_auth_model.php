<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/30
 * Time: 12:51
 */
class Sys_role_auth_model extends CI_Model
{
    protected $tb_sys_menu;
    protected $tb_sys_menu_auth;
    protected $tb_common_dict;
    protected $tb_sys_role_auth;

    public function __construct()
    {
        parent::__construct();
        $this->tb_sys_menu = $this->db->dbprefix . 'sys_menu';
        $this->tb_sys_menu_auth = $this->db->dbprefix . 'sys_menu_auth';
        $this->tb_common_dict = $this->db->dbprefix . 'common_dict';
        $this->tb_sys_role_auth = $this->db->dbprefix . 'sys_role_auth';
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
                        'role_id' => $role_id,
                        'sys_menu_id' => $val,
                        'sys_menu_auth' => ''
                    );
                } else {
                    foreach ($auth_arr[$val] as $item) {
                        $vals[] = array(
                            'role_id' => $role_id,
                            'sys_menu_id' => $val,
                            'sys_menu_auth' => $item
                        );
                    }
                }
            }
            $bool = $this->db->insert_batch('sys_role_auth', array_reverse($vals));

            return $bool;
        }
    }

}