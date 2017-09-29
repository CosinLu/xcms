<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/22
 * Time: 10:04
 */
class Sys_menu extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('sys_menu_model', 'sys_menu');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('sys_menu/get_list');
        $url['insert_btn'] = $this->auth->set(config_item('my_insert'), $this->sys_menu_auth, '<a class="btn btn-primary btn-sm" href="' . site_url('sys_menu/insert') . '">新增</a>');
        $url['save_url'] = site_url('sys_menu/save');
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('sys_menu/index.html');
    }

    //获取列表
    public function get_list()
    {
        $data['list'] = $this->sys_menu->get_list();
        foreach ($data['list']['list'] as $key => $val) {
            $data['list']['list'][$key]['user_type_name'] = '<span style="color:' . $val['user_type_color'] . ';">' . $val['user_type_name'] . '</span>';
            $data['list']['list'][$key]['display_name'] = '<span style="color:' . $val['display_color'] . ';">' . $val['display_name'] . '</span>';
            $data['list']['list'][$key]['prefix'] = str_repeat('&nbsp;&nbsp;', ($val['level'] - 1) * 2) . (($val['level'] > 1) ? '└─&nbsp;' : '');
            $data['list']['list'][$key]['is_menu'] = $val['is_menu'] == 1 ? '是' : '<span class="text-danger">否</span>';
            $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_insert'), $this->sys_menu_auth, '<a href="' . site_url('sys_menu/insert?id=' . $val['id']) . '">新增下级</a>', '<a href="javascript:;" class="disabled">新增下级</a>');
            $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_update'), $this->sys_menu_auth, '<a href="' . site_url('sys_menu/update?id=' . $val['id']) . '">编辑</a>', '<a href="javascript:;" class="disabled">编辑</a>');
            $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_del'), $this->sys_menu_auth, '<a href="javascript:;" class="del-hook" data-id="' . $val['id'] . '" data-url="' . site_url('sys_menu/del') . '">删除</a>', '<a href="javascript:;" class="disabled">删除</a>');
        }
        echo json_encode($data);
    }

    //新增
    public function insert()
    {
        $id = $this->input->get('id');
        $data['cols'] = $this->tree->ddl($this->sys_menu->data(), 'pid', $id);
        $data['dict'] = $this->dictionary->dict(array(
            array('cbl', 'sys_menu_auth', 'auth'),
            array('rbl', 'display', 'display'),
            array('rbl', 'user_type', 'user_type')
        ));
        $this->load->view('sys_menu/insert.html', $data);
    }

    //修改
    public function update()
    {
        $id = $this->input->get('id');
        $data['item'] = $this->sys_menu->update($id);
        $data['cols'] = $this->tree->ddl($this->sys_menu->data(), 'pid', $data['item']['pid'], $data['item']['id']);
        $data['dict'] = $this->dictionary->dict(array(
            array('cbl', 'sys_menu_auth', 'auth', $data['item']['sys_menu_auth']),
            array('rbl', 'display', 'display', $data['item']['display']),
            array('rbl', 'user_type', 'user_type', $data['item']['user_type'])
        ));
        $this->load->view('sys_menu/update.html', $data);
    }


    //保存
    public function save()
    {
        $post = array(
            'id' => $this->input->post('id'),
            'auth' => $this->input->post('auth'),
            'vals' => array(
                'name' => $this->input->post('name'),
                'is_menu' => $this->input->post('is_menu') ?: 0,
                'pid' => $this->input->post('pid'),
                'icon' => $this->input->post('icon'),
                'url' => $this->input->post('url'),
                'remark' => $this->input->post('remark'),
                'user_type' => $this->input->post('user_type'),
                'display' => $this->input->post('display'),
                'sort' => $this->input->post('sort'),
            )
        );
        $bool = $this->sys_menu->save($post);
        //写入日志
        $this->oplog->insert($this->section_name, (!$post['id']) ? '1' : '2', $bool);
        $config['icon'] = 1;
        $config['url'] = site_url('sys_menu');
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

    //删除
    public function del()
    {
        $id = $this->input->post('id');
        $this->sys_menu->del_sys_menu_auth($id);//删除系统栏目权限
        $rows = $this->tree->del($this->sys_menu->data(), 'sys_menu', $id);//删除系统栏目
        $this->oplog->insert($this->section_name, '3', $rows);//日志
        echo $rows;
    }

}