<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/22
 * Time: 10:05
 */
class M_Controller extends CI_Controller
{
    protected $sys_session;
    //系统栏目标识
    protected $sys_cid;
    //上一个页面url
    protected $prferer;
    //保存：1=保存，2=保存并继续新增
    protected $is_save;
    protected $col_auth;
    //栏目名称
    protected $section_name;

    public function __construct()
    {
        parent::__construct();
        $this->sys_cid = $this->input->get('sys_cid');
        $this->check_login();
        $this->peferer = (isset($_SERVER['HTTP_REFERER'])) ? $_SERVER['HTTP_REFERER'] : '';
        $this->is_save = ($this->input->post('is_save') == '') ? '1' : $this->input->post('is_save');
        $this->col_auth = '';
        $this->load->library('category', array(), 'my_category');
        $this->load->library('sys_auth', array(
            'user_info' => $this->session->sys_session
        ));
        $this->menu();
        $this->sidebar();
    }

    //登录验证
    public function check_login()
    {
        $pre_url = urlencode('http://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI']);
        if (empty($this->session->sys_session)) {
            $this->prompt->error('登录超时', site_url('index?url=' . $pre_url));
        }
    }

    //主菜单
    public function menu()
    {
        $data['menu'] = array();
        $data['section_name'] = '';
        //系统栏目
        $sys_col = $this->sys_auth->sys_col();
        //获得栏目所有上级id
        $sys_col_parent_id = $this->my_category->parent_id($sys_col, $this->sys_cid, TRUE);
        if (!empty($sys_col_parent_id)) {
            //主菜单有效url
            $sys_col_url = $this->my_category->children_url($sys_col);
            foreach ($sys_col as $key => $val) {
                if ($val['pid'] == 0) {
                    $data['menu'][$key] = $val;
                    $data['menu'][$key]['url'] = $sys_col_url[$key];
                    $data['menu'][$key]['active'] = ($val['id'] == $sys_col_parent_id[0]) ? 'active' : '';
                }
                if ($val['id'] == $this->sys_cid) {
                    $data['section_name'] = $val['name'];
                    $this->col_auth = $val['col_auth'];
                }
            }
        }
        $this->section_name = $data['section_name'];
        $data['header']['valid_username'] = $this->session->sys_session['valid_username'];
        $this->load->vars($data);
    }

    //侧边栏
    public function sidebar()
    {
        $this->load->driver('cache', array('adapter' => 'apc', 'backup' => 'file'));
        $str = '';
        $parent_level = 0;
        //系统栏目
        $sys_col = $this->sys_auth->sys_col();
        //获得当前栏目所有上级id
        $sys_col_parent_id = $this->my_category->parent_id($sys_col, $this->sys_cid, TRUE);
        if (!empty($sys_col_parent_id)) {
            //获得当前栏目一级栏目的所有下级栏目
            $sys_col_chidren = $this->my_category->children($sys_col, $sys_col_parent_id[0]);
            foreach ($sys_col_chidren as $val) {
                $level = $val['level'];
                $n = strpos($val['url'], '?');
                $conn = ($n) ? '&' : '?';
                $current = ($val['id'] == $this->sys_cid) ? 'current' : '';
                $indent = (35 * ($level - 2)) . 'px';
                if ($level < $parent_level) {
                    $str .= '</li>' . str_repeat('</ul></li>', $parent_level - $level);
                } elseif ($level > $parent_level) {
                    $str .= '<ul data-level="' . ($level - 1) . '">';
                } else {
                    $str .= '</li>';
                }
                $str .= '<li>';
                if (empty($val['url'])) {
                    $str .= '<a href="javascript:;" class="' . $current . ' mtree_link mtree-link-hook">';
                } else {
                    $str .= '<a href="javascript:;" data-url="' . site_url($val['url'] . $conn . 'sys_cid=' . $val['id']) . '" class="' . $current . ' mtree_link mtree-link-hook">';
                }
                $str .= '<div class="mtree_indent mtree-indent-hook" style="width:' . $indent . '"></div>';
                $str .= '<div class="mtree_btn mtree-btn-hook"></div>';
                if ($val['icon']) {
                    $str .= '<div class="mtree_icon mtree-icon-hook"><i class="' . $val['icon'] . '"></i></div>';
                }
                $str .= '<div class="mtree_name mtree-name-hook">' . $val['name'];
                if ($val['user_type'] == $this->config->item('dev','mcms')) {
                    $str .= '<span class="label label-danger">' . $val['user_type'] . '</span>';
                }
                $str .= '</div>';
                $str .= '</a>';
                $parent_level = $level;
            }
            $str .= str_repeat('</li></ul>', $parent_level + 1);
        }
        $data['sidebar'] = $str;
        $this->load->vars($data);
    }


}