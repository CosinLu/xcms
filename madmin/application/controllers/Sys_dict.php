<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/22
 * Time: 10:04
 */
class Sys_dict extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('sys_dict_model', 'sys_dict');
        $this->load->library('category', array('tb_name' => 'sys_dict'), 'category');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('sys_dict/get_list?sys_cid=' . $this->sys_cid);
        $url['insert_btn'] = $this->sys_auth->set_auth(MYINSERT, $this->col_auth, '<a class="btn btn-primary" href="' . site_url('sys_dict/insert?sys_cid=' . $this->sys_cid) . '">新增</a>');
        $url['save_url'] = site_url('sys_dict/save?sys_cid=' . $this->sys_cid);
        $url['del_url'] = site_url('sys_dict/del?sys_cid=' . $this->sys_cid);
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('sys_dict/index.html');
    }

    //获得列表
    public function get_list()
    {
        $data['list'] = $this->sys_dict->get_list();
        foreach ($data['list']['list'] as $key => $val) {
            $data['list']['list'][$key]['name'] = '<span style="color:' . $val['color'] . '">' . $val['name'] . '</span>';
            if ($val['level'] == 1) {
                $data['list']['list'][$key]['insert_next_btn'] = $this->sys_auth->set_auth(MYINSERT, $this->col_auth, '<a href="' . site_url('sys_dict/insert?sys_cid=' . $this->sys_cid . '&id=' . $val['id']) . '">新增属性</a>', '<a href="javascript:;" class="disabled">新增属性</a>');
            }
            $data['list']['list'][$key]['update_btn'] = $this->sys_auth->set_auth(MYUPDATE, $this->col_auth, '<a href="' . site_url('sys_dict/update?sys_cid=' . $this->sys_cid . '&id=' . $val['id']) . '">编辑</a>', '<a href="javascript:;" class="disabled">编辑</a>');
            $data['list']['list'][$key]['del_btn'] = $this->sys_auth->set_auth(MYDEL, $this->col_auth, '<a href="javascript:;" data-name="delCol" data-id="' . $val['id'] . '">删除</a>', '<a href="javascript:;" class="disabled">删除</a>');
            $data['list']['list'][$key]['prefix'] = str_repeat('&nbsp;&nbsp;', ($val['level'] - 1) * 2) . ((!empty($val['level'] - 1) ? '└─&nbsp;' : ''));
        }
        echo json_encode($data);
    }

    //新增
    public function insert()
    {
        $id = $this->input->get('id');
        $data['sys_dict_type'] = $this->sys_dict->sys_dict_type();
        $data['sys_dict_col'] = $this->category->ddl('pid', 0, $id, $data['sys_dict_type']);
        $this->load->view('sys_dict/insert.html', $data);
    }

    //更新
    public function update()
    {
        $id = $this->input->get('id');
        $data['item'] = $this->sys_dict->update();
        $data['sys_dict_type'] = $this->sys_dict->sys_dict_type();
        $data['sys_dict_col'] = $this->category->ddl('pid', $id, $data['item']['pid'], $data['sys_dict_type']);
        $this->load->view('sys_dict/update.html', $data);
    }


    //保存
    public function save()
    {
        $bool = $this->sys_dict->save();
        $this->sys_log->insert($this->section_name, (!$this->input->post('id')) ? '1' : '2', $bool);//日志
        $config['icon'] = 1;
        $config['url'] = site_url('sys_dict?sys_cid=' . $this->sys_cid);
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

    //删除
    public function del()
    {
        $id = $this->input->post('id');
        $rows = $this->category->del($id);
        $this->sys_log->insert($this->section_name, '3', $rows);//日志
        echo $rows;
    }

}