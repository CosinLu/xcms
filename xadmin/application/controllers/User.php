<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:11
 */
class User extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('user_model');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('user/get_list');
        $url['insert_btn'] = $this->auth->set(config_item('my_insert'), $this->sys_menu_auth, '<a class="btn btn-primary btn-sm" href="' . site_url('user/insert') . '">新增</a>');
        $url['del_btn'] = $this->auth->set(config_item('my_del'), $this->sys_menu_auth, '<a class="btn btn-danger btn-sm batch-del-hook" href="javascript:;" data-tb="user" data-menu="' . $this->section_name . '">删除</a>');
        $url['save_url'] = site_url('user/save');
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('user/index.html');
    }

    //获取列表
    public function get_list()
    {
        $key = $this->input->post('key');
        $page = ($this->input->post('page')) ?: 1;
        $data['list'] = $this->user_model->get_list($key, $page);
        foreach ($data['list']['list'] as $key => $val) {
            $data['list']['list'][$key]['account'] = $val['phone'] ?: $val['email'];
            $data['list']['list'][$key]['create_time'] = date('Y-m-d H:i:s');
            $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_update'), $this->sys_menu_auth, '<a href="' . site_url('user/update?id=' . $val['id']) . '">编辑</a>', '<a href="javascript:;" class="disabled">编辑</a>');
            $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_del'), $this->sys_menu_auth, '<a href="javascript:;" class="del-hook" data-tb="user" data-id="' . $val['id'] . '" data-menu="' . $this->section_name . '">删除</a>', '<a href="javascript:;" class="disabled">删除</a>');
        }
        echo json_encode($data);
    }

    //新增
    public function insert()
    {
        $this->load->view('user/insert.html');
    }

    //修改
    public function update()
    {
        $id = $this->input->get('id');
        $data['record'] = $this->user_model->update($id);
        $data['uploads']['avatar'] = $this->upload->get($data['record']['avatar']);
        $this->load->view('user/update.html', $data);
    }

    //保存
    public function save()
    {
        $password = $this->input->post('password');
        $post = array(
            'id' => $this->input->post('id'),
            'vals' => array_filter(
                array(
                    'username' => $this->input->post('username'),
                    'avatar' => new_implode(',', $this->input->post('avatar')),
                    'password' => $password ? md5($password) : '',
                    'phone' => $this->input->post('phone'),
                    'email' => $this->input->post('email'),
                    'nickname' => $this->input->post('nickname'),
                    'position' => $this->input->post('position'),
                    'company' => $this->input->post('company'),
                    'intro' => $this->input->post('intro')
                )
            )
        );
        $bool = $this->user_model->save($post);
        //写入日志
        $this->oplog->insert($this->section_name, (!$post['id']) ? '1' : '2', $bool);
        $config['icon'] = 1;
        $config['url'] = site_url('user');
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

}