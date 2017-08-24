<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:11
 */
class Sys_user extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('sys_user_model', 'sys_user');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('sys_user/get_list?sys_cid=' . $this->sys_cid);
        $url['insert_btn'] = $this->sys_auth->set_auth(MYINSERT, $this->col_auth, '<a class="btn btn-primary btn-sm" href="' . site_url('sys_user/insert?sys_cid=' . $this->sys_cid) . '">新增</a>');
        $url['del_btn'] = $this->sys_auth->set_auth(MYDEL, $this->col_auth, '<a class="btn btn-danger btn-sm batch-del-mhook" href="javascript:;" data-tb="sys_user" data-checkname="id" data-url = "' . site_url('ajax/batch_del?sys_cid=' . $this->sys_cid) . '">删除</a>');
        $url['search_btn'] = $this->sys_auth->set_auth(MYLOOK, $this->col_auth, '<button type="button" class="btn btn-info btn-sm search-btn-mhook">搜索</button>');
        $url['save_url'] = site_url('sys_user/save?sys_cid=' . $this->sys_cid);
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('sys_user/index.html');
    }

    //获得列表
    public function get_list()
    {
        $data['list'] = $this->sys_user->get_list();
        foreach ($data['list']['list'] as $key => $val) {
            if ($val['user_type'] == 1) {
                $data['list']['list'][$key]['opera_btn'][] = '<a href="javascript:;" class="disabled">设置权限</a>';
                $data['list']['list'][$key]['opera_btn'][] = $this->sys_auth->set_auth(MYUPDATE, $this->col_auth, '<a href="' . site_url('sys_user/update?sys_cid=' . $this->sys_cid . '&id=' . $val['id']) . '">编辑</a>', '<a href="javascript:;" class="disabled">编辑</a>');
                $data['list']['list'][$key]['opera_btn'][] = '<a href="javascript:;" class="disabled">删除</a>';
                $data['list']['list'][$key]['disabled'] = 'disabled';
            } elseif ($val['user_type'] == 2) {
                $data['list']['list'][$key]['opera_btn'][] = $this->sys_auth->set_auth(MYINSERT, $this->col_auth, '<a href="' . site_url('sys_user_auth?sys_cid=' . $this->sys_cid . '&user_id=' . $val['id']) . '">设置权限</a>', '<a href="javascript:;" class="disabled">设置权限</a>');
                $data['list']['list'][$key]['opera_btn'][] = $this->sys_auth->set_auth(MYUPDATE, $this->col_auth, '<a href="' . site_url('sys_user/update?sys_cid=' . $this->sys_cid . '&id=' . $val['id']) . '">编辑</a>', '<a href="javascript:;" class="disabled">编辑</a>');
                $data['list']['list'][$key]['opera_btn'][] = $this->sys_auth->set_auth(MYDEL, $this->col_auth, '<a href="javascript:;" class="del-mhook" data-tb="sys_user" data-id="' . $val['id'] . '" data-url="' . site_url('ajax/del?sys_cid=' . $this->sys_cid) . '">删除</a>', '<a href="javascript:;" class="disabled">删除</a>');
                $data['list']['list'][$key]['disabled'] = '';
            }
        }
        echo json_encode($data);
    }

    //新增
    public function insert()
    {
        $data['sys_role'] = ddl($this->sys_user->sys_role(), 'role_id');
        $data['status'] = $this->sys_dict->rbl('user_status', 'status');
        $this->load->view('sys_user/insert.html', $data);
    }

    //更新
    public function update()
    {
        $data['item'] = $this->sys_user->update();
        $data['disabled'] = ($data['item']['user_type'] == 1) ? 'disabled' : '';
        $data['sys_role'] = ddl($this->sys_user->sys_role(), 'role_id', $data['item']['role_id'], $data['disabled']);
        $data['status'] = $this->sys_dict->rbl('user_status', 'status', $data['item']['status'], $data['disabled']);
        $this->load->view('sys_user/update.html', $data);
    }

    //保存
    public function save()
    {
        $bool = $this->sys_user->save();
        //写入日志
        $this->sys_log->insert($this->section_name, (!$this->input->post('id')) ? '1' : '2', $bool);
        $config['icon'] = 1;
        $config['url'] = site_url('sys_user?sys_cid=' . $this->sys_cid);
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