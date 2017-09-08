<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:11
 */
class Sys_role extends M_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('sys_role_model', 'sys_role');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('sys_role/get_list?sys_cid=' . $this->sys_cid);
        $url['insert_btn'] = $this->sys_auth->set_auth($this->config->item('insert', 'mcms'), $this->col_auth, '<a class="btn btn-primary btn-sm" href="' . site_url('sys_role/insert?sys_cid=' . $this->sys_cid) . '">新增</a>');
        $url['del_btn'] = $this->sys_auth->set_auth($this->config->item('del', 'mcms'), $this->col_auth, '<a class="btn btn-danger btn-sm batch-del-hook" href="javascript:;" data-tb="sys_role" data-checkname="id" data-url = "' . site_url('ajax/batch_del?sys_cid=' . $this->sys_cid) . '">删除</a>');
        $url['search_btn'] = $this->sys_auth->set_auth($this->config->item('look', 'mcms'), $this->col_auth, '<button type="button" class="btn btn-default btn-sm search-btn-hook">搜索</button>');
        $url['save_url'] = site_url('sys_role/save?sys_cid=' . $this->sys_cid);
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('sys_role/index.html');
    }

    //获得列表
    public function get_list()
    {
        $key = $this->input->post('key');
        $page = ($this->input->post('page')) ?: 1;
        $data['list'] = $this->sys_role->get_list($key, $page);
        foreach ($data['list']['list'] as $key => $val) {
            if ($val['role_type'] == 1) {
                $data['list']['list'][$key]['opera_btn'][] = '<a href="javascript:;" class="disabled">设置权限</a>';
                $data['list']['list'][$key]['opera_btn'][] = '<a href="javascript:;" class="disabled">编辑</a>';
                $data['list']['list'][$key]['opera_btn'][] = '<a href="javascript:;" class="disabled">删除</a>';
                $data['list']['list'][$key]['disabled'] = 'disabled';
            } elseif ($val['role_type'] == 2) {
                $data['list']['list'][$key]['opera_btn'][] = $this->sys_auth->set_auth($this->config->item('insert', 'mcms'), $this->col_auth, '<a href="' . site_url('sys_role_auth?sys_cid=' . $this->sys_cid . '&role_id=' . $val['id']) . '">设置权限</a>', '<a href="javascript:;" class="disabled">设置权限</a>');
                $data['list']['list'][$key]['opera_btn'][] = $this->sys_auth->set_auth($this->config->item('update', 'mcms'), $this->col_auth, '<a href="' . site_url('sys_role/update?sys_cid=' . $this->sys_cid . '&id=' . $val['id']) . '">编辑</a>', '<a href="javascript:;" class="disabled">编辑</a>');
                $data['list']['list'][$key]['opera_btn'][] = $this->sys_auth->set_auth($this->config->item('del', 'mcms'), $this->col_auth, '<a href="javascript:;" class="del-hook" data-tb="sys_role" data-id="' . $val['id'] . '" data-url="' . site_url('ajax/del?sys_cid=' . $this->sys_cid) . '">删除</a>', '<a href="javascript:;" class="disabled">删除</a>');
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

    //更新
    public function update()
    {
        $id = $this->input->get('id');
        $data['item'] = $this->sys_role->update($id);
        $this->load->view('sys_role/update.html', $data);
    }

    //保存
    public function save()
    {
        $data = array(
            'id' => $this->input->post('id'),
            'vals' => array(
                'name' => $this->input->post('name'),
                'remark' => $this->input->post('remark'),
                'sort' => $this->input->post('sort')
            )
        );
        $bool = $this->sys_role->save($data);
        //写入日志
        $this->sys_log->insert($this->section_name, (!$data['id']) ? '1' : '2', $bool);
        $config['icon'] = 1;
        $config['url'] = site_url('sys_role?sys_cid=' . $this->sys_cid);
        if ($bool) {
            switch ($this->is_save) {
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