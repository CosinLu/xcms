<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:11
 */
class Wx_beadded extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('wx_beadded_model', 'wx_beadded');
        $this->load->library('uploadifive');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('wx_beadded/get_list?sys_cid=' . $this->sys_cid);
        $url['insert_btn'] = $this->sys_auth->set_auth(MYINSERT, $this->col_auth, '<a class="btn btn-primary" href="' . site_url('wx_beadded/insert?sys_cid=' . $this->sys_cid) . '">新增</a>');
        $url['del_btn'] = $this->sys_auth->set_auth(MYDEL, $this->col_auth, '<a class="btn btn-default" href="javascript:;" data-name="batchDel" data-tb="wx_beadded" data-checkname="id" data-url = "' . site_url('ajax/batch_del?sys_cid=' . $this->sys_cid) . '">删除</a>');
        $url['search_btn'] = $this->sys_auth->set_auth(MYLOOK, $this->col_auth, '<button type="button" data-name="searchbtn" class="btn btn-default">搜索</button>');
        $url['save_url'] = site_url('wx_beadded/save?sys_cid=' . $this->sys_cid);
        $this->load->vars($url);
    }

    //更新
    public function index()
    {
        $data['item'] = $this->wx_beadded->update();
        $data['display'] = $this->sys_dict->rbl('display', 'display', $data['item']['display']);
        $data['image'] = $this->uploadifive->get_list($data['item']['image'], 'image');
        $this->load->view('wx_beadded/update.html', $data);
    }

    //保存
    public function save()
    {
        $bool = $this->wx_beadded->save();
        $this->sys_log->insert($this->section_name, (!$this->input->post('id')) ? '1' : '2', $bool);//日志
        $config['icon'] = 1;
        $config['url'] = site_url('wx_beadded?sys_cid=' . $this->sys_cid);
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