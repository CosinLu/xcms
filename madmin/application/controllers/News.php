<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:11
 */
require_once 'Information.php';

class News extends Information
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('news_model', 'news');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('news/get_list?sys_cid=' . $this->sys_cid . '&cid=' . $this->cid);
        $url['insert_btn'] = $this->auth->set(config_item('my_insert'), $this->sys_menu_auth, '<a class="btn btn-primary btn-sm" href="' . site_url('news/insert?sys_cid=' . $this->sys_cid . '&cid=' . $this->cid) . '">新增</a>');
        $url['del_btn'] = $this->auth->set(config_item('my_del'), $this->sys_menu_auth, '<a class="btn btn-danger btn-sm batch-del-hook" href="javascript:;" data-tb="news" data-checkname="id" data-url = "' . site_url('ajax/batch_del?sys_cid=' . $this->sys_cid . '&cid=' . $this->cid) . '">删除</a>');
        $url['save_url'] = site_url('news/save?sys_cid=' . $this->sys_cid . '&cid=' . $this->cid);
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('news/index.html');
    }

    //获取列表
    public function get_list()
    {
        $key = $this->input->post('key');
        $page = ($this->input->post('page')) ?: 1;
        $data['list'] = $this->news->get_list($this->cid, $key, $page);
        foreach ($data['list']['list'] as $key => $val) {
            $data['list']['list'][$key]['title'] = $val['title'];
            $data['list']['list'][$key]['display_name'] = '<span style="color:' . $val['display_color'] . ';">' . $val['display_name'] . '</span>';
            $data['list']['list'][$key]['create_time'] = date('m/d H:i', $val['create_time']);
            $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_update'), $this->sys_menu_auth, '<a href="' . site_url('news/update?sys_cid=' . $this->sys_cid . '&cid=' . $this->cid . '&id=' . $val['id']) . '">编辑</a>', '<a href="javascript:;" class="disabled">编辑</a>');
            $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_del'), $this->sys_menu_auth, '<a href="javascript:;" class="del-hook" data-tb="news" data-id="' . $val['id'] . '" data-url="' . site_url('ajax/del?sys_cid=' . $this->sys_cid . '&cid=' . $this->cid . '&col_name=' . urlencode($this->main_section_name)) . '">删除</a>', '<a href="javascript:;" class="disabled">删除</a>');
        }
        echo json_encode($data);
    }

    //新增
    public function insert()
    {
        $data['cols'] = $this->tree->ddl($this->information->data(), 'cid', $this->cid, '', $this->tpl_id());
        $data['dict'] = $this->dictionary->dict(array(
            array('rbl', 'target', 'target'),
            array('rbl', 'display', 'display')
        ));
        $data['create_time'] = date('Y-m-d H:i:s', time());
        $this->load->view('news/insert.html', $data);
    }

    //修改
    public function update()
    {
        $id = $this->input->get('id');
        $data['item'] = $this->news->update($id);
        $data['cols'] = $this->tree->ddl($this->information->data(), 'cid', $data['item']['cid'], '', $this->tpl_id());
        $data['dict'] = $this->dictionary->dict(array(
            array('rbl', 'target', 'target', $data['item']['target']),
            array('rbl', 'display', 'display', $data['item']['display'])
        ));
        $data['create_time'] = date('Y-m-d H:i:s', $data['item']['create_time']);
        $this->load->view('news/update.html', $data);
    }

    //保存
    public function save()
    {
        $post = array(
            'id' => $this->input->post('id'),
            'vals' => array(
                'cid' => $this->input->post('cid'),
                'title' => $this->input->post('title'),
                'summary' => $this->input->post('summary'),
                'target' => $this->input->post('target'),
                'display' => $this->input->post('display'),
                'sort' => $this->input->post('sort'),
                'content' => $this->input->post('content'),
                'create_time' => strtotime($this->input->post('create_time'))
            )
        );
        $bool = $this->news->save($post);
        //写入日志
        $this->oplog->insert($this->main_section_name, (!$post['id']) ? '1' : '2', $bool);
        $config['icon'] = 1;
        $config['url'] = site_url('news?sys_cid=' . $this->sys_cid . '&cid=' . $this->cid);
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