<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/22
 * Time: 10:04
 */
class Info_col extends M_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('info_col_model', 'info_col');
        $this->load->library('category_lib', array('tb_name' => 'info_col'), 'category_lib');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('info_col/get_list?sys_cid=' . $this->sys_cid);
        $url['insert_btn'] = $this->sys_auth_lib->set_auth($this->config->item('insert', 'mcms'), $this->col_auth, '<a class="btn btn-primary btn-sm" href="' . site_url('info_col/insert?sys_cid=' . $this->sys_cid) . '">新增</a>');
        $url['save_url'] = site_url('info_col/save?sys_cid=' . $this->sys_cid);
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('info_col/index.html');
    }

    //获得列表
    public function get_list()
    {
        $data['list'] = $this->info_col->get_list();
        foreach ($data['list']['list'] as $key => $val) {
            $data['list']['list'][$key]['link'] = $val['url'] ?: $val['dir'];
            $data['list']['list'][$key]['display_name'] = '<span style="color:' . $val['display_color'] . ';">' . $val['display_name'] . '</span>';
            $data['list']['list'][$key]['prefix'] = str_repeat('&nbsp;&nbsp;', ($val['level'] - 1) * 2) . (($val['level'] > 1) ? '└─&nbsp;' : '');
            $disabled_insert_next_btn = '<a href="javascript:;" class="disabled">新增下级</a>';
            $disabled_update_btn = '<a href="javascript:;" class="disabled">编辑</a>';
            $disabled_del_btn = '<a href="javascript:;" class="disabled">删除</a>';
            if ($val['add_next_auth'] == '1') {
                $data['list']['list'][$key]['opera_btn'][] = $this->sys_auth_lib->set_auth($this->config->item('insert', 'mcms'), $this->col_auth, '<a href="' . site_url('info_col/insert?sys_cid=' . $this->sys_cid . '&id=' . $val['id']) . '">新增下级</a>', $disabled_insert_next_btn);
            } else {
                $data['list']['list'][$key]['opera_btn'][] = $disabled_insert_next_btn;
            }
            if ($val['edit_auth'] == '1') {
                $data['list']['list'][$key]['opera_btn'][] = $this->sys_auth_lib->set_auth($this->config->item('update', 'mcms'), $this->col_auth, '<a href="' . site_url('info_col/update?sys_cid=' . $this->sys_cid . '&id=' . $val['id']) . '">编辑</a>', $disabled_update_btn);
            } else {
                $data['list']['list'][$key]['opera_btn'][] = $disabled_update_btn;
            }
            if ($val['del_auth'] == '1') {
                $data['list']['list'][$key]['opera_btn'][] = $this->sys_auth_lib->set_auth($this->config->item('del', 'mcms'), $this->col_auth, '<a href="javascript:;" class="del-hook" data-id="' . $val['id'] . '" data-url="' . site_url('info_col/del?sys_cid=' . $this->sys_cid) . '">删除</a>', $disabled_del_btn);
            } else {
                $data['list']['list'][$key]['opera_btn'][] = $disabled_del_btn;
            }
        }
        echo json_encode($data);
    }

    //新增
    public function insert()
    {
        $id = $this->input->get('id');
        $data['cols'] = $this->category_lib->ddl(array(), 'pid', 0, $id);
        $data['sys_tpl'] = ddl($this->info_col->sys_tpl(), 'tpl_id');
        $data['dict'] = $this->common_dict_lib->dict(array(
            array('rbl', 'target', 'target'),
            array('rbl', 'image', 'pic'),
            array('rbl', 'display', 'display')
        ));
        $this->load->view('info_col/insert.html', $data);
    }

    //更新
    public function update()
    {
        $id = $this->input->get('id');
        $data['item'] = $this->info_col->update($id);
        $data['sys_tpl'] = ddl($this->info_col->sys_tpl(), 'tpl_id', $data['item']['tpl_id']);
        $data['cols'] = $this->category_lib->ddl(array(), 'pid', $data['item']['id'], $data['item']['pid']);
        $data['dict'] = $this->common_dict_lib->dict(array(
            array('rbl', 'target', 'target', $data['item']['target']),
            array('rbl', 'image', 'pic', $data['item']['pic']),
            array('rbl', 'display', 'display', $data['item']['display'])
        ));
        $this->load->view('info_col/update.html', $data);
    }


    //保存
    public function save()
    {
        $data = array(
            'id' => $this->input->post('id'),
            'pid' => $this->input->post('pid'),
            'vals' => array(
                'tpl_id' => $this->input->post('tpl_id'),
                'name' => $this->input->post('name'),
                'dir' => $this->input->post('dir'),
                'url' => $this->input->post('url'),
                'target' => $this->input->post('target'),
                'pic' => $this->input->post('pic'),
                'display' => $this->input->post('display'),
                'sort' => $this->input->post('sort'),
            )
        );
        $bool = $this->info_col->save($data);
        //写入日志
        $this->sys_log_lib->insert($this->section_name, (!$data['id']) ? '1' : '2', $bool);
        $config['icon'] = 1;
        $config['url'] = site_url('info_col?sys_cid=' . $this->sys_cid);
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
        $rows = $this->category_lib->del($id);//删除栏目
        $this->sys_log_lib->insert($this->section_name, '3', $rows);//日志
        echo $rows;
    }

}