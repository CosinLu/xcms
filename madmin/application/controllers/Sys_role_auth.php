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
        //$this->load->library('category', array('tb_name' => 'sys_col'), 'category');
        $this->role_id = $this->input->get('role_id');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['save_url'] = site_url('sys_cid=' . $this->sys_cid . '&role_id=' . $this->role_id);
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
        $data['list'] = $this->sys_role_auth->get_list();
        foreach ($data['list'] as $key => $val) {
            //$data['list'][$key]['parent_id'] = implode('_', $this->category->parent_id($data['list'], $val['id'], TRUE));
            $data['list'][$key]['auth'] = $this->split_auth($val['auth_ident_str'], $val['auth_name_str'], $val['id']);
            $data['list'][$key]['prefix'] = str_repeat('&nbsp;&nbsp;', ($val['level'] - 1) * 2) . ((!empty($val['level'] - 1) ? '└─&nbsp;' : ''));
        }
        echo json_encode($data);
    }

    //拼接权限
    public function split_auth($ident, $name, $sys_col_id)
    {
        $auth = '';
        if (!empty($ident) && !empty($name)) {
            $ident_arr = explode(',', $ident);
            $name_arr = explode(',', $name);
            foreach ($ident_arr as $key => $val) {
                $auth .= '<label><input type="checkbox" name="auth[' . $sys_col_id . '][]" value="' . $val . '"><ins></ins>' . $name_arr[$key] . '</label>';
            }
        }
        return $auth;
    }

}