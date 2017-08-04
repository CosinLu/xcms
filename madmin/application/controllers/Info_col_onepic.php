<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:11
 */
class Info_col_onepic extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('info_col_onepic_model', 'info_col_onepic');
        $this->load->library('uploadifive');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('info_col_onepic/get_list?sys_cid=' . $this->sys_cid);
        $url['insert_btn'] = $this->sys_auth->set_auth(MYINSERT, $this->col_auth, '<a class="btn btn-primary" href="' . site_url('info_col_onepic/insert?sys_cid=' . $this->sys_cid) . '">新增</a>');
        $url['del_btn'] = $this->sys_auth->set_auth(MYDEL, $this->col_auth, '<a class="btn btn-danger" href="javascript:;" data-name="batchDel" data-tb="info_col_onepic" data-checkname="id" data-url = "' . site_url('ajax/batch_del?sys_cid=' . $this->sys_cid) . '">删除</a>');
        $url['search_btn'] = $this->sys_auth->set_auth(MYLOOK, $this->col_auth, '<button type="button" data-name="searchbtn" class="btn btn-info">搜索</button>');
        $url['save_url'] = site_url('info_col_onepic/save?sys_cid=' . $this->sys_cid);
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('info_col_onepic/index.html');
    }

    //获得列表
    public function get_list()
    {
        $data['list'] = $this->info_col_onepic->get_list();
        foreach ($data['list']['list'] as $key => $val) {
            $data['list']['list'][$key]['opera_btn'][] = $this->sys_auth->set_auth(MYUPDATE, $this->col_auth, '<a href="' . site_url('info_col_onepic/update?sys_cid=' . $this->sys_cid . '&cid=' . $val['id']) . '">编辑</a>', '<a href="javascript:;" class="disabled">编辑</a>');
        }
        echo json_encode($data);
    }

    //更新
    public function update()
    {
        $data['item'] = $this->info_col_onepic->update();
        $data['image'] = $this->uploadifive->get_list($data['item']['image'], 'image');
        $this->load->view('info_col_onepic/update.html', $data);
    }

    //保存
    public function save()
    {
        $bool = $this->info_col_onepic->save();
        $this->sys_log->insert($this->section_name, '2', $bool);//日志
        $config['icon'] = 1;
        $config['url'] = site_url('info_col_onepic?sys_cid=' . $this->sys_cid);
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