<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:11
 */
class Customer extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('customer_model');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('customer/get_list');
        $url['insert_btn'] = $this->auth->set(config_item('my_insert'), $this->sys_menu_auth, '<a class="btn btn-primary btn-sm" href="' . site_url('customer/insert') . '">新增</a>');
        $url['del_btn'] = $this->auth->set(config_item('my_del'), $this->sys_menu_auth, '<a class="btn btn-danger btn-sm batch-del-hook" href="javascript:;" data-tb="customer" data-menu="' . $this->section_name . '" data-url="' . site_url('customer/del') . '">删除</a>');
        $url['save_url'] = site_url('customer/save');
        $url['save_industry_url'] = site_url('customer/save_industry');
        $url['save_additional_info_url'] = site_url('customer/save_additional_info');
        $this->load->vars($url);
    }

    public function index()
    {
        $data['display_source'] = $this->dictionary->source('display');
        $this->load->view('customer/index.html', $data);
    }

    //获取列表
    public function get_list()
    {
        $key = $this->input->post('key');
        $page = ($this->input->post('page')) ?: 1;
        $data['list'] = $this->customer_model->get_list($key, $page);
        foreach ($data['list']['list'] as $key => $val) {
            $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_update'), $this->sys_menu_auth, '<a href="' . site_url('customer/update?id=' . $val['id']) . '">编辑</a>', '<a href="javascript:;" class="disabled">编辑</a>');
            $data['list']['list'][$key]['opera_btn'][] = $this->auth->set(config_item('my_del'), $this->sys_menu_auth, '<a href="javascript:;" class="del-hook" data-tb="customer" data-id="' . $val['id'] . '" data-menu="' . $this->section_name . '" data-url="' . site_url('customer/del') . '">删除</a>', '<a href="javascript:;" class="disabled">删除</a>');
        }
        echo json_encode($data);
    }

    //新增
    public function insert()
    {
        $data['dict'] = $this->dictionary->dict(array(
            array('ddl', 'industry', 'industry')
        ));
        $data['insert_additional_info_url'] = site_url('customer/insert_additional_info?customer_id=');
        $this->load->view('customer/insert.html', $data);
    }

    //修改
    public function update()
    {
        $id = $this->input->get('id');
        $data['record'] = $this->customer_model->update($id);
        $data['dict'] = $this->dictionary->dict(array(
            array('ddl', 'industry', 'industry', $data['record']['industry'])
        ));
        $data['insert_contact_url'] = site_url('customer/insert_contact?customer_id=' . $data['record']['id']);
        $data['insert_remark_url'] = site_url('customer/insert_remark?customer_id=' . $data['record']['id']);
        $this->load->view('customer/update.html', $data);
    }

    //保存
    public function save()
    {
        $post = array(
            'id' => $this->input->post('id'),
            'vals' => array(
                'industry' => $this->input->post('industry'),
                'company' => $this->input->post('company'),
                'alias' => $this->input->post('alias'),
                'website' => $this->input->post('website'),
                'scope_business' => $this->input->post('scope_business'),
                'sort' => $this->input->post('sort')
            )
        );
        $id = $this->customer_model->save($post);
        //写入日志
        $this->oplog->insert($this->section_name, (!$post['id']) ? '1' : '2', $id);

        echo $id;
    }

    //新增行业分类
    public function insert_industry()
    {
        $this->load->view('customer/insert_industry.html');
    }

    //保存行业分类
    public function save_industry()
    {
        $post = array(
            'name' => $this->input->post('name'),
            'pid' => 51,
            'level' => 2,
            'sort' => 100
        );
        $id = $this->customer_model->save_industry($post);

        echo json_encode(array('id' => $id, 'name' => $post['name']));
    }

    //获取附加信息
    public function get_additional_info()
    {
        $type = $this->input->get('type');
        $customer_id = $this->input->get('customer_id');
        $data['list'] = $this->customer_model->get_additional_info($type, $customer_id);

        foreach ($data['list']['list'] as $key => $val) {
            switch ($type) {
                case 'contact':
                    $data['list']['list'][$key]['tel'] = nl2br($val['tel']) ?: '<span class="text-muted">暂无</span>';
                    $data['list']['list'][$key]['mobile'] = nl2br($val['mobile']) ?: '<span class="text-muted">暂无</span>';
                    $data['list']['list'][$key]['qq'] = nl2br($val['qq']) ?: '<span class="text-muted">暂无</span>';
                    $data['list']['list'][$key]['wechat'] = nl2br($val['wechat']) ?: '<span class="text-muted">暂无</span>';
                    $data['list']['list'][$key]['email'] = nl2br($val['email']) ?: '<span class="text-muted">暂无</span>';
                    break;
                case 'remark':
                    $data['list']['list'][$key]['create_time'] = date('Y-m-d H:i', $val['create_time']);
                    break;
            }
            $data['list']['list'][$key]['menu'] = $this->section_name;
        }
        echo json_encode($data);
    }

    //新增附加信息
    public function insert_additional_info()
    {
        $type = $this->input->get('type');
        $data['customer_id'] = $this->input->get('customer_id');
        $this->load->view("customer/insert_{$type}.html", $data);
    }

    //修改附加信息
    public function update_additional_info()
    {
        $type = $this->input->get('type');
        $id = $this->input->get('id');
        $data['record'] = $this->customer_model->update_additional_info($type, $id);
        $this->load->view("customer/update_{$type}.html", $data);
    }

    //保存附加信息
    public function save_additional_info()
    {
        $type = $this->input->post('type');
        switch ($type) {
            case 'contact':
                $post = array(
                    'id' => $this->input->post('id'),
                    'type' => $type,
                    'vals' => array(
                        'customer_id' => $this->input->post('customer_id'),
                        'name' => $this->input->post('name'),
                        'post' => $this->input->post('post'),
                        'tel' => $this->input->post('tel'),
                        'mobile' => $this->input->post('mobile'),
                        'qq' => $this->input->post('qq'),
                        'wechat' => $this->input->post('wechat'),
                        'email' => $this->input->post('email')
                    )
                );
                break;
            case 'remark':
                $post = array(
                    'id' => $this->input->post('id'),
                    'type' => $type,
                    'vals' => array(
                        'customer_id' => $this->input->post('customer_id'),
                        'content' => $this->input->post('content'),
                        'create_time' => time()
                    )
                );
                break;
        }
        $bool = $this->customer_model->save_additional_info($post);

        echo $bool;
    }

    //删除
    public function del()
    {
        $id = explode(',', $this->input->post('id'));
        $menu = $this->input->post('menu');
        $rows = $this->customer_model->del($id);
        //写入日志
        $this->oplog->insert($menu, '3', $rows);

        echo $rows;
    }

}