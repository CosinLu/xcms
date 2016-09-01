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
    protected $tb_sys_col;
    protected $tb_sys_col_auth;
    protected $tb_sys_dict;
    protected $tb_sys_role_auth;

    public function __construct()
    {
        parent::__construct();
        $this->role_id = $this->input->get('role_id');
        $this->tb_sys_col = $this->db->dbprefix . 'sys_col';
        $this->tb_sys_col_auth = $this->db->dbprefix . 'sys_col_auth';
        $this->tb_sys_dict = $this->db->dbprefix . 'sys_dict';
        $this->tb_sys_role_auth = $this->db->dbprefix . 'sys_role_auth';
        $this->load->library('category', array('tb_name' => 'sys_col'), 'category');
    }

    //获得列表
    public function get_list()
    {
        $sql = "SELECT
                t.*, GROUP_CONCAT(t2.name) AS auth_name_str,
                GROUP_CONCAT(t2.ident) AS auth_ident_str,
                    t3.sys_col_auth_ident_str,
                t3.sys_col_id
            FROM
                " . $this->tb_sys_col . " as t
            LEFT JOIN " . $this->tb_sys_col_auth . " as t1 ON t1.sys_col_id = t.id
            LEFT JOIN " . $this->tb_sys_dict . " as t2 ON t2.ident = t1.sys_col_auth
            LEFT JOIN (
                SELECT
                    GROUP_CONCAT(sys_col_auth_ident) AS sys_col_auth_ident_str,
                    sys_col_id
                FROM
                    " . $this->tb_sys_role_auth . "
                WHERE sys_role_id=" . $this->role_id . "
                GROUP BY
                    sys_col_id
            ) AS t3 ON t3.sys_col_id = t.id
            WHERE
                t.display = 'show'
            AND t.user_type = 'pro'
            GROUP BY
                t.id";
        $res = $this->db->query($sql)->result_array();
        $list = $this->category->children($res);
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