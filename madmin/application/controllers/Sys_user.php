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
        $url['insert_btn'] = '<a class="btn btn-primary" href="' . site_url('sys_user/insert?sys_cid=' . $this->sys_cid) . '">新增</a>';
        $url['del_btn'] = '<a class="btn btn-default" href="javascript:;" data-name="batchDel" data-tb="sys_user" data-checkname="id" data-url = "' . site_url('ajax/batch_del?sys_cid=' . $this->sys_cid) . '">删除</a>';
        $url['search_btn'] = '<button type="button" data-name="searchbtn" class="btn btn-default">搜索</button>';
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
            $data['list']['list'][$key]['auth_btn'] = '<a href="' . site_url('role_auth?sys_cid=' . $this->sys_cid . '&role_id=' . $val['id']) . '">设置权限</a>';
            $data['list']['list'][$key]['update_btn'] = '<a href="' . site_url('sys_user/update?sys_cid=' . $this->sys_cid . '&id=' . $val['id']) . '">编辑</a>';
            $data['list']['list'][$key]['del_btn'] = '<a href="javascript:;" data-name="del" data-tb="sys_user" data-id="' . $val['id'] . '" data-url="' . site_url('ajax/del') . '">删除</a>';
        }
        echo json_encode($data);
    }

    //新增
    public function insert()
    {
        $data['sys_role'] = dropdown_list($this->sys_user->sys_role(), 'sys_role_id');
        $data['state'] = $this->sys_dict->radio_button_list(18, 'state');
        $this->load->view('sys_user/insert.html', $data);
    }

    //更新
    public function update()
    {
        $data['item'] = $this->sys_user->update();
        $data['sys_role'] = dropdown_list($this->sys_user->sys_role(), 'sys_role_id', $data['item']['sys_role_id']);
        $data['state'] = $this->sys_dict->radio_button_list(18, 'state', $data['item']['state']);
        $this->load->view('sys_user/update.html', $data);
    }

    //保存
    public function save()
    {
        $bool = $this->sys_user->save();
        if ($bool) {
            switch ($this->is_save) {
                case '1':
                    $this->prompt->success('操作成功！', site_url('sys_user?sys_cid=' . $this->sys_cid));
                    break;
                case '2':
                    $this->prompt->success('操作成功！', $this->peferer);
                    break;
            }
        } else {
            $this->prompt->error('操作失败！', site_url('sys_user?sys_cid=' . $this->sys_cid));
        }
    }

}