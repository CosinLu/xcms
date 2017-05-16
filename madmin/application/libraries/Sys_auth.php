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
        $this->CI =& get_instance();
        $this->sys_cid = (isset($arr['sys_cid'])) ? $arr['sys_cid'] : '';
        $this->user_info = (isset($arr['user_info'])) ? $arr['user_info'] : '';
        $this->CI->load->library('category', array('tb_name' => 'sys_col'), 'sys_auth_category');
    }

    //根据权限获得系统栏目
    public function sys_col()
    {
        $role_type = $this->user_info['role_type'];
        $role_id = $this->user_info['role_id'];
        if ($role_type == '1') {//系统默认
            $this->CI->db->select('t.*');
            $this->CI->db->select('group_concat(t1.col_auth) as col_auth');
            $this->CI->db->from('sys_col as t');
            $this->CI->db->join('sys_col_auth as t1', 't1.col_id=t.id', 'left');
            $this->CI->db->where(array(
                't.display' => 'show'
            ));
        } else {//其他
            $this->CI->db->select('t.*');
            $this->CI->db->select('group_concat(t1.col_auth) as col_auth');
            $this->CI->db->from('sys_col as t');
            $this->CI->db->join('sys_role_auth as t1', 't1.col_id=t.id', 'left');
            $this->CI->db->where(array(
                't.display' => 'show',
                't1.role_id' => $role_id
            ));
        }
        $this->CI->db->group_by('t.id');
        $this->CI->db->order_by('t.sort asc,t.id asc');
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
        //$peferer = (isset($_SERVER['HTTP_REFERER'])) ? $_SERVER['HTTP_REFERER'] : '';
        $current_auth_arr = explode(',', strtolower($current_auth));
        if ($have_auth_str != '') {
            if (in_array(strtolower($initial_auth), $current_auth_arr)) {
                return $have_auth_str;
            }
        } else {
            if (!in_array(strtolower($initial_auth), $current_auth_arr)) {
                $this->CI->prompt->error('非法操作！', site_url('welcome/logout'));
            }
        }
        return $no_auth_str;
    }

}