<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:11
 */
class Config_group extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('config_group_model', 'config_group');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('config_group/get_list?sys_cid=' . $this->sys_cid);
        $url['insert_btn'] = $this->sys_auth->set_auth(MYINSERT, $this->col_auth, '<a class="btn btn-primary" href="' . site_url('config_group/insert?sys_cid=' . $this->sys_cid) . '">新增</a>');
        $url['del_btn'] = $this->sys_auth->set_auth(MYDEL, $this->col_auth, '<a class="btn btn-default" href="javascript:;" data-name="batchDel" data-tb="config_group" data-checkname="id" data-url = "' . site_url('ajax/batch_del?sys_cid=' . $this->sys_cid) . '">删除</a>');
        $url['search_btn'] = $this->sys_auth->set_auth(MYLOOK, $this->col_auth, '<button type="button" data-name="searchbtn" class="btn btn-default">搜索</button>');
        $url['save_url'] = site_url('config_group/save?sys_cid=' . $this->sys_cid);
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('config_group/index.html');
    }

    //获得列表
    public function get_list()
    {
        $data['list'] = $this->config_group->get_list();
        foreach ($data['list']['list'] as $key => $val) {
            $data['list']['list'][$key]['update_btn'] = $this->sys_auth->set_auth(MYUPDATE, $this->col_auth, '<a href="' . site_url('config_group/update?sys_cid=' . $this->sys_cid . '&id=' . $val['id']) . '">编辑</a>', '<a href="javascript:;" class="disabled">编辑</a>');
            $data['list']['list'][$key]['del_btn'] = $this->sys_auth->set_auth(MYDEL, $this->col_auth, '<a href="javascript:;" data-name="del" data-tb="config_group" data-id="' . $val['id'] . '" data-url="' . site_url('ajax/del') . '">删除</a>', '<a href="javascript:;" class="disabled">删除</a>');
        }
        echo json_encode($data);
    }

    //新增
    public function insert()
    {
        $data['display'] = $this->sys_dict->radio_button_list(9, 'display');
        $this->load->view('config_group/insert.html', $data);
    }

    //更新
    public function update()
    {
        $data['item'] = $this->config_group->update();
        $data['display'] = $this->sys_dict->radio_button_list(9, 'display', $data['item']['display']);
        $this->load->view('config_group/update.html', $data);
    }

    //保存
    public function save()
    {
        $bool = $this->config_group->save();
        if ($bool) {
            switch ($this->is_save) {
                case '1':
                    $this->prompt->success('操作成功！', site_url('config_group?sys_cid=' . $this->sys_cid));
                    break;
                case '2':
                    $this->prompt->success('操作成功！', $this->peferer);
                    break;
            }
        } else {
            $this->prompt->error('操作失败！', site_url('config_group?sys_cid=' . $this->sys_cid));
        }
    }

}