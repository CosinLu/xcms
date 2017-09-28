<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:11
 */
require_once 'Info.php';

class Info_cases extends Info
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('info_cases_model', 'info_cases');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('info_cases/get_list?sys_cid=' . $this->sys_cid . '&cid=' . $this->cid);
        $url['insert_btn'] = $this->auth->set($this->config->item('insert', 'mcms'), $this->sys_menu_auth, '<a class="btn btn-primary btn-sm" href="' . site_url('info_cases/insert?sys_cid=' . $this->sys_cid . '&cid=' . $this->cid) . '">新增</a>');
        $url['del_btn'] = $this->auth->set($this->config->item('del', 'mcms'), $this->sys_menu_auth, '<a class="btn btn-danger btn-sm batch-del-hook" href="javascript:;" data-tb="info_cases" data-checkname="id" data-url = "' . site_url('ajax/batch_del?sys_cid=' . $this->sys_cid . '&cid=' . $this->cid) . '">删除</a>');
        $url['save_url'] = site_url('info_cases/save?sys_cid=' . $this->sys_cid . '&cid=' . $this->cid);
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('info_cases/index.html');
    }

    //获取列表
    public function get_list()
    {
        $key = $this->input->post('key');
        $page = ($this->input->post('page')) ?: 1;
        $children_id = $this->tree->get_children($this->info->data(), $this->cid, TRUE, 'id');
        $data['list'] = $this->info_cases->get_list($this->cid, $children_id, $key, $page);
        foreach ($data['list']['list'] as $key => $val) {
            $data['list']['list'][$key]['title'] = $val['title'];
            $data['list']['list'][$key]['display_name'] = '<span style="color:' . $val['display_color'] . ';">' . $val['display_name'] . '</span>';
            $data['list']['list'][$key]['create_time'] = date('Y-m-d H:i', $val['create_time']);
            $data['list']['list'][$key]['opera_btn'][] = $this->auth->set($this->config->item('update', 'mcms'), $this->sys_menu_auth, '<a href="' . site_url('info_cases/update?sys_cid=' . $this->sys_cid . '&cid=' . $this->cid . '&id=' . $val['id']) . '">编辑</a>', '<a href="javascript:;" class="disabled">编辑</a>');
            $data['list']['list'][$key]['opera_btn'][] = $this->auth->set($this->config->item('del', 'mcms'), $this->sys_menu_auth, '<a href="javascript:;" class="del-hook" data-tb="info_cases" data-id="' . $val['id'] . '" data-url="' . site_url('ajax/del?sys_cid=' . $this->sys_cid . '&cid=' . $this->cid . '&col_name=' . urlencode($this->main_section_name)) . '">删除</a>', '<a href="javascript:;" class="disabled">删除</a>');
        }
        echo json_encode($data);
    }

    //新增
    public function insert()
    {
        $data['cols'] = $this->tree->ddl($this->info->data(), 'cid', $this->cid, '', $this->tpl_id());
        $data['dict'] = $this->dictionary->dict(array(
            array('rbl', 'target', 'target'),
            array('rbl', 'display', 'display')
        ));
        $data['create_time'] = date('Y-m-d H:i:s', time());
        $this->load->view('info_cases/insert.html', $data);
    }

    //修改
    public function update()
    {
        $id = $this->input->get('id');
        $data['item'] = $this->info_cases->update($id);
        $data['cols'] = $this->tree->ddl($this->info->data(), 'cid', $data['item']['cid'], '', $this->tpl_id());
        $data['uploads'] = $this->upload->execute(array(
            array('image', $data['item']['image']),
            array('images', $data['item']['images'])
        ));
        $data['dict'] = $this->dictionary->dict(array(
            array('rbl', 'target', 'target', $data['item']['target']),
            array('rbl', 'display', 'display', $data['item']['display'])
        ));
        $data['create_time'] = date('Y-m-d H:i:s', $data['item']['create_time']);
        $this->load->view('info_cases/update.html', $data);
    }

    //保存
    public function save()
    {
        $image = $this->input->post('image');
        $images = $this->input->post('images');
        $post = array(
            'id' => $this->input->post('id'),
            'vals' => array(
                'cid' => $this->input->post('cid'),
                'title' => $this->input->post('title'),
                'case_url' => $this->input->post('case_url'),
                'image' => (!empty($image)) ? implode(',', $image) : '',
                'images' => (!empty($images)) ? implode(',', $images) : '',
                'target' => $this->input->post('target'),
                'display' => $this->input->post('display'),
                'sort' => $this->input->post('sort'),
                'content' => $this->input->post('content'),
                'create_time' => strtotime($this->input->post('create_time'))
            )
        );
        $bool = $this->info_cases->save($post);
        //写入日志
        $this->oplog->insert($this->main_section_name, (!$post['id']) ? '1' : '2', $bool);
        $config['icon'] = 1;
        $config['url'] = site_url('info_cases?sys_cid=' . $this->sys_cid . '&cid=' . $this->cid);
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