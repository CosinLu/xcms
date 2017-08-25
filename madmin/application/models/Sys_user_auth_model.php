<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/30
 * Time: 12:51
 */
class Sys_user_auth_model extends M_Model
{
    protected $tb_sys_col;
    protected $tb_sys_col_auth;
    protected $tb_sys_dict;
    protected $tb_sys_user_auth;

    public function __construct()
    {
        parent::__construct();
        $this->tb_sys_col = $this->db->dbprefix . 'sys_col';
        $this->tb_sys_col_auth = $this->db->dbprefix . 'sys_col_auth';
        $this->tb_sys_dict = $this->db->dbprefix . 'sys_dict';
        $this->tb_sys_user_auth = $this->db->dbprefix . 'sys_user_auth';
        $this->load->library('category', array('tb_name' => 'sys_col'), 'category');
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
    public function insert($user_id = '', $id_arr = array(), $auth_arr = array())
    {
        if (!empty($id_arr) && !empty($auth_arr)) {
            $vals = array();
            foreach ($id_arr as $val) {
                if (empty($auth_arr[$val])) {
                    $vals[] = array(
                        'user_id' => $user_id,
                        'col_id' => $val,
                        'col_auth' => ''
                    );
                } else {
                    foreach ($auth_arr[$val] as $item) {
                        $vals[] = array(
                            'user_id' => $user_id,
                            'col_id' => $val,
                            'col_auth' => $item
                        );
                    }
                }
            }
            $bool = $this->db->insert_batch('sys_user_auth', array_reverse($vals));
            return $bool;
        }
    }

}