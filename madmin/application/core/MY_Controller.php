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
    //系统栏目标识
    protected $sys_cid;
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
        $this->sys_cid = $this->input->get('sys_cid');
        $this->check_login();
        $this->peferer = (isset($_SERVER['HTTP_REFERER'])) ? $_SERVER['HTTP_REFERER'] : '';
        $this->submit_type = ($this->input->post('submit_type') == '') ? '1' : $this->input->post('submit_type');
        $this->sys_menu_auth = '';
        $this->load->library('auth', array(
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
            $this->load->library('jump');
            $this->jump->error('登录超时', site_url('index?url=' . $pre_url));
        }
    }

    //主菜单
    public function menu()
    {
        $data['menu'] = array();
        $data['section_name'] = '';
        //系统栏目
        $sys_menu = $this->auth->get();
        //获取栏目所有上级id
        $sys_menu_parent_id = $this->tree->get_parent($sys_menu, $this->sys_cid, TRUE, 'id');
        if (!empty($sys_menu_parent_id)) {
            $sys_menu_parent_id = array_reverse($sys_menu_parent_id);
            //主菜单有效url
            $sys_menu_url = $this->valid_url($sys_menu);
            foreach ($sys_menu as $key => $val) {
                if ($val['pid'] == 0) {
                    $data['menu'][$key] = $val;
                    $data['menu'][$key]['url'] = $sys_menu_url[$key];
                    $data['menu'][$key]['active'] = ($val['id'] == $sys_menu_parent_id[0]) ? 'active' : '';
                }
                if ($val['id'] == $this->sys_cid) {
                    $data['section_name'] = $val['name'];
                    $this->sys_menu_auth = $val['sys_menu_auth'];
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
        $str = '';
        $parent_level = 0;
        //系统栏目
        $sys_menu = $this->auth->get();
        //获取当前栏目所有上级id
        $sys_menu_parent_id = $this->tree->get_parent($sys_menu, $this->sys_cid, TRUE, 'id');
        if (!empty($sys_menu_parent_id)) {
            $sys_menu_parent_id = array_reverse($sys_menu_parent_id);
            //获取当前栏目一级栏目的所有下级栏目
            $sys_menu_chidren = $this->tree->get_children($sys_menu, $sys_menu_parent_id[0]);
            foreach ($sys_menu_chidren as $val) {
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
                if ($val['user_type'] == 'dev') {
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

    //获取有效url
    public function valid_url($data = array())
    {
        $data_serialize = $this->tree->serialize($data);
        $children = array();
        foreach ($data_serialize as $key => $val) {
            if ($val['pid'] == 0) {
                $children[$key] = $this->tree->get_children($data, $val['id'], TRUE);
                foreach ($children[$key] as $val) {
                    if ($val['url']) {
                        $n = strpos($val['url'], '?');
                        $conn = ($n) ? '&' : '?';
                        $url[$key] = site_url($val['url'] . $conn . 'sys_cid=' . $val['id']);
                        break;
                    } else {
                        $url[$key] = 'javascript:;';
                    }
                }
            }
        }

        return $url;
    }


}