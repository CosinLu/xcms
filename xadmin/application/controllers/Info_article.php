<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:11
 */
require_once 'Info.php';

class Info_article extends Info
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('info_article_model');
        $this->load->model('info_model');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('info_article/get_list?cid=' . $this->cid);
        $url['insert_btn'] = $this->auth->set(config_item('my_insert'), $this->sys_menu_auth, '<a class="btn btn-primary btn-sm" href="' . site_url('info_article/insert?cid=' . $this->cid) . '">新增</a>');
        $url['del_btn'] = $this->auth->set(config_item('my_del'), $this->sys_menu_auth, '<a class="btn btn-danger btn-sm batch-del-hook" href="javascript:;" data-tb="info_article" data-checkname="id" data-menu="' . $this->main_section_name . '" data-url = "' . site_url('api/batch_del?cid=' . $this->cid) . '">删除</a>');
        $url['save_url'] = site_url('info_article/save?cid=' . $this->cid);
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('info_article/index.html');
    }

    //获取列表
    public function get_list()
    {
        $key = $this->input->post('key');
        $page = ($this->input->post('page')) ?: 1;
        $data['list'] = $this->info_article_model->get_list($this->children_cid, $key, $page);
        foreach ($data['list']['list'] as $key => $val) {
            $data['list']['list'][$key]['title'] = $val['title'];
            $data['list']['list'][$key]['display_name'] = '<span style="color:' . $val['display_color'] . ';">' . $val['display_name'] . '</span>';
            $data['list']['list'][$key]['create_time'] = date('Y-m-d H:i', $val['create_time']);
            $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_update'), $this->sys_menu_auth, '<a href="' . site_url('info_article/update?cid=' . $this->cid . '&id=' . $val['id']) . '">编辑</a>', '<a href="javascript:;" class="disabled">编辑</a>');
            $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_del'), $this->sys_menu_auth, '<a href="javascript:;" class="del-hook" data-tb="info_article" data-id="' . $val['id'] . '" data-menu="' . $this->main_section_name . '" data-url="' . site_url('api/del?cid=' . $this->cid) . '">删除</a>', '<a href="javascript:;" class="disabled">删除</a>');
        }
        echo json_encode($data);
    }

    //新增
    public function insert()
    {
        $data['cols'] = $this->tree->ddl($this->info_model->data(), 'cid', $this->cid, '', $this->model_id());
        $data['dict'] = $this->dictionary->dict(array(
            array('rbl', 'target', 'target'),
            array('rbl', 'display', 'display')
        ));
        $data['tag'] = cbl($this->info_article_model->tag(), 'tag');
        $data['create_time'] = date('Y-m-d H:i:s', time());
        $this->load->view('info_article/insert.html', $data);
    }

    //修改
    public function update()
    {
        $id = $this->input->get('id');
        $data['record'] = $this->info_article_model->update($id);
        $data['cols'] = $this->tree->ddl($this->info_model->data(), 'cid', $data['record']['cid'], '', $this->model_id());
        $data['uploads']['thumb'] = $this->upload->get($data['record']['thumb']);
        $data['dict'] = $this->dictionary->dict(array(
            array('rbl', 'target', 'target', $data['record']['target']),
            array('rbl', 'display', 'display', $data['record']['display'])
        ));
        $data['create_time'] = date('Y-m-d H:i:s', $data['record']['create_time']);
        $this->load->view('info_article/update.html', $data);
    }

    //保存
    public function save()
    {
        $thumb = $this->input->post('thumb');
        $tag = $this->input->post('tag');
        $post = array(
            'id' => $this->input->post('id'),
            'vals' => array(
                'cid' => $this->input->post('cid'),
                'title' => $this->input->post('title'),
                'original_link' => $this->input->post('original_link'),
                'auther' => $this->input->post('auther'),
                'thumb' => empty($thumb) ? '' : implode(',', $thumb),
                'target' => $this->input->post('target'),
                'display' => $this->input->post('display'),
                'sort' => $this->input->post('sort'),
                'content' => $this->input->post('content'),
                'tag' => empty($tag) ? '' : implode(',', $tag),
                'create_time' => strtotime($this->input->post('create_time'))
            )
        );
        $bool = $this->info_article_model->save($post);
        //写入日志
        $this->oplog->insert($this->main_section_name, (!$post['id']) ? '1' : '2', $bool);
        $config['icon'] = 1;
        $config['url'] = site_url('info_article?cid=' . $this->cid);
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