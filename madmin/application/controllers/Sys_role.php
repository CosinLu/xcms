<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:11
 */
class Sys_role extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('sys_role_model');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('sys_role/get_list');
        $url['insert_btn'] = $this->auth->set(config_item('my_insert'), $this->sys_menu_auth, '<a class="btn btn-primary btn-sm" href="' . site_url('sys_role/insert') . '">新增</a>');
        $url['del_btn'] = $this->auth->set(config_item('my_del'), $this->sys_menu_auth, '<a class="btn btn-danger btn-sm batch-del-hook" href="javascript:;" data-tb="sys_role" data-checkname="id" data-url = "' . site_url('ajax/batch_del') . '">删除</a>');
        $url['save_url'] = site_url('sys_role/save');
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('sys_role/index.html');
    }

    //获取列表
    public function get_list()
    {
        $key = $this->input->post('key');
        $page = ($this->input->post('page')) ?: 1;
        $data['list'] = $this->sys_role_model->get_list($key, $page);
        foreach ($data['list']['list'] as $key => $val) {
            if ($val['role_type'] < 2) {
                $data['list']['list'][$key]['opera_btn'][] = '<a href="javascript:;" class="disabled">设置权限</a>';
                $data['list']['list'][$key]['opera_btn'][] = '<a href="javascript:;" class="disabled">编辑</a>';
                $data['list']['list'][$key]['opera_btn'][] = '<a href="javascript:;" class="disabled">删除</a>';
                $data['list']['list'][$key]['disabled'] = 'disabled';
            } elseif ($val['role_type'] == 2) {
                $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_insert'), $this->sys_menu_auth, '<a href="' . site_url('sys_role_auth?role_id=' . $val['id']) . '">设置权限</a>', '<a href="javascript:;" class="disabled">设置权限</a>');
                $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_update'), $this->sys_menu_auth, '<a href="' . site_url('sys_role/update?id=' . $val['id']) . '">编辑</a>', '<a href="javascript:;" class="disabled">编辑</a>');
                $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_del'), $this->sys_menu_auth, '<a href="javascript:;" class="del-hook" data-tb="sys_role" data-id="' . $val['id'] . '" data-url="' . site_url('ajax/del') . '">删除</a>', '<a href="javascript:;" class="disabled">删除</a>');
                $data['list']['list'][$key]['disabled'] = '';
            }
        }
        echo json_encode($data);
    }

    //新增
    public function insert()
    {
        $this->load->view('sys_role/insert.html');
    }

    //修改
    public function update()
    {
        $id = $this->input->get('id');
        $data['item'] = $this->sys_role_model->update($id);
        $this->load->view('sys_role/update.html', $data);
    }

    //保存
    public function save()
    {
        $post = array(
            'id' => $this->input->post('id'),
            'vals' => array(
                'name' => $this->input->post('name'),
                'remark' => $this->input->post('remark'),
                'sort' => $this->input->post('sort')
            )
        );
        $bool = $this->sys_role_model->save($post);
        //写入日志
        $this->oplog->insert($this->section_name, (!$post['id']) ? '1' : '2', $bool);
        $config['icon'] = 1;
        $config['url'] = site_url('sys_role');
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