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
        $list = $this->sys_auth->sys_col('role', $this->input->get('role_id'));
        foreach ($list as $key => $val) {
            $list[$key]['auth'] = $this->split_auth($val['col_auth'], $val['col_auth_name'], $val['id']);
            $list[$key]['prefix'] = str_repeat('&nbsp;&nbsp;', ($val['level'] - 1) * 2) . (($val['level'] > 1) ? '└─&nbsp;' : '');
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
            $str .= '<div class="li-mhook">';
            $str .= '<div class="auth_control checkbox"><label><input type="checkbox" name="id[]" value="' . $val['id'] . '" ' . checked($val['id'], $val['col_id']) . '><ins></ins></label></div>';
            $str .= '<div class="auth_type checkbox">' . $this->split_auth($val['col_auth'], $val['col_auth_name'], $val['id'], $val['col_auth_str']) . '</div>';
            $str .= '<div class="auth_name">' . $val['prefix'] . $val['name'] . '</div>';
            $str .= '</div>';
            $parent_level = $level;
        }
        $str .= str_repeat('</li></ul>', $parent_level - $start_level + 1);
        $data['list'] = $str;
        echo json_encode($data);
    }

    //拼接权限
    public function split_auth($ident, $name, $col_id, $checked = '')
    {
        $auth = '';
        if (!empty($ident) && !empty($name)) {
            $ident_arr = explode(',', $ident);
            $name_arr = explode(',', $name);
            foreach ($ident_arr as $key => $val) {
                $auth .= '<label><input type="checkbox" name="auth[' . $col_id . '][]" value="' . $val . '" ' . checked($val, $checked) . '><ins>' . $name_arr[$key] . '</ins></label>';
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
        $bool = $this->sys_role_auth->insert();
        //写入日志
        $this->sys_log->insert('角色权限', '2', $bool);
        $config['icon'] = 1;
        if ($bool OR $rows) {
            echo json_encode($config);
        } else {
            $config['icon'] = 2;
            echo json_encode($config);
        }
    }

}