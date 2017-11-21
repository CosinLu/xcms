<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:11
 */
class Config_item extends MY_Controller
{
    protected $category;

    public function __construct()
    {
        parent::__construct();
        $this->load->model('config_item_model');
        $this->category = $this->input->get('category');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('config_item/get_list?category=' . $this->category);
        $url['insert_btn'] = $this->auth->set(config_item('my_insert'), $this->sys_menu_auth, '<a class="btn btn-primary btn-sm" href="' . site_url('config_item/insert?category=' . $this->category) . '">新增</a>');
        $url['del_btn'] = $this->auth->set(config_item('my_del'), $this->sys_menu_auth, '<a class="btn btn-danger btn-sm batch-del-hook" href="javascript:;" data-tb="config" data-menu="' . $this->section_name . '" data-url = "' . site_url('api/batch_del?category=' . $this->category) . '">删除</a>');
        $url['save_url'] = site_url('config_item/save?category=' . $this->category);
        $this->load->vars($url);
    }

    public function index()
    {
        $data['display_source'] = $this->dictionary->source('display');
        $this->load->view('config_item/index.html',$data);
    }

    //获取列表
    public function get_list()
    {
        $key = $this->input->post('key');
        $page = ($this->input->post('page')) ?: 1;
        $data['list'] = $this->config_item_model->get_list($key, $page, $this->category);
        foreach ($data['list']['list'] as $key => $val) {
            $data['list']['list'][$key]['display_name'] = '<span style="color:' . $val['display_color'] . ';">' . $val['display_name'] . '</span>';
            $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_update'), $this->sys_menu_auth, '<a href="' . site_url('config_item/update?id=' . $val['id'] . '&category=' . $this->category) . '">编辑</a>', '<a href="javascript:;" class="disabled">编辑</a>');
            $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_del'), $this->sys_menu_auth, '<a href="javascript:;" class="del-hook" data-tb="config" data-id="' . $val['id'] . '" data-menu="' . $this->section_name . '" data-url="' . site_url('api/del?category=' . $this->category) . '">删除</a>', '<a href="javascript:;" class="disabled">删除</a>');
        }
        echo json_encode($data);
    }

    //新增
    public function insert()
    {
        $data['config_group'] = ddl($this->config_item_model->config_group(), 'category', $this->category, '', TRUE, 'category', 'name');
        $data['dict'] = $this->dictionary->dict(array(
            array('rbl', 'display', 'display'),
            array('rbl', 'config_type', 'type')
        ));
        $this->load->view('config_item/insert.html', $data);
    }

    //修改
    public function update()
    {
        $id = $this->input->get('id');
        $data['record'] = $this->config_item_model->update($id);
        $data['config_group'] = ddl($this->config_item_model->config_group(), 'category', $data['record']['category'], '', TRUE, 'category', 'name');
        $data['dict'] = $this->dictionary->dict(array(
            array('rbl', 'display', 'display', $data['record']['display']),
            array('rbl', 'config_type', 'type', $data['record']['type'])
        ));
        $this->load->view('config_item/update.html', $data);
    }

    //保存
    public function save()
    {
        $post = array(
            'id' => $this->input->post('id'),
            'vals' => array(
                'name' => $this->input->post('name'),
                'variable' => $this->input->post('variable'),
                'category' => $this->input->post('category'),
                'type' => $this->input->post('type'),
                'param' => $this->input->post('param'),
                'remark' => $this->input->post('remark'),
                'display' => $this->input->post('display'),
                'sort' => $this->input->post('sort')
            )
        );
        $bool = $this->config_item_model->save($post);
        //写入日志
        $this->oplog->insert($this->section_name, (!$post['id']) ? '1' : '2', $bool);
        $config['icon'] = 1;
        $config['url'] = site_url('config_item?category=' . $this->category);
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