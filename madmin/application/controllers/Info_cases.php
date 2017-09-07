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
        $this->load->library('uploads');
        $this->load->library('category', array('tb_name' => 'info_col'), 'category');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('info_cases/get_list?sys_cid=' . $this->sys_cid . '&cid=' . $this->cid);
        $url['insert_btn'] = $this->sys_auth->set_auth($this->config->item('insert', 'mcms'), $this->col_auth, '<a class="btn btn-primary btn-sm" href="' . site_url('info_cases/insert?sys_cid=' . $this->sys_cid . '&cid=' . $this->cid) . '">新增</a>');
        $url['del_btn'] = $this->sys_auth->set_auth($this->config->item('del', 'mcms'), $this->col_auth, '<a class="btn btn-danger btn-sm batch-del-hook" href="javascript:;" data-tb="info_cases" data-checkname="id" data-url = "' . site_url('ajax/batch_del?sys_cid=' . $this->sys_cid . '&cid=' . $this->cid) . '">删除</a>');
        $url['search_btn'] = $this->sys_auth->set_auth($this->config->item('look', 'mcms'), $this->col_auth, '<button type="button" class="btn btn-info btn-sm search-btn-hook">搜索</button>');
        $url['save_url'] = site_url('info_cases/save?sys_cid=' . $this->sys_cid . '&cid=' . $this->cid);
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('info_cases/index.html');
    }

    //获得列表
    public function get_list()
    {
        $key = $this->input->post('key');
        $page = ($this->input->post('page')) ?: 1;
        $data['list'] = $this->info_cases->get_list($this->cid, $key, $page);
        foreach ($data['list']['list'] as $key => $val) {
            $data['list']['list'][$key]['title'] = $val['title'];
            $data['list']['list'][$key]['display_name'] = '<span style="color:' . $val['display_color'] . ';">' . $val['display_name'] . '</span>';
            $data['list']['list'][$key]['create_time'] = date('Y-m-d H:i', $val['create_time']);
            $data['list']['list'][$key]['opera_btn'][] = $this->sys_auth->set_auth($this->config->item('update', 'mcms'), $this->col_auth, '<a href="' . site_url('info_cases/update?sys_cid=' . $this->sys_cid . '&cid=' . $this->cid . '&id=' . $val['id']) . '">编辑</a>', '<a href="javascript:;" class="disabled">编辑</a>');
            $data['list']['list'][$key]['opera_btn'][] = $this->sys_auth->set_auth($this->config->item('del', 'mcms'), $this->col_auth, '<a href="javascript:;" class="del-hook" data-tb="info_cases" data-id="' . $val['id'] . '" data-url="' . site_url('ajax/del?sys_cid=' . $this->sys_cid . '&cid=' . $this->cid . '&col_name=' . urlencode($this->main_section_name)) . '">删除</a>', '<a href="javascript:;" class="disabled">删除</a>');
        }
        echo json_encode($data);
    }

    //新增
    public function insert()
    {
        $data['cols'] = $this->category->ddl(array(), 'cid', 0, $this->cid, FALSE, $this->tpl_id());
        $data['dict'] = $this->sys_dict->dict(array(
            array('rbl', 'target', 'target'),
            array('rbl', 'display', 'display')
        ));
        $data['create_time'] = date('Y-m-d H:i:s', time());
        $this->load->view('info_cases/insert.html', $data);
    }

    //更新
    public function update()
    {
        $id = $this->input->get('id');
        $data['item'] = $this->info_cases->update($id);
        $data['cols'] = $this->category->ddl(array(), 'cid', 0, $data['item']['cid'], FALSE, $this->tpl_id());
        $data['image'] = $this->uploads->data($data['item']['image'], 'image');
        $data['images'] = $this->uploads->data($data['item']['images'], 'images');
        $data['dict'] = $this->sys_dict->dict(array(
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
        $data = array(
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
        $bool = $this->info_cases->save($data);
        //写入日志
        $this->sys_log->insert($this->main_section_name, (!$data['id']) ? '1' : '2', $bool);
        $config['icon'] = 1;
        $config['url'] = site_url('info_cases?sys_cid=' . $this->sys_cid . '&cid=' . $this->cid);
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