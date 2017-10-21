<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/30
 * Time: 12:51
 */
class Sys_user_auth_model extends CI_Model
{
    protected $tb_sys_menu;
    protected $tb_sys_menu_auth;
    protected $tb_common_dict;
    protected $tb_sys_user_auth;

    public function __construct()
    {
        parent::__construct();
        $this->tb_sys_menu = $this->db->dbprefix . 'sys_menu';
        $this->tb_sys_menu_auth = $this->db->dbprefix . 'sys_menu_auth';
        $this->tb_common_dict = $this->db->dbprefix . 'common_dict';
        $this->tb_sys_user_auth = $this->db->dbprefix . 'sys_user_auth';
    }

    //删除
    public function del($user_id = '')
    {
        $this->db->where('user_id', $user_id);
        $this->db->delete('sys_user_auth');
        $rows = $this->db->affected_rows();

        return $rows;
    }

    //添加权限
    public function insert($user_id = '', $id = array(), $auth = array())
    {
        if (!empty($id) && !empty($auth)) {
            $vals = array();
            foreach ($id as $val) {
                if (empty($auth[$val])) {
                    $vals[] = array(
                        'user_id' => $user_id,
                        'sys_menu_id' => $val,
                        'sys_menu_auth' => ''
                    );
                } else {
                    foreach ($auth[$val] as $item) {
                        $vals[] = array(
                            'user_id' => $user_id,
                            'sys_menu_id' => $val,
                            'sys_menu_auth' => $item
                        );
                    }
                }
            }
            $bool = $this->db->insert_batch('sys_user_auth', array_reverse($vals));

            return $bool;
        }
    }

}