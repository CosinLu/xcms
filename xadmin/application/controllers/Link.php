<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:11
 */
class Link extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('link_model');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('link/get_list');
        $url['insert_btn'] = $this->auth->set(config_item('my_insert'), $this->sys_menu_auth, '<a class="btn btn-primary btn-sm" href="' . site_url('link/insert') . '">新增</a>');
        $url['del_btn'] = $this->auth->set(config_item('my_del'), $this->sys_menu_auth, '<a class="btn btn-danger btn-sm batch-del-hook" href="javascript:;" data-tb="link" data-checkname="id" data-menu="' . $this->section_name . '" data-url = "' . site_url('api/batch_del') . '">删除</a>');
        $url['save_url'] = site_url('link/save');
        $this->load->vars($url);
    }

    public function index()
    {
        $data['display_source'] = $this->dictionary->source('display');
        $this->load->view('link/index.html', $data);
    }

    //获取列表
    public function get_list()
    {
        $key = $this->input->post('key');
        $page = ($this->input->post('page')) ?: 1;
        $data['list'] = $this->link_model->get_list($key, $page);
        foreach ($data['list']['list'] as $key => $val) {
            $data['list']['list'][$key]['display_name'] = '<span style="color:' . $val['display_color'] . ';">' . $val['display_name'] . '</span>';
            $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_update'), $this->sys_menu_auth, '<a href="' . site_url('link/update?id=' . $val['id']) . '">编辑</a>', '<a href="javascript:;" class="disabled">编辑</a>');
            $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_del'), $this->sys_menu_auth, '<a href="javascript:;" class="del-hook" data-tb="link" data-id="' . $val['id'] . '" data-menu="' . $this->section_name . '" data-url="' . site_url('api/del') . '">删除</a>', '<a href="javascript:;" class="disabled">删除</a>');
        }
        echo json_encode($data);
    }

    //新增
    public function insert()
    {
        $data['dict'] = $this->dictionary->dict(array(
            array('rbl', 'target', 'target'),
            array('rbl', 'display', 'display')
        ));
        $this->load->view('link/insert.html', $data);
    }

    //修改
    public function update()
    {
        $id = $this->input->get('id');
        $data['record'] = $this->link_model->update($id);
        $data['dict'] = $this->dictionary->dict(array(
            array('rbl', 'target', 'target', $data['record']['target']),
            array('rbl', 'display', 'display', $data['record']['display'])
        ));
        $data['uploads']['thumb'] = $this->upload->get($data['record']['thumb']);
        $this->load->view('link/update.html', $data);
    }

    //保存
    public function save()
    {
        $url = $this->input->post('url');
        $post = array(
            'id' => $this->input->post('id'),
            'vals' => array(
                'name' => $this->input->post('name'),
                'thumb' => new_implode(',', $this->input->post('thumb')),
                'url' => $url ?: prep_url($url),
                'target' => $this->input->post('target'),
                'display' => $this->input->post('display'),
                'sort' => $this->input->post('sort')
            )
        );
        $bool = $this->link_model->save($post);
        //写入日志
        $this->oplog->insert($this->section_name, (!$post['id']) ? '1' : '2', $bool);
        $config['icon'] = 1;
        $config['url'] = site_url('link');
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