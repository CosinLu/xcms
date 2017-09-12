<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/22
 * Time: 10:04
 */
class Common_dict extends M_Controller
{
    protected $pid;
    protected $user_type;

    public function __construct()
    {
        parent::__construct();
        //pid为空的时默认为第一级
        $this->pid = $this->input->get('pid') ?: 0;
        //判断用户类型
        $this->user_type = $this->session->sys_session['user_type'] == 0 ? 'dev' : 'pro';
        $this->load->model('common_dict_model', 'common_dict');
        $this->load->library('category_lib', array('tb_name' => 'common_dict'), 'category_lib');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['index_back_btn'] = ($this->pid) ? go_back(site_url('common_dict?sys_cid=' . $this->sys_cid)) : '';
        $url['get_list_url'] = site_url('common_dict/get_list?sys_cid=' . $this->sys_cid . '&pid=' . $this->pid);
        $url['insert_btn'] = $this->sys_auth_lib->set_auth($this->config->item('insert', 'mcms'), $this->col_auth, '<a class="btn btn-primary btn-sm" href="' . site_url('common_dict/insert?sys_cid=' . $this->sys_cid . '&pid=' . $this->pid) . '">新增</a>');
        $url['search_btn'] = $this->sys_auth_lib->set_auth($this->config->item('look', 'mcms'), $this->col_auth, '<button type="button" class="btn btn-default btn-sm search-btn-hook">搜索</button>');
        $url['save_url'] = site_url('common_dict/save?sys_cid=' . $this->sys_cid . '&pid=' . $this->pid);
        $url['del_url'] = site_url('common_dict/del?sys_cid=' . $this->sys_cid . '&pid=' . $this->pid);
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('common_dict/index.html');
    }

    //获得列表
    public function get_list()
    {
        $key = $this->input->post('key');
        $page = $this->input->post('page') ?: 1;
        $data['list'] = $this->common_dict->get_list($this->pid, $key, $page, $this->user_type);
        foreach ($data['list']['list'] as $key => $val) {
            $data['list']['list'][$key]['name'] = '<span style="color:' . $val['color'] . '">' . $val['name'] . '</span>';
            if (!$this->pid) {
                $data['list']['list'][$key]['opera_btn'][] = '<a href="' . site_url('common_dict?sys_cid=' . $this->sys_cid . '&pid=' . $val['id']) . '">编辑属性</a>';
            }
            $data['list']['list'][$key]['opera_btn'][] = $this->sys_auth_lib->set_auth($this->config->item('update', 'mcms'), $this->col_auth, '<a href="' . site_url('common_dict/update?sys_cid=' . $this->sys_cid . '&id=' . $val['id'] . '&pid=' . $val['pid']) . '">编辑</a>', '<a href="javascript:;" class="disabled">编辑</a>');
            $data['list']['list'][$key]['opera_btn'][] = $this->sys_auth_lib->set_auth($this->config->item('del', 'mcms'), $this->col_auth, '<a href="javascript:;" class="del-col-hook" data-id="' . $val['id'] . '">删除</a>', '<a href="javascript:;" class="disabled">删除</a>');
        }
        echo json_encode($data);
    }

    //新增
    public function insert()
    {
        $data['pid'] = $this->pid;
        $data['user_type'] = $this->user_type;
        $data['common_dict_type'] = $this->common_dict->common_dict_type();
        if ($this->user_type == 'dev') {
            $data['dict'] = $this->common_dict_lib->dict(array(
                array('rbl', 'user_type', 'user_type')
            ));
        }
        $this->load->view('common_dict/insert.html', $data);
    }

    //更新
    public function update()
    {
        $id = $this->input->get('id');
        $data['pid'] = $this->pid;
        $data['user_type'] = $this->user_type;
        $data['item'] = $this->common_dict->update($id);
        $data['common_dict_type'] = $this->common_dict->common_dict_type();
        if ($this->user_type == 'dev') {
            $data['dict'] = $this->common_dict_lib->dict(array(
                array('rbl', 'user_type', 'user_type', $data['item']['user_type'])
            ));
        }
        $this->load->view('common_dict/update.html', $data);
    }


    //保存
    public function save()
    {
        $data = array(
            'id' => $this->input->post('id'),
            'pid' => $this->input->post('pid'),
            'vals' => array(
                'name' => $this->input->post('name'),
                'ident' => $this->input->post('ident'),
                'color' => $this->input->post('color'),
                'remark' => $this->input->post('remark'),
                'user_type' => $this->input->post('user_type') ?: 'pro',
                'sort' => $this->input->post('sort')
            )
        );
        $bool = $this->common_dict->save($data);
        //写入日志
        $this->sys_log_lib->insert($this->section_name, (!$data['id']) ? '1' : '2', $bool);
        $config['icon'] = 1;
        $config['url'] = site_url('common_dict?sys_cid=' . $this->sys_cid . '&pid=' . $this->pid);
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
        $rows = $this->category_lib->del($id);
        //写入日志
        $this->sys_log_lib->insert($this->section_name, '3', $rows);
        echo $rows;
    }

}