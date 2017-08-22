<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:11
 */
class Config_item extends MY_Controller
{
    protected $group_id;

    public function __construct()
    {
        parent::__construct();
        $this->load->model('config_item_model', 'config_item');
        $this->group_id = $this->input->get('group_id');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('config_item/get_list?sys_cid=' . $this->sys_cid . '&group_id=' . $this->group_id);
        $url['insert_btn'] = $this->sys_auth->set_auth(MYINSERT, $this->col_auth, '<a class="btn btn-primary btn-sm" href="' . site_url('config_item/insert?sys_cid=' . $this->sys_cid . '&group_id=' . $this->group_id) . '">新增</a>');
        $url['del_btn'] = $this->sys_auth->set_auth(MYDEL, $this->col_auth, '<a class="btn btn-danger btn-sm" href="javascript:;" data-name="batchDel" data-tb="config" data-checkname="id" data-url = "' . site_url('ajax/batch_del?sys_cid=' . $this->sys_cid . '&group_id=' . $this->group_id) . '">删除</a>');
        $url['search_btn'] = $this->sys_auth->set_auth(MYLOOK, $this->col_auth, '<button type="button" data-name="searchbtn" class="btn btn-info btn-sm">搜索</button>');
        $url['save_url'] = site_url('config_item/save?sys_cid=' . $this->sys_cid . '&group_id=' . $this->group_id);
        $url['back_btn'] = ($this->group_id) ? '<a href="javascript:history.back();" class="btn btn-default">返回</a>' : '';
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('config_item/index.html');
    }

    //获得列表
    public function get_list()
    {
        $data['list'] = $this->config_item->get_list();
        foreach ($data['list']['list'] as $key => $val) {
            $data['list']['list'][$key]['opera_btn'][] = $this->sys_auth->set_auth(MYUPDATE, $this->col_auth, '<a href="' . site_url('config_item/update?sys_cid=' . $this->sys_cid . '&id=' . $val['id'] . '&group_id=' . $this->group_id) . '">编辑</a>', '<a href="javascript:;" class="disabled">编辑</a>');
            $data['list']['list'][$key]['opera_btn'][] = $this->sys_auth->set_auth(MYDEL, $this->col_auth, '<a href="javascript:;" data-name="del" data-tb="config" data-id="' . $val['id'] . '" data-url="' . site_url('ajax/del?sys_cid=' . $this->sys_cid . '&group_id=' . $this->group_id) . '">删除</a>', '<a href="javascript:;" class="disabled">删除</a>');
        }
        echo json_encode($data);
    }

    //新增
    public function insert()
    {
        $data['config_group'] = ddl($this->config_item->config_group(), 'config_group_id', $this->group_id);
        $data['display'] = $this->sys_dict->rbl('display', 'display');
        $data['type'] = $this->sys_dict->rbl('config_type', 'type');
        $this->load->view('config_item/insert.html', $data);
    }

    //更新
    public function update()
    {
        $data['item'] = $this->config_item->update();
        $data['config_group'] = ddl($this->config_item->config_group(), 'config_group_id', $data['item']['config_group_id']);
        $data['display'] = $this->sys_dict->rbl('display', 'display', $data['item']['display']);
        $data['type'] = $this->sys_dict->rbl('config_type', 'type', $data['item']['type']);
        $this->load->view('config_item/update.html', $data);
    }

    //保存
    public function save()
    {
        $bool = $this->config_item->save();
        //写入日志
        $this->sys_log->insert($this->section_name, (!$this->input->post('id')) ? '1' : '2', $bool);
        $config['icon'] = 1;
        $config['url'] = site_url('config_item?sys_cid=' . $this->sys_cid . '&group_id=' . $this->group_id);
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