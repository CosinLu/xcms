<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/26
 * Time: 19:43
 */
class Index extends CI_Controller
{
    protected $sys_session;
    protected $username;
    protected $password;

    public function __construct()
    {
        parent::__construct();
        $this->username = $this->input->post('username');
        $this->password = $this->input->post('password');
        $this->pre_url = urldecode($this->input->get('url'));
        $this->set_url();
        $this->load->model('index_model', 'index');
        $this->load->library('form_validation');
        $this->load->library('category_lib');
        $this->session->unset_userdata('sys_session');
    }

    //设置url
    function set_url()
    {
        $url['login_url'] = site_url('index/login?url=' . urlencode($this->pre_url));
        $url['code'] = site_url('index/code');
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('index/index.html');
    }

    //验证码
    public function code()
    {
        $config = array(
            'width' => 80,
            'height' => 32,
            'font_size' => 16,
            'code_len' => 4
        );
        $this->load->library('code_lib', $config);
        $this->code_lib->show();
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
        //登录失败
        if (!$bool) {
            $this->load->view('index/index.html');
        } //登录成功
        else {
            $user_info = $this->index->user_info($this->username, $this->password);
            $session['sys_session']['user_id'] = $user_info['id'];
            $session['sys_session']['role_id'] = $user_info['role_id'];
            $session['sys_session']['username'] = $user_info['username'];
            $session['sys_session']['password'] = $user_info['password'];
            $session['sys_session']['realname'] = $user_info['realname'];
            $session['sys_session']['nickname'] = $user_info['nickname'];
            $session['sys_session']['user_type'] = $user_info['user_type'];
            $session['sys_session']['valid_username'] = $user_info['valid_username'];
            $session['sys_session']['role_type'] = $user_info['role_type'];
            $session['sys_session']['role_name'] = $user_info['role_name'];
            $session['sys_session']['last_login_time'] = $user_info['last_login_time'];
            $session['sys_session']['last_login_ip'] = $user_info['last_login_ip'];
            $session['sys_session']['lang_name'] = '中文简体';
            $session['sys_session']['lang_val'] = 'zh-cn';
            //写入登录日志
            $data['vals'] = array(
                'user_id' => $user_info['user_id'],
                'login_ip' => $this->input->ip_address(),
                'login_time' => time()
            );
            $this->index->insert_login_log($data);
            //写入session
            $this->session->set_userdata($session);
            //跳转至backurl
            if ($this->pre_url == '') {
                $this->load->library('sys_auth_lib', array('user_info' => $user_info));
                $sys_col = $this->sys_auth_lib->sys_col();
                $url = $this->category_lib->children_url($sys_col);
                $session['sys_session']['home_url'] = $url[0];
                $this->session->set_userdata($session);
                redirect($url[0]);
            } //跳转到默认url
            else {
                $session['sys_session']['home_url'] = $this->pre_url;
                $this->session->set_userdata($session);
                redirect($this->pre_url);
            }
        }
    }


    public function check_code()
    {
        $code = strtoupper($this->input->post('code'));
        if ($code != $this->session->sys_code && $code != '') {
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
            $rows = $this->index->check_username($this->username);
            if ($rows == 0) {
                $this->form_validation->set_message('check_username', '{field} 不存在。');

                return FALSE;
            } else {
                $userinfo = $this->index->user_info($this->username, $this->password);
                if ($userinfo['status'] == 'forzen') {
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
        $userinfo = $this->index->user_info($this->username, $this->password);
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
        $user_info = $this->index->user_info($this->username, $this->password);
        if (!empty($user_info)) {
            $this->load->library('sys_auth_lib', array('user_info' => $user_info));
            $sys_col = $this->sys_auth_lib->sys_col();
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
        } else {
            $this->form_validation->set_message('check_col_auth', '{field} 没有任何权限。');

            return FALSE;
        }
    }

    //登出
    public function logout()
    {
        //销毁session
        $this->session->unset_userdata('sys_session');
        redirect(site_url());
    }
}