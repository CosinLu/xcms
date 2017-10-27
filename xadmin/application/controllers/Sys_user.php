<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:11
 */
class Sys_user extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('sys_user_model');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('sys_user/get_list');
        $url['insert_btn'] = $this->auth->set(config_item('my_insert'), $this->sys_menu_auth, '<a class="btn btn-primary btn-sm" href="' . site_url('sys_user/insert') . '">新增</a>');
        $url['del_btn'] = $this->auth->set(config_item('my_del'), $this->sys_menu_auth, '<a class="btn btn-danger btn-sm batch-del-hook" href="javascript:;" data-tb="sys_user" data-checkname="id" data-menu="' . $this->section_name . '" data-url = "' . site_url('api/batch_del') . '">删除</a>');
        $url['save_url'] = site_url('sys_user/save');
        $url['check_username_url'] = site_url('sys_user/check_username');
        $this->load->vars($url);
    }

    public function index()
    {
        $data['status_source'] = $this->dictionary->source('user_status');
        $this->load->view('sys_user/index.html', $data);
    }

    //获取列表
    public function get_list()
    {
        $key = $this->input->post('key');
        $page = ($this->input->post('page')) ?: 1;
        $data['list'] = $this->sys_user_model->get_list($key, $page);
        foreach ($data['list']['list'] as $key => $val) {
            if ($val['user_type'] < 2) {
                $data['list']['list'][$key]['status_name'] = '<span style="color:' . $val['status_color'] . ';">' . $val['status_name'] . '</span>';
                $data['list']['list'][$key]['opera_btn'][] = '<a href="javascript:;" class="disabled">设置权限</a>';
                $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_update'), $this->sys_menu_auth, '<a href="' . site_url('sys_user/update?id=' . $val['id']) . '">编辑</a>', '<a href="javascript:;" class="disabled">编辑</a>');
                $data['list']['list'][$key]['opera_btn'][] = '<a href="javascript:;" class="disabled">删除</a>';
                $data['list']['list'][$key]['disabled'] = 'disabled';
            } elseif ($val['user_type'] == 2) {
                $data['list']['list'][$key]['status_name'] = '<a href="javascript:;" class="status-hook" data-value="' . $val['status'] . '" data-pk="' . $val['id'] . '"><span style="color:' . $val['status_color'] . ';">' . $val['status_name'] . '</span></a>';
                $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_insert'), $this->sys_menu_auth, '<a href="' . site_url('sys_user_auth?user_id=' . $val['id']) . '">设置权限</a>', '<a href="javascript:;" class="disabled">设置权限</a>');
                $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_update'), $this->sys_menu_auth, '<a href="' . site_url('sys_user/update?id=' . $val['id']) . '">编辑</a>', '<a href="javascript:;" class="disabled">编辑</a>');
                $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_del'), $this->sys_menu_auth, '<a href="javascript:;" class="del-hook" data-tb="sys_user" data-id="' . $val['id'] . '" data-menu="' . $this->section_name . '" data-url="' . site_url('api/del') . '">删除</a>', '<a href="javascript:;" class="disabled">删除</a>');
                $data['list']['list'][$key]['disabled'] = '';
            }
        }
        echo json_encode($data);
    }

    //新增
    public function insert()
    {
        $data['sys_role'] = ddl($this->sys_user_model->sys_role(), 'role_id');
        $data['dict'] = $this->dictionary->dict(array(
            array('rbl', 'user_status', 'status')
        ));
        $this->load->view('sys_user/insert.html', $data);
    }

    //修改
    public function update()
    {
        $id = $this->input->get('id');
        $data['record'] = $this->sys_user_model->update($id);
        $disabled = ($data['record']['user_type'] < 2) ? TRUE : '';
        $data['sys_role'] = ddl($this->sys_user_model->sys_role(), 'role_id', $data['record']['role_id'], $disabled);
        $data['dict'] = $this->dictionary->dict(array(
            array('rbl', 'user_status', 'status', $data['record']['status'], $disabled)
        ));
        $this->load->view('sys_user/update.html', $data);
    }

    //保存
    public function save()
    {
        $password = $this->input->post('password');
        $post = array(
            'id' => $this->input->post('id'),
            'vals' => array_filter(
                array(
                    'role_id' => $this->input->post('role_id'),
                    'username' => $this->input->post('username'),
                    'password' => $password ? md5($password) : '',
                    'nickname' => $this->input->post('nickname'),
                    'realname' => $this->input->post('realname'),
                    'status' => $this->input->post('status'),
                    'remark' => $this->input->post('remark')
                )
            )
        );
        $bool = $this->sys_user_model->save($post);
        //写入日志
        $this->oplog->insert($this->section_name, (!$post['id']) ? '1' : '2', $bool);
        $config['icon'] = 1;
        $config['url'] = site_url('sys_user');
        if ($bool) {
            switch ($this->submit_type) {
                case '1':
                    echo json_encode($config);
                    break;
                case '2':
                    $config['url'] = $this->peferer;
                    echo json_encode($config);
                    break;
            }
        } else {
            $config['icon'] = 2;
            echo json_encode($config);
        }
    }

    //验证用户名
    public function check_username()
    {
        $id = $this->input->get('id');
        $username = $this->input->post('param');
        $res = $this->sys_user_model->check_username($username, $id);
        if ($res) {
            echo '{"info":"用户名已存在","status":"n"}';
        } else {
            echo '{"info":"","status":"y"}';
        }
    }

}