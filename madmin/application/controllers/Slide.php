<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:11
 */
class Slide extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('slide_model', 'slide');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('slide/get_list?sys_cid=' . $this->sys_cid);
        $url['insert_btn'] = $this->auth->set($this->config->item('insert', 'mcms'), $this->sys_menu_auth, '<a class="btn btn-primary btn-sm" href="' . site_url('slide/insert?sys_cid=' . $this->sys_cid) . '">新增</a>');
        $url['del_btn'] = $this->auth->set($this->config->item('del', 'mcms'), $this->sys_menu_auth, '<a class="btn btn-danger btn-sm batch-del-hook" href="javascript:;" data-tb="slide" data-checkname="id" data-url = "' . site_url('ajax/batch_del?sys_cid=' . $this->sys_cid) . '">删除</a>');
        $url['save_url'] = site_url('slide/save?sys_cid=' . $this->sys_cid);
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('slide/index.html');
    }

    //获取列表
    public function get_list()
    {
        $key = $this->input->post('key');
        $page = ($this->input->post('page')) ?: 1;
        $data['list'] = $this->slide->get_list($key, $page);
        foreach ($data['list']['list'] as $key => $val) {
            $data['list']['list'][$key]['display_name'] = '<span style="color:' . $val['display_color'] . ';">' . $val['display_name'] . '</span>';
            $data['list']['list'][$key]['opera_btn'][] = $this->auth->set($this->config->item('update', 'mcms'), $this->sys_menu_auth, '<a href="' . site_url('slide/update?sys_cid=' . $this->sys_cid . '&id=' . $val['id']) . '">编辑</a>', '<a href="javascript:;" class="disabled">编辑</a>');
            $data['list']['list'][$key]['opera_btn'][] = $this->auth->set($this->config->item('del', 'mcms'), $this->sys_menu_auth, '<a href="javascript:;" class="del-hook" data-tb="slide" data-id="' . $val['id'] . '" data-url="' . site_url('ajax/del?sys_cid=' . $this->sys_cid) . '">删除</a>', '<a href="javascript:;" class="disabled">删除</a>');
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
        $this->load->view('slide/insert.html', $data);
    }

    //修改
    public function update()
    {
        $id = $this->input->get('id');
        $data['item'] = $this->slide->update($id);
        $data['uploads']['image'] = $this->upload->result($data['item']['image']);
        $data['dict'] = $this->dictionary->dict(array(
            array('rbl', 'target', 'target', $data['item']['target']),
            array('rbl', 'display', 'display', $data['item']['display'])
        ));
        $this->load->view('slide/update.html', $data);
    }

    //保存
    public function save()
    {
        $image = $this->input->post('image');
        $url = $this->input->post('url');
        $post = array(
            'id' => $this->input->post('id'),
            'vals' => array(
                'name' => $this->input->post('name'),
                'image' => (!empty($image)) ? implode(',', $image) : '',
                'url' => ($url) ? $url : prep_url($url),
                'target' => $this->input->post('target'),
                'display' => $this->input->post('display'),
                'sort' => $this->input->post('sort')
            )
        );
        $bool = $this->slide->save($post);
        //写入日志
        $this->oplog->insert($this->section_name, (!$post['id']) ? '1' : '2', $bool);
        $config['icon'] = 1;
        $config['url'] = site_url('slide?sys_cid=' . $this->sys_cid);
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