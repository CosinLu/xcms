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
        $this->db->select('t.*,t.id as sys_user_id');
        $this->db->select('t1.role_type');
        $this->db->from('sys_user as t');
        $this->db->join('sys_role as t1', 't1.id=t.sys_role_id', 'left');
        $this->db->where(array(
            't.username' => $this->username,
            't.password' => md5($this->password)
        ));
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

}