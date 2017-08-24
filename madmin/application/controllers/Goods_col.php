<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/22
 * Time: 10:04
 */
class Goods_col extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('goods_col_model', 'goods_col');
        $this->load->library('category', array('tb_name' => 'goods_col'), 'category');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('goods_col/get_list?sys_cid=' . $this->sys_cid);
        $url['insert_btn'] = $this->sys_auth->set_auth(MYINSERT, $this->col_auth, '<a class="btn btn-primary btn-sm" href="' . site_url('goods_col/insert?sys_cid=' . $this->sys_cid) . '">新增</a>');
        $url['save_url'] = site_url('goods_col/save?sys_cid=' . $this->sys_cid);
        $url['del_url'] = site_url('goods_col/del?sys_cid=' . $this->sys_cid);
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('goods_col/index.html');
    }

    //获得列表
    public function get_list()
    {
        $data['list'] = $this->goods_col->get_list();
        foreach ($data['list']['list'] as $key => $val) {
            $disabled_insert_next_btn = '<a href="javascript:;" class="disabled">新增下级</a>';
            $disabled_update_btn = '<a href="javascript:;" class="disabled">编辑</a>';
            $disabled_del_btn = '<a href="javascript:;" class="disabled">删除</a>';
            if ($val['add_next_auth'] == '1') {
                $data['list']['list'][$key]['opera_btn'][] = $this->sys_auth->set_auth(MYINSERT, $this->col_auth, '<a href="' . site_url('goods_col/insert?sys_cid=' . $this->sys_cid . '&id=' . $val['id']) . '">新增下级</a>', $disabled_insert_next_btn);
            } else {
                $data['list']['list'][$key]['opera_btn'][] = $disabled_insert_next_btn;
            }
            if ($val['edit_auth'] == '1') {
                $data['list']['list'][$key]['opera_btn'][] = $this->sys_auth->set_auth(MYUPDATE, $this->col_auth, '<a href="' . site_url('goods_col/update?sys_cid=' . $this->sys_cid . '&id=' . $val['id']) . '">编辑</a>', $disabled_update_btn);
            } else {
                $data['list']['list'][$key]['opera_btn'][] = $disabled_update_btn;
            }
            if ($val['del_auth'] == '1') {
                $data['list']['list'][$key]['opera_btn'][] = $this->sys_auth->set_auth(MYDEL, $this->col_auth, '<a href="javascript:;" data-name="delCol" data-id="' . $val['id'] . '">删除</a>', $disabled_del_btn);
            } else {
                $data['list']['list'][$key]['opera_btn'][] = $disabled_del_btn;
            }
            $data['list']['list'][$key]['prefix'] = str_repeat('&nbsp;&nbsp;', ($val['level'] - 1) * 2) . (($val['level'] > 1) ? '└─&nbsp;' : '');
        }
        echo json_encode($data);
    }

    //新增
    public function insert()
    {
        $id = $this->input->get('id');
        $data['cols'] = $this->category->ddl(array(), 'pid', 0, $id);
        $data['display'] = $this->sys_dict->rbl('display', 'display');
        $this->load->view('goods_col/insert.html', $data);
    }

    //更新
    public function update()
    {
        $data['item'] = $this->goods_col->update();
        $data['cols'] = $this->category->ddl(array(), 'pid', $data['item']['id'], $data['item']['pid']);
        $data['display'] = $this->sys_dict->rbl('display', 'display', $data['item']['display']);
        $this->load->view('goods_col/update.html', $data);
    }


    //保存
    public function save()
    {
        $bool = $this->goods_col->save();
        $this->sys_log->insert($this->section_name, (!$this->input->post('id')) ? '1' : '2', $bool);//日志
        $config['icon'] = 1;
        $config['url'] = site_url('goods_col?sys_cid=' . $this->sys_cid);
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
        //删除栏目
        $rows = $this->category->del($id);
        //写入日志
        $this->sys_log->insert($this->section_name, '3', $rows);
        echo $rows;
    }

}