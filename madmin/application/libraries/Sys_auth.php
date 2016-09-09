<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/9/1
 * Time: 16:26
 */
class Sys_auth
{
    protected $CI;
    protected $sys_cid;
    protected $user_info;

    public function __construct($arr = array())
    {
        $this->CI = &get_instance();
        $this->sys_cid = (isset($arr['sys_cid'])) ? $arr['sys_cid'] : '';
        $this->user_info = (isset($arr['user_info'])) ? $arr['user_info'] : '';
        $this->CI->load->library('category', array('tb_name' => 'sys_col'), 'sys_auth_category');
    }

    //根据权限获得系统栏目
    public function sys_col()
    {
        $user_type = $this->user_info['user_type'];
        $sys_manager = $this->user_info['sys_manager'];
        $role_id = $this->user_info['role_id'];
        if ($user_type == 'dev') {//开发者
            $this->CI->db->select('t1.*');
            $this->CI->db->select('group_concat(t2.col_auth) as col_auth');
            $this->CI->db->from('sys_col as t1');
            $this->CI->db->join('sys_col_auth as t2', 't2.col_id=t1.id', 'left');
            $this->CI->db->where(array(
                't1.display' => 'show'
            ));
        } elseif ($user_type == 'pro' && $sys_manager == '1') {//系统默认
            $this->CI->db->select('t1.*');
            $this->CI->db->select('group_concat(t2.col_auth) as col_auth');
            $this->CI->db->from('sys_col as t1');
            $this->CI->db->join('sys_col_auth as t2', 't2.col_id=t1.id', 'left');
            $this->CI->db->where(array(
                't1.display' => 'show',
                't1.user_type' => $user_type
            ));
        } else {//普通
            $this->CI->db->select();
            $this->CI->db->from('sys_col as t1');
            $this->CI->db->join('sys_role_auth as t2', 't2.col_id=t1.id', 'left');
            $this->CI->db->where(array(
                't1.display' => 'show',
                't1.user_type' => $user_type,
                't2.role_id' => $role_id
            ));
        }
        $this->CI->db->group_by('t1.id');
        $this->CI->db->order_by('t1.sort asc,t1.id asc');
        $res = $this->CI->db->get()->result_array();
        $res_sort = $this->CI->sys_auth_category->children($res);
        return $res_sort;
    }

    /**
     * 根据权限输出字符串
     * @param string $initial_auth 所需权限
     * @param string $current_auth 当前拥有权限
     * @param string $have_auth_str 有权限时输出的字符串
     * @param string $no_auth_str 无权限时输出的字符串
     * @return string
     */
    public function set_auth($initial_auth = '', $current_auth = '', $have_auth_str = '', $no_auth_str = '')
    {
        $current_auth_arr = explode(',', strtolower($current_auth));
        if (in_array(strtolower($initial_auth), $current_auth_arr)) {
            return $have_auth_str;
        }
        return $no_auth_str;
    }

}