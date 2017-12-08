<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:11
 */
class Info_category_adv extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('info_category_adv_model');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('info_category_adv/get_list');
        $url['insert_btn'] = $this->auth->set(config_item('my_insert'), $this->sys_menu_auth, '<a class="btn btn-primary btn-sm" href="' . site_url('info_category_adv/insert') . '">新增</a>');
        $url['del_btn'] = $this->auth->set(config_item('my_del'), $this->sys_menu_auth, '<a class="btn btn-danger btn-sm batch-del-hook" href="javascript:;" data-tb="info_category_adv" data-menu="' . $this->section_name . '">删除</a>');
        $url['save_url'] = site_url('info_category_adv/save');
        $this->load->vars($url);
    }

    public function index()
    {
        $data['display_source'] = $this->dictionary->source('display');
        $this->load->view('info_category_adv/index.html', $data);
    }

    //获取列表
    public function get_list()
    {
        $key = $this->input->post('key');
        $page = ($this->input->post('page')) ?: 1;
        $data['list'] = $this->info_category_adv_model->get_list($key, $page);
        foreach ($data['list']['list'] as $key => $val) {
            $data['list']['list'][$key]['display_name'] = '<span style="color:' . $val['display_color'] . ';">' . $val['display_name'] . '</span>';
            $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_update'), $this->sys_menu_auth, '<a href="' . site_url('info_category_adv/update?id=' . $val['id']) . '">编辑</a>', '<a href="javascript:;" class="disabled">编辑</a>');
            $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_del'), $this->sys_menu_auth, '<a href="javascript:;" class="del-hook" data-tb="info_category_adv" data-id="' . $val['id'] . '" data-menu="' . $this->section_name . '">删除</a>', '<a href="javascript:;" class="disabled">删除</a>');
        }
        echo json_encode($data);
    }

    //新增
    public function insert()
    {
        $data['cols'] = ddl($this->info_category_adv_model->category(), 'cid');
        $data['dict'] = $this->dictionary->dict(array(
            array('rbl', 'display', 'display')
        ));
        $this->load->view('info_category_adv/insert.html', $data);
    }

    //修改
    public function update()
    {
        $id = $this->input->get('id');
        $data['record'] = $this->info_category_adv_model->update($id);
        $data['cols'] = ddl($this->info_category_adv_model->category(), 'cid', $data['record']['cid']);
        $data['uploads']['image'] = $this->upload->get($data['record']['image']);
        $data['dict'] = $this->dictionary->dict(array(
            array('rbl', 'display', 'display', $data['record']['display'])
        ));
        $this->load->view('info_category_adv/update.html', $data);
    }

    //保存
    public function save()
    {
        $url = $this->input->post('url');
        $post = array(
            'id' => $this->input->post('id'),
            'vals' => array(
                'cid' => $this->input->post('cid'),
                'name' => $this->input->post('name'),
                'indent' => $this->input->post('indent'),
                'image' => new_implode(',', $this->input->post('image')),
                'url' => ($url) ? $url : prep_url($url),
                'display' => $this->input->post('display'),
                'remark' => $this->input->post('remark'),
                'sort' => $this->input->post('sort')
            )
        );
        $bool = $this->info_category_adv_model->save($post);
        //写入日志
        $this->oplog->insert($this->section_name, (!$post['id']) ? '1' : '2', $bool);
        $config['icon'] = 1;
        $config['url'] = site_url('info_category_adv');
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