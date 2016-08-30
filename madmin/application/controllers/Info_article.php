<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:11
 */
class Info_article extends MY_info_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('info_article_model', 'info_article');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('info_article/get_list?sys_cid=' . $this->sys_cid);
        $url['insert_btn'] = '<a class="btn btn-primary" href="' . site_url('info_article/insert?sys_cid=' . $this->sys_cid . '&info_cid=' . $this->info_cid) . '">新增</a>';
        $url['del_btn'] = '<a class="btn btn-default" href="javascript:;" data-name="batchDel" data-tb="info_article" data-checkname="id" data-url = "' . site_url('ajax/batch_del?sys_cid=' . $this->sys_cid . '&info_cid=' . $this->info_cid) . '">删除</a>';
        $url['search_btn'] = '<button type="button" data-name="searchbtn" class="btn btn-default">搜索</button>';
        $url['save_url'] = site_url('info_article/save?sys_cid=' . $this->sys_cid . '&info_cid=' . $this->info_cid);
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('info_article/index.html');
    }

    //获得列表
    public function get_list()
    {
        $data['list'] = $this->info_article->get_list();
        foreach ($data['list']['list'] as $key => $val) {
            $data['list']['list'][$key]['update_btn'] = '<a href="' . site_url('info_article/update?sys_cid=' . $this->sys_cid . '&info_cid=' . $this->info_cid . '&id=' . $val['id']) . '">编辑</a>';
            $data['list']['list'][$key]['del_btn'] = '<a href="javascript:;" data-name="del" data-tb="info_article" data-id="' . $val['id'] . '" data-url="' . site_url('ajax/del') . '">删除</a>';
        }
        echo json_encode($data);
    }

    //新增
    public function insert()
    {
        $data['display'] = $this->sys_dict->radio_button_list(9, 'display');
        $this->load->view('info_article/insert.html', $data);
    }

    //更新
    public function update()
    {
        $data['item'] = $this->info_article->update();
        $data['display'] = $this->sys_dict->radio_button_list(9, 'display', $data['item']['display']);
        $this->load->view('info_article/update.html', $data);
    }

    //保存
    public function save()
    {
        $bool = $this->info_article->save();
        if ($bool) {
            switch ($this->is_save) {
                case '1':
                    $this->prompt->success('操作成功！', site_url('info_article?sys_cid=' . $this->sys_cid . '&info_cid=' . $this->info_cid));
                    break;
                case '2':
                    $this->prompt->success('操作成功！', $this->peferer);
                    break;
            }
        } else {
            $this->prompt->error('操作失败！', site_url('info_article?sys_cid=' . $this->sys_cid . '&info_cid=' . $this->info_cid));
        }
    }

}