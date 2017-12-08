<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:11
 */
class Comment extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('comment_model');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('comment/get_list');
        $url['insert_btn'] = $this->auth->set(config_item('my_insert'), $this->sys_menu_auth, '<a class="btn btn-primary btn-sm" href="' . site_url('comment/insert') . '">新增</a>');
        $url['del_btn'] = $this->auth->set(config_item('my_del'), $this->sys_menu_auth, '<a class="btn btn-danger btn-sm batch-del-hook" href="javascript:;" data-tb="comment" data-menu="' . $this->section_name . '">删除</a>');
        $url['save_url'] = site_url('comment/save');
        $this->load->vars($url);
    }

    public function index()
    {
        $data['audit_status_source'] = $this->dictionary->source('audit_status');
        $this->load->view('comment/index.html', $data);
    }

    //获取列表
    public function get_list()
    {
        $key = $this->input->post('key');
        $page = ($this->input->post('page')) ?: 1;
        $data['list'] = $this->comment_model->get_list($key, $page);
        foreach ($data['list']['list'] as $key => $val) {
            $data['list']['list'][$key]['audit_status_name'] = '<span style="color:' . $val['audit_status_color'] . '">' . $val['audit_status_name'] . '</span>';
            $data['list']['list'][$key]['create_time'] = date('Y-m-d H:i:s', $val['create_time']);
            $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_update'), $this->sys_menu_auth, '<a href="' . site_url('comment/update?id=' . $val['id']) . '">编辑</a>', '<a href="javascript:;" class="disabled">编辑</a>');
            $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_del'), $this->sys_menu_auth, '<a href="javascript:;" class="del-hook" data-tb="comment" data-id="' . $val['id'] . '" data-menu="' . $this->section_name . '">删除</a>', '<a href="javascript:;" class="disabled">删除</a>');
        }
        echo json_encode($data);
    }

    //新增
    public function insert()
    {
        $data['dict'] = $this->dictionary->dict(array(
            array('rbl', 'audit_status', 'audit_status')
        ));
        $this->load->view('comment/insert.html', $data);
    }

    //修改
    public function update()
    {
        $id = $this->input->get('id');
        $data['record'] = $this->comment_model->update($id);
        $data['record']['create_time'] = date('Y-m-d H:i:s', $data['record']['create_time']);
        switch ($data['record']['source']) {
            case 'info_article':
                $data['record']['source'] = '文章';
                break;
            case 'info_work':
                $data['record']['source'] = '作品';
                break;
        }
        $data['dict'] = $this->dictionary->dict(array(
            array('rbl', 'audit_status', 'audit_status', $data['record']['audit_status'])
        ));
        $this->load->view('comment/update.html', $data);
    }

    //保存
    public function save()
    {
        $post = array(
            'id' => $this->input->post('id'),
            'vals' => array(
                'audit_status' => $this->input->post('audit_status')
            )
        );
        $bool = $this->comment_model->save($post);
        //写入日志
        $this->oplog->insert($this->section_name, (!$post['id']) ? '1' : '2', $bool);
        $config['icon'] = 1;
        $config['url'] = site_url('comment');
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