<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:11
 */
class Info_col_adv extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('info_col_adv_model', 'info_col_adv');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('info_col_adv/get_list?sys_cid=' . $this->sys_cid);
        $url['insert_btn'] = $this->auth->set($this->config->item('insert', 'mcms'), $this->sys_menu_auth, '<a class="btn btn-primary btn-sm" href="' . site_url('info_col_adv/insert?sys_cid=' . $this->sys_cid) . '">新增</a>');
        $url['del_btn'] = $this->auth->set($this->config->item('del', 'mcms'), $this->sys_menu_auth, '<a class="btn btn-danger btn-sm batch-del-hook" href="javascript:;" data-tb="info_col_adv" data-checkname="id" data-url = "' . site_url('ajax/batch_del?sys_cid=' . $this->sys_cid) . '">删除</a>');
        $url['save_url'] = site_url('info_col_adv/save?sys_cid=' . $this->sys_cid);
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('info_col_adv/index.html');
    }

    //获取列表
    public function get_list()
    {
        $key = $this->input->post('key');
        $page = ($this->input->post('page')) ?: 1;
        $data['list'] = $this->info_col_adv->get_list($key, $page);
        foreach ($data['list']['list'] as $key => $val) {
            $data['list']['list'][$key]['display_name'] = '<span style="color:' . $val['display_color'] . ';">' . $val['display_name'] . '</span>';
            $data['list']['list'][$key]['opera_btn'][] = $this->auth->set($this->config->item('update', 'mcms'), $this->sys_menu_auth, '<a href="' . site_url('info_col_adv/update?sys_cid=' . $this->sys_cid . '&id=' . $val['id']) . '">编辑</a>', '<a href="javascript:;" class="disabled">编辑</a>');
            $data['list']['list'][$key]['opera_btn'][] = $this->auth->set($this->config->item('del', 'mcms'), $this->sys_menu_auth, '<a href="javascript:;" class="del-hook" data-tb="info_col_adv" data-id="' . $val['id'] . '" data-url="' . site_url('ajax/del?sys_cid' . $this->sys_cid) . '">删除</a>', '<a href="javascript:;" class="disabled">删除</a>');
        }
        echo json_encode($data);
    }

    //新增
    public function insert()
    {
        $data['cols'] = ddl($this->info_col_adv->info_col(), 'cid');
        $data['dict'] = $this->dictionary->dict(array(
            array('rbl', 'display', 'display')
        ));
        $this->load->view('info_col_adv/insert.html', $data);
    }

    //修改
    public function update()
    {
        $id = $this->input->get('id');
        $data['item'] = $this->info_col_adv->update($id);
        $data['cols'] = ddl($this->info_col_adv->info_col(), 'cid','', $data['item']['cid']);
        $data['uploads']['image'] = $this->upload->execute($data['item']['image']);
        $data['dict'] = $this->dictionary->dict(array(
            array('rbl', 'display', 'display', $data['item']['display'])
        ));
        $this->load->view('info_col_adv/update.html', $data);
    }

    //保存
    public function save()
    {
        $image = $this->input->post('image');
        $url = $this->input->post('url');
        $post = array(
            'id' => $this->input->post('id'),
            'vals' => array(
                'cid' => $this->input->post('cid'),
                'name' => $this->input->post('name'),
                'image' => (!empty($image)) ? implode(',', $image) : '',
                'url' => ($url) ? $url : prep_url($url),
                'display' => $this->input->post('display'),
                'remark' => $this->input->post('remark'),
                'sort' => $this->input->post('sort')
            )
        );
        $bool = $this->info_col_adv->save($post);
        //写入日志
        $this->oplog->insert($this->section_name, (!$post['id']) ? '1' : '2', $bool);
        $config['icon'] = 1;
        $config['url'] = site_url('info_col_adv?sys_cid=' . $this->sys_cid);
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

}