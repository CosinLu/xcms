<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/27
 * Time: 10:47
 */
class Welcome_model extends CI_Model
{
    protected $username;
    protected $password;

    public function __construct()
    {
        parent::__construct();
        $this->username = $this->input->post('username');
        $this->password = $this->input->post('password');
        $this->load->library('category');
    }

    //验证用户名
    public function check_username()
    {
        $this->db->where('username', $this->username);
        $rows = $this->db->get('sys_user')->num_rows();
        return $rows;
    }

    //获的用户信息
    public function user_info()
    {
        $this->db->select('t.*,t.id as user_id');
        $this->db->select('(ifnull(t.realname,t.username)) as welcome_name');
        $this->db->select('t1.role_type');
        $this->db->select('t2.login_time as last_login_time,t2.login_ip as last_login_ip');
        $this->db->from('sys_user as t');
        $this->db->join('sys_role as t1', 't1.id=t.role_id', 'left');
        $this->db->join('sys_login_log as t2', 't2.user_id=t.id', 'left');
        $this->db->where(array(
            't.username' => $this->username,
            't.password' => md5($this->password)
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
    public function insert_login_log($user_id = '')
    {
        if (!empty($user_id)) {
            $vals = array(
                'user_id' => $user_id,
                'login_ip' => $this->input->ip_address(),
                'login_time' => time()
            );
            $this->db->insert('sys_login_log', $vals);
        }
    }

}