<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/26
 * Time: 19:43
 */
class Welcome extends CI_Controller
{
    protected $sys_session;
    protected $username;
    protected $password;

    public function __construct()
    {
        parent::__construct();
        $this->username = $this->input->post('username');
        $this->password = $this->input->post('password');
        $this->pre_url = $this->input->get('url');
        $this->set_url();
        $this->load->model('welcome_model', 'welcome');
        $this->load->library('form_validation');
        $this->load->library('category');
    }

    //设置url
    function set_url()
    {
        $url['login_url'] = site_url('welcome/login?url=' . $this->pre_url);
        $url['code'] = site_url('welcome/code');
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('welcome/index.html');
    }

    //验证码
    public function code()
    {
        $config = array(
            'width' => 80,
            'height' => 30,
            'font_size' => 16,
            'code_len' => 1
        );
        $this->load->library('code', $config);
        $this->code->show();
    }

    //登录
    public function login()
    {
        $code = strtoupper($this->input->post('code'));
        //设置表单验证规则
        $this->form_validation->set_rules('username', '用户名', 'required|callback_check_username|callback_check_col_auth');
        $this->form_validation->set_rules('password', '密码', 'required|callback_check_password');
        $this->form_validation->set_rules('code', '验证码', 'required|callback_check_code');
        //执行表单验证
        $bool = $this->form_validation->run();
        if (!$bool) {
            $this->load->view('welcome/index.html');
        } else {
            //登录成功
            $sys_session['sys_session'] = $this->welcome->user_info();
            $this->session->set_userdata($sys_session);
            if ($this->pre_url == '') {
                //redirect(site_url('home/?sys_cid=7'));
                //定义登录成功后跳转url
                $this->load->library('sys_auth', array('user_info' => $this->welcome->user_info()));
                $sys_col = $this->sys_auth->sys_col();
                $url = $this->category->children_url($sys_col);
                redirect($url[0]);
            } else {
                redirect($this->pre_url);
            }
        }
    }

    //验证验证码
    public function check_code()
    {
        $code = strtoupper($this->input->post('code'));
        $sys_session_code = $this->session->userdata['sys_code'];
        if ($code != $sys_session_code && $code != '') {
            $this->form_validation->set_message('check_code', '{field} 输入错误。');
            return FALSE;
        } else {
            return TRUE;
        }
    }

    //验证用户名
    public function check_username()
    {
        if ($this->username != '') {
            $rows = $this->welcome->check_username();
            if ($rows == 0) {
                $this->form_validation->set_message('check_username', '{field} 不存在。');
                return FALSE;
            } else {
                $userinfo = $this->welcome->user_info();
                if ($userinfo['state'] == 'forzen') {
                    $this->form_validation->set_message('check_username', '{field} 被冻结。');
                    return FALSE;
                } else {
                    return TRUE;
                }
                return TRUE;
            }
        }
    }

    //验证密码
    public function check_password()
    {
        $userinfo = $this->welcome->user_info();
        if (empty($userinfo) && $this->password != '') {
            $this->form_validation->set_message('check_password', '{field} 输入错误。');
            return FALSE;
        } else {
            return TRUE;
        }
    }

    //验证系统栏目权限
    public function check_col_auth()
    {
        $this->load->library('sys_auth', array('user_info' => $this->welcome->user_info()));
        $sys_col = $this->sys_auth->sys_col();
        $frist_sys_col = array();
        foreach ($sys_col as $val) {
            if ($val['level'] == 1) {
                $frist_sys_col[] = $val;
            }
        }
        if (empty($frist_sys_col)) {
            $this->form_validation->set_message('check_col_auth', '{field} 没有任何权限。');
            return FALSE;
        } else {
            return TRUE;
        }
    }

    //登出
    public function logout()
    {
        $this->session->unset_userdata('sys_session');
        //session_destroy();
        redirect(site_url());
    }
}