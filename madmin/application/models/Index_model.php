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
        $this->load->library('category_lib');
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
        $this->db->select('t.*,t.id as user_id');
        $this->db->select('(ifnull(t.realname,t.username)) as valid_username');
        $this->db->select('t1.role_type,t1.name as role_name');
        $this->db->select('t2.login_time as last_login_time,t2.login_ip as last_login_ip');
        $this->db->from('sys_user as t');
        $this->db->join('sys_role as t1', 't1.id=t.role_id', 'left');
        $this->db->join('sys_login_log as t2', 't2.user_id=t.id', 'left');
        $this->db->where(array(
            't.username' => $username,
            't.password' => md5($password)
        ));
        $this->db->order_by('t2.id desc');
        $result = $this->db->get()->row_array();

        return $result;
    }

    //系统栏目
    public function sys_col()
    {
        $this->db->from('sys_col');
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