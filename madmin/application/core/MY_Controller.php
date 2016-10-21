<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/22
 * Time: 10:05
 */
class MY_Controller extends CI_Controller
{
    protected $sys_session;
    protected $sys_cid;//系统栏目标识
    protected $prferer;//上一个页面url
    protected $is_save;//保存：1=保存，2=保存并继续新增
    protected $col_auth;
    protected $section_name;//栏目名称

    public function __construct()
    {
        parent::__construct();
        $this->sys_session = $this->session->sys_session;
        $this->sys_cid = $this->input->get('sys_cid');
        $this->check_login();
        $this->peferer = (isset($_SERVER['HTTP_REFERER'])) ? $_SERVER['HTTP_REFERER'] : '';
        $this->is_save = ($this->input->post('is_save') == '') ? '1' : $this->input->post('is_save');
        $this->col_auth = '';
        $this->load->library('category', array(), 'my_category');
        $this->load->library('sys_auth', array(
            'user_info' => $this->sys_session,
            'sys_cid' => $this->sys_cid
        ));
        $this->menu();
        $this->sidebar();
    }

    //登录验证
    public function check_login()
    {
        $pre_url = urlencode('http://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI']);
        if (empty($this->sys_session)) {
            $this->prompt->error('登录超时！', site_url('welcome?url=' . $pre_url));
        }
    }

    //主菜单
    public function menu()
    {
        $sys_col = $this->sys_auth->sys_col();//系统栏目
        $sys_col_parent_id = $this->my_category->parent_id($sys_col, $this->sys_cid, TRUE);//获得栏目所有上级id
        $sys_col_url = $this->my_category->children_url($sys_col);//主菜单有效url
        foreach ($sys_col as $key => $val) {
            if ($val['pid'] == 0) {
                $data['menu'][$key] = $val;
                $data['menu'][$key]['url'] = $sys_col_url[$key];
                $data['menu'][$key]['active'] = ($val['id'] == $sys_col_parent_id[0]) ? 'active' : '';
                $data['menu'][$key]['color'] = ($val['user_type'] == 'dev' OR $val['display'] == 'hide') ? '#35ebff' : '';
            }
            if ($val['id'] == $this->sys_cid) {
                $data['section_name'] = $val['name'];
                $this->col_auth = $val['col_auth'];
            }
        }
        $this->section_name = $data['section_name'];
        $this->load->vars($data);
    }

    //侧边栏
    public function sidebar()
    {
        $str = '';
        $parent_level = 0;
        $sys_col = $this->sys_auth->sys_col();//系统栏目
        $sys_col_parent_id = $this->my_category->parent_id($sys_col, $this->sys_cid, TRUE);//获得当前栏目所有上级id
        $sys_col_chidren = $this->my_category->children($sys_col, $sys_col_parent_id[0]);//获得当前栏目一级栏目的所有下级栏目
        foreach ($sys_col_chidren as $val) {
            $level = $val['level'];
            $dir = ($val['dir']) ? $val['dir'] . '/' : '';
            $sys_ctrl = ($val['ctrl']) ? $val['ctrl'] . '/' : '';
            $method = ($val['method']) ? $val['method'] . '/' : '';
            $param = (!empty($val['param'])) ? '&' . $val['param'] : '';
            $color = ($val['user_type'] == 'dev' OR $val['display'] == 'hide') ? '#35ebff' : '';
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
            $str .= '<span data-name="mtree_name" style="color:' . $color . '">' . $val['name'] . '</span>';
            $str .= '</a>';
            $parent_level = $level;
        }
        $str .= str_repeat('</li></ul>', $parent_level + 1);
        $data['sidebar'] = $str;
        $this->load->vars($data);
    }


}