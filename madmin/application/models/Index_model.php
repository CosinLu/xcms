<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/27
 * Time: 10:47
 */
class Index_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    //验证用户名
    public function check_username($username = '')
    {
        $this->db->where('username', $username);
        $rows = $this->db->get('sys_user')->num_rows();

        return $rows;
    }

    //获的用户信息
    public function user_info($username = '', $password = '')
    {
        $this->db->select('t.*,t.id user_id');
        $this->db->select('(ifnull(t.realname,t.username)) valid_username');
        $this->db->select('t1.role_type,t1.name role_name');
        $this->db->select('t2.login_time last_login_time,t2.login_ip last_login_ip');
        $this->db->from('sys_user t');
        $this->db->join('sys_role t1', 't1.id=t.role_id', 'left');
        $this->db->join('sys_login_log t2', 't2.user_id=t.id', 'left');
        $this->db->where(array(
            't.username' => $username,
            't.password' => md5($password)
        ));
        $this->db->order_by('t2.id desc');
        $result = $this->db->get()->row_array();

        return $result;
    }

    //系统栏目
    public function sys_menu()
    {
        $this->db->from('sys_menu');
        $this->db->where('display', 'show');
        $this->db->order_by('sort asc,id asc');
        $res = $this->db->get()->result_array();

        return $res;
    }

    //添加登录日志
    public function insert_login_log($data = array())
    {
        if (!empty($data)) {
            $this->db->insert('sys_login_log', $data['vals']);
        }
    }

}