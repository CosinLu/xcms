<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/30
 * Time: 12:45
 */
class Sys_role_auth extends MY_Controller
{
    protected $role_id;

    public function __construct()
    {
        parent::__construct();
        $this->load->model('sys_role_auth_model', 'sys_role_auth');
        $this->role_id = $this->input->get('role_id');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['save_url'] = site_url('sys_role_auth/save?sys_cid=' . $this->sys_cid . '&role_id=' . $this->role_id);
        $url['get_list_url'] = site_url('sys_role_auth/get_list?sys_cid=' . $this->sys_cid . '&role_id=' . $this->role_id);
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('sys_role_auth/index.html');
    }

    //获得列表
    public function get_list()
    {
        $list = $this->sys_role_auth->get_list();
        foreach ($list as $key => $val) {
            $list[$key]['auth'] = $this->split_auth($val['auth_ident_str'], $val['auth_name_str'], $val['id']);
            $list[$key]['prefix'] = str_repeat('&nbsp;&nbsp;', ($val['level'] - 1) * 2) . ((!empty($val['level'] - 1) ? '└─&nbsp;' : ''));
        }
        $str = '';
        $start_level = -1;
        $parent_level = 0;
        foreach ($list as $val) {
            $level = $val['level'];
            if ($start_level < 0) {
                $start_level = $level;
            }
            if ($level < $parent_level) {
                $str .= '</li>' . str_repeat('</ul></li>', $parent_level - $level);
            } elseif ($level > $parent_level) {
                $str .= '<ul data-level="' . ($level) . '">';
            } else {
                $str .= '</li>';
            }
            $str .= '<li>';
            $str .= '<table width="100%" class="table_list">';
            $str .= '<tbody>';
            $str .= '<tr>';
            $str .= '<td width="5%">';
            $str .= '<label><input type="checkbox" name="id[]" value="' . $val['id'] . '" ' . checked($val['id'], $val['sys_col_id']) . '><ins></ins></label>';
            $str .= '</td>';
            $str .= '<td>' . $val['prefix'] . $val['name'] . '</td>';
            $str .= '<td width="45%">' . $this->split_auth($val['auth_ident_str'], $val['auth_name_str'], $val['id'], $val['sys_col_auth_ident_str']) . '</td>';
            $str .= '</tr>';
            $str .= '</tbody>';
            $str .= '</table>';
            $parent_level = $level;
        }
        $str .= str_repeat('</li></ul>', $parent_level - $start_level + 1);
        $data['list'] = $str;
        echo json_encode($data);
    }

    //拼接权限
    public function split_auth($ident, $name, $sys_col_id, $sys_col_auth_ident_str)
    {
        $auth = '';
        if (!empty($ident) && !empty($name)) {
            $ident_arr = explode(',', $ident);
            $name_arr = explode(',', $name);
            foreach ($ident_arr as $key => $val) {
                $auth .= '<label><input type="checkbox" name="auth[' . $sys_col_id . '][]" value="' . $val . '" ' . checked($val, $sys_col_auth_ident_str) . '><ins></ins>' . $name_arr[$key] . '</label>';
            }
        }
        return $auth;
    }

    //保存
    public function save()
    {
        //删除
        $rows = $this->sys_role_auth->del();
        //添加
        $bool = $this->sys_role_auth->add();
        if ($bool) {
            $this->prompt->success('操作成功！', site_url('sys_role_auth?sys_cid=' . $this->sys_cid . '&role_id=' . $this->role_id));
        } else {
            $this->prompt->error('操作失败！', site_url('sys_role_auth?sys_cid=' . $this->sys_cid . '&role_id=' . $this->role_id));
        }
    }

}