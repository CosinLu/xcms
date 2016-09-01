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
    protected $tb_sys_col;
    protected $tb_sys_col_auth;
    protected $tb_sys_role_auth;

    public function __construct()
    {
        $this->CI = &get_instance();
        $this->sys_cid = $this->CI->input->get('sys_cid');
        $this->tb_sys_col = $this->CI->db->dbprefix . 'sys_col';
        $this->tb_sys_col_auth = $this->CI->db->dbprefix . 'sys_col_auth';
        $this->tb_sys_role_auth = $this->CI->db->dbprefix . 'sys_role_auth';
        $this->CI->load->library('category', array('tb_name' => 'sys_col'), 'sys_auth_category');
    }

    //根据权限获得系统栏目
    public function sys_col($user_info = array())
    {
        if ($user_info['user_type'] = 'dev') {//开发者
            $sql = "select *
                from (
                        select t1.*
                        from " . $this->tb_sys_col_auth . " as t1
                        inner join " . $this->tb_sys_col . " as t2 on t2.id = t1.sys_col_id
                        where t2.display = 'show'
                    ) t
                group by id order by sort asc,id asc";
        } elseif ($user_info['sys_manager'] = '1') {//系统默认
            $sql = "select *
                from (
                        select t1.*
                        from " . $this->tb_sys_col_auth . " as t1
                        inner join " . $this->tb_sys_col . " as t2 on t2.id = t1.sys_col_id
                        where t2.display = 'show' and t1.user_type = '" . $user_info['user_type'] . "'
                    ) t
                group by id order by sort asc,id asc";
        } else {//普通
            $sql = "select *
                from (
                        select t1.*
                        from " . $this->tb_sys_role_auth . " as t1
                        inner join " . $this->tb_sys_col . " as t2 on t2.sys_col_id = t1.id
                        where t2.sys_role_id = " . $user_info['sys_role_id'] . " and t2.display = 'show' and t2.user_type = '" . $user_info['user_type'] . "'
                    ) t
                group by id order by sort asc,id asc";
        }
        $res = $this->CI->db->query($sql)->result_array();
        return $res;

        /*$this->CI->db->from('sys_col');
        $this->CI->db->where('display', 'show');
        $this->CI->db->order_by('sort asc,id asc');
        $res = $this->CI->db->get()->result_array();
        return $res;*/
    }

    //主菜单
    public function menu()
    {
        $sys_col = $this->sys_col();//系统栏目
        $sys_col_sort = $this->CI->sys_auth_category->children($sys_col);//排序后的系统栏目
        $sys_col_parent_id = $this->CI->sys_auth_category->parent_id($sys_col, $this->sys_cid, TRUE);//获得栏目所有上级id
        $sys_col_url = $this->CI->sys_auth_category->children_url($sys_col_sort);//主菜单有效url
        foreach ($sys_col_sort as $key => $val) {
            if ($val['pid'] == 0) {
                $data['menu'][$key] = $val;
                $data['menu'][$key]['url'] = $sys_col_url[$key];
                $data['menu'][$key]['active'] = ($val['id'] == $sys_col_parent_id[0]) ? 'active' : '';
            }
            if ($val['id'] == $this->sys_cid) {
                $data['section_name'] = $val['name'];
            }
        }
        return $data;
    }

    //侧边栏
    public function sidebar()
    {
        $str = '';
        $parent_level = 0;
        $sys_col = $this->sys_col();//系统栏目
        $sys_col_parent_id = $this->CI->sys_auth_category->parent_id($sys_col, $this->sys_cid, TRUE);//获得当前栏目所有上级id
        $sys_col_chidren = $this->CI->sys_auth_category->children($sys_col, $sys_col_parent_id[0]);//获得当前栏目一级栏目的所有下级栏目
        foreach ($sys_col_chidren as $val) {
            $level = $val['level'];
            $dir = ($val['dir']) ? $val['dir'] . '/' : '';
            $sys_ctrl = ($val['ctrl']) ? $val['ctrl'] . '/' : '';
            $method = ($val['method']) ? $val['method'] . '/' : '';
            $param = (!empty($val['param'])) ? '&' . $val['param'] : '';
            $current = ($val['id'] == $this->sys_cid) ? 'current' : '';
            if ($level < $parent_level) {
                $str .= '</li>' . str_repeat('</ul></li>', $parent_level - $level);
            } elseif ($level > $parent_level) {
                $str .= '<ul data-level="' . ($level - 1) . '">';
            } else {
                $str .= '</li>';
            }
            $str .= '<li>';
            if ($dir == '' && $sys_ctrl == '' && $method == '') {
                $str .= '<a href="javascript:;" class="' . $current . '" data-name="mtree_link">';
            } else {
                $str .= '<a href="' . site_url($dir . $sys_ctrl . $method . '?sys_cid=' . $val['id'] . $param) . '" class="' . $current . '" data-name="mtree_link">';
            }
            $str .= '<span data-name="mtree_indent"></span>';
            $str .= '<span data-name="mtree_btn"></span>';
            $str .= '<span data-name="mtree_name">' . $val['name'] . '</span>';
            $str .= '</a>';
            $parent_level = $level;
        }
        $str .= str_repeat('</li></ul>', $parent_level + 1);
        $data['sidebar'] = $str;
        return $data;
    }

}