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
    //上一个页面url
    protected $prferer;
    //保存：1=保存，2=保存并继续新增
    protected $is_save;
    protected $sys_menu_auth;
    //栏目名称
    protected $section_name;

    public function __construct()
    {
        parent::__construct();
        $this->check_login();
        $this->peferer = (isset($_SERVER['HTTP_REFERER'])) ? $_SERVER['HTTP_REFERER'] : '';
        $this->submit_type = ($this->input->post('submit_type') == '') ? '1' : $this->input->post('submit_type');
        $this->sys_menu_auth = '';
        $this->load->library('auth', array(
            'user_info' => $this->session->sys_session
        ));
        $this->top_menu();
        $this->left_menu();
    }

    //登录验证
    public function check_login()
    {
        $pre_url = urlencode('http://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI']);
        if (empty($this->session->sys_session)) {
            $this->load->library('jump');
            $this->jump->error('登录超时', site_url('index?url=' . $pre_url));
        }
    }

    //顶部菜单
    public function top_menu()
    {
        $data['top_menu'] = array();
        $data['section_name'] = '';
        //系统栏目
        $sys_menu = $this->auth->get();
        //获取栏目所有上级id
        $parent_id = $this->tree->get_parent($sys_menu, array('url', $this->uri->segment(1)), TRUE, 'id');
        if (!empty($parent_id)) {
            //主菜单有效url
            $sys_menu_url = valid_url($sys_menu);
            foreach ($sys_menu as $key => $val) {
                if ($val['pid'] == 0 && $val['is_menu'] == 1) {
                    $data['top_menu'][$key] = $val;
                    $data['top_menu'][$key]['url'] = $sys_menu_url[$key];
                    $data['top_menu'][$key]['active'] = in_array($val['id'], $parent_id) ? 'active' : '';
                }
                if ($val['id'] == $parent_id[0]) {
                    $data['section_name'] = $val['name'];
                    $this->sys_menu_auth = $val['sys_menu_auth'];
                }
            }
        }
        $this->section_name = $data['section_name'];
        $data['header']['valid_username'] = $this->session->sys_session['valid_username'];
        $this->load->vars($data);
    }

    //左侧菜单
    public function left_menu()
    {
        $str = '';
        $parent_level = 0;
        //系统栏目
        $sys_menu = $this->auth->get();
        //获取当前栏目所有上级id
        $parent_id = $this->tree->get_parent($sys_menu, array('url', $this->uri->segment(1)), TRUE, 'id');
        if (!empty($parent_id)) {
            //获取当前栏目一级栏目的所有下级栏目
            $sys_menu_chidren = $this->tree->get_children($sys_menu, array_reverse($parent_id)[0]);
            foreach ($sys_menu_chidren as $val) {
                if ($val['is_menu'] == 1) {
                    $level = $val['level'];
                    $n = strpos($val['url'], '?');
                    $conn = ($n) ? '&' : '?';
                    $current = in_array($val['id'], $parent_id) ? 'current' : '';
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
                        $str .= '<a href="javascript:;" data-url="' . site_url($val['url']) . '" class="' . $current . ' mtree_link mtree-link-hook">';
                    }
                    $str .= '<div class="mtree_indent mtree-indent-hook" style="width:' . $indent . '"></div>';
                    $str .= '<div class="mtree_btn mtree-btn-hook"></div>';
                    if ($val['icon']) {
                        $str .= '<div class="mtree_icon mtree-icon-hook"><i class="' . $val['icon'] . '"></i></div>';
                    }
                    $str .= '<div class="mtree_name mtree-name-hook">' . $val['name'];
                    if ($val['user_type'] == 'dev') {
                        $str .= '<span class="label label-danger">' . $val['user_type'] . '</span>';
                    }
                    $str .= '</div>';
                    $str .= '</a>';
                    $parent_level = $level;
                }
            }
            $str .= str_repeat('</li></ul>', $parent_level + 1);
        }
        $data['left_menu'] = $str;
        $this->load->vars($data);
    }


}