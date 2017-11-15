<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/22
 * Time: 10:04
 */
class Navigation extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('navigation_model');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('navigation/get_list');
        $url['insert_btn'] = $this->auth->set(config_item('my_insert'), $this->sys_menu_auth, '<a class="btn btn-primary btn-sm" href="' . site_url('navigation/insert') . '">新增</a>');
        $url['save_url'] = site_url('navigation/save');
        $this->load->vars($url);
    }

    public function index()
    {
        $data['position_source'] = $this->dictionary->source('position');
        $data['display_source'] = $this->dictionary->source('display');
        $this->load->view('navigation/index.html', $data);
    }

    //获取列表
    public function get_list()
    {
        $data['list'] = $this->navigation_model->get_list();
        foreach ($data['list']['list'] as $key => $val) {
            $data['list']['list'][$key]['display_name'] = '<span style="color:' . $val['display_color'] . ';">' . $val['display_name'] . '</span>';
            $data['list']['list'][$key]['prefix'] = str_repeat('&nbsp;&nbsp;', ($val['level'] - 1) * 2) . (($val['level'] > 1) ? '└─&nbsp;' : '');
            $disabled_insert_next_btn = '<a href="javascript:;" class="disabled">新增下级</a>';
            $disabled_update_btn = '<a href="javascript:;" class="disabled">编辑</a>';
            $disabled_del_btn = '<a href="javascript:;" class="disabled">删除</a>';
            if ($val['is_add_next'] == '1') {
                $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_insert'), $this->sys_menu_auth, '<a href="' . site_url('navigation/insert?
                id=' . $val['id']) . '">新增下级</a>', $disabled_insert_next_btn);
            } else {
                $data['list']['list'][$key]['opera_btn'][] = $disabled_insert_next_btn;
            }
            if ($val['is_update'] == '1') {
                $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_update'), $this->sys_menu_auth, '<a href="' . site_url('navigation/update?
                id=' . $val['id']) . '">编辑</a>', $disabled_update_btn);
            } else {
                $data['list']['list'][$key]['opera_btn'][] = $disabled_update_btn;
            }
            if ($val['is_del'] == '1') {
                $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_del'), $this->sys_menu_auth, '<a href="javascript:;" class="del-hook" data-id="' . $val['id'] . '" data-url="' . site_url('navigation/del') . '">删除</a>', $disabled_del_btn);
            } else {
                $data['list']['list'][$key]['opera_btn'][] = $disabled_del_btn;
            }
        }
        echo json_encode($data);
    }

    //新增
    public function insert()
    {
        $id = $this->input->get('id');
        $data['type'] = $this->tree->ddl($this->navigation_model->data(), 'pid', $id, '', '', array(0, '主导航'));
        $data['category'] = $this->tree->ddl($this->navigation_model->category(), 'category', '', '', '', array('', '-请选择-'));
        $data['dict'] = $this->dictionary->dict(array(
            array('rbl', 'target', 'target'),
            array('cbl', 'position', 'position'),
            array('rbl', 'display', 'display')
        ));
        $this->load->view('navigation/insert.html', $data);
    }

    //修改
    public function update()
    {
        $id = $this->input->get('id');
        $data['record'] = $this->navigation_model->update($id);
        $data['type'] = $this->tree->ddl($this->navigation_model->data(), 'pid', $data['record']['pid'], $data['record']['id'], '', array(0, '主导航'));
        $data['category'] = $this->tree->ddl($this->navigation_model->category(), 'category', '', '', '', array('', '-请选择-'));
        $data['dict'] = $this->dictionary->dict(array(
            array('rbl', 'target', 'target', $data['record']['target']),
            array('cbl', 'position', 'position', $data['record']['position']),
            array('rbl', 'display', 'display', $data['record']['display'])
        ));
        $this->load->view('navigation/update.html', $data);
    }


    //保存
    public function save()
    {
        $post = array(
            'id' => $this->input->post('id'),
            'vals' => array(
                'name' => $this->input->post('name'),
                'pid' => $this->input->post('pid'),
                'category' => $this->input->post('category'),
                'url' => $this->input->post('url'),
                'target' => $this->input->post('target'),
                'position' => new_implode(',', $this->input->post('position')),
                'display' => $this->input->post('display'),
                'sort' => $this->input->post('sort'),
            )
        );
        $bool = $this->navigation_model->save($post);
        //写入日志
        $this->oplog->insert($this->section_name, (!$post['id']) ? '1' : '2', $bool);
        $config['icon'] = 1;
        $config['url'] = site_url('navigation');
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
        //删除栏目
        $rows = $this->tree->del($this->navigation_model->data(), 'navigation', $id);
        //写入日志
        $this->oplog->insert($this->section_name, '3', $rows);
        echo $rows;
    }

}