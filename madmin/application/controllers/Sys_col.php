<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/22
 * Time: 10:04
 */
class Sys_col extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('sys_col_model', 'sys_col');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('sys_col/get_list?sys_cid=' . $this->sys_cid);
        $url['insert_btn'] = $this->sys_auth_lib->set_auth($this->config->item('insert', 'mcms'), $this->col_auth, '<a class="btn btn-primary btn-sm" href="' . site_url('sys_col/insert?sys_cid=' . $this->sys_cid) . '">新增</a>');
        $url['save_url'] = site_url('sys_col/save?sys_cid=' . $this->sys_cid);
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('sys_col/index.html');
    }

    //获取列表
    public function get_list()
    {
        $data['list'] = $this->sys_col->get_list();
        foreach ($data['list']['list'] as $key => $val) {
            $data['list']['list'][$key]['user_type_name'] = '<span style="color:' . $val['user_type_color'] . ';">' . $val['user_type_name'] . '</span>';
            $data['list']['list'][$key]['display_name'] = '<span style="color:' . $val['display_color'] . ';">' . $val['display_name'] . '</span>';
            $data['list']['list'][$key]['prefix'] = str_repeat('&nbsp;&nbsp;', ($val['level'] - 1) * 2) . (($val['level'] > 1) ? '└─&nbsp;' : '');
            $data['list']['list'][$key]['opera_btn'][] = $this->sys_auth_lib->set_auth($this->config->item('insert', 'mcms'), $this->col_auth, '<a href="' . site_url('sys_col/insert?sys_cid=' . $this->sys_cid . '&id=' . $val['id']) . '">新增下级</a>', '<a href="javascript:;" class="disabled">新增下级</a>');
            $data['list']['list'][$key]['opera_btn'][] = $this->sys_auth_lib->set_auth($this->config->item('update', 'mcms'), $this->col_auth, '<a href="' . site_url('sys_col/update?sys_cid=' . $this->sys_cid . '&id=' . $val['id']) . '">编辑</a>', '<a href="javascript:;" class="disabled">编辑</a>');
            $data['list']['list'][$key]['opera_btn'][] = $this->sys_auth_lib->set_auth($this->config->item('del', 'mcms'), $this->col_auth, '<a href="javascript:;" class="del-hook" data-id="' . $val['id'] . '" data-url="' . site_url('sys_col/del?sys_cid=' . $this->sys_cid) . '">删除</a>', '<a href="javascript:;" class="disabled">删除</a>');
        }
        echo json_encode($data);
    }

    //新增
    public function insert()
    {
        $id = $this->input->get('id');
        $data['cols'] = $this->tree->ddl($this->sys_col->data(), 'pid', $id);
        $data['dict'] = $this->common_dict_lib->dict(array(
            array('cbl', 'sys_col_auth', 'auth'),
            array('rbl', 'display', 'display'),
            array('rbl', 'user_type', 'user_type')
        ));
        $this->load->view('sys_col/insert.html', $data);
    }

    //修改
    public function update()
    {
        $id = $this->input->get('id');
        $data['item'] = $this->sys_col->update($id);
        $data['cols'] = $this->tree->ddl($this->sys_col->data(), 'pid', $data['item']['pid'], $data['item']['id']);
        $data['dict'] = $this->common_dict_lib->dict(array(
            array('cbl', 'sys_col_auth', 'auth', $data['item']['col_auth']),
            array('rbl', 'display', 'display', $data['item']['display']),
            array('rbl', 'user_type', 'user_type', $data['item']['user_type'])
        ));
        $this->load->view('sys_col/update.html', $data);
    }


    //保存
    public function save()
    {
        $post = array(
            'id' => $this->input->post('id'),
            'auth' => $this->input->post('auth'),
            'vals' => array(
                'name' => $this->input->post('name'),
                'pid' => $this->input->post('pid'),
                'icon' => $this->input->post('icon'),
                'url' => $this->input->post('url'),
                'remark' => $this->input->post('remark'),
                'user_type' => $this->input->post('user_type'),
                'display' => $this->input->post('display'),
                'sort' => $this->input->post('sort'),
            )
        );
        $bool = $this->sys_col->save($post);
        //写入日志
        $this->sys_log_lib->insert($this->section_name, (!$post['id']) ? '1' : '2', $bool);
        $config['icon'] = 1;
        $config['url'] = site_url('sys_col?sys_cid=' . $this->sys_cid);
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

    //删除
    public function del()
    {
        $id = $this->input->post('id');
        $this->sys_col->del_col_auth($id);//删除系统栏目权限
        $rows = $this->tree->del($this->sys_col->data(), 'sys_col', $id);//删除系统栏目
        $this->sys_log_lib->insert($this->section_name, '3', $rows);//日志
        echo $rows;
    }

}