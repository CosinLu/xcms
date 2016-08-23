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
        $this->load->library('category', array('tb_name' => 'sys_col'),'category');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('sys_col/get_list?sys_cid=' . $this->sys_cid);
        $url['insert_url'] = '<a href="' . site_url('sys_col/insert?sys_cid=' . $this->sys_cid) . '" class="btn btn-default">新增</a>';
        $url['save_url'] = site_url('sys_col/save?sys_cid=' . $this->sys_cid);
        $url['del_url'] = site_url('sys_col/del?sys_cid=' . $this->sys_cid);
        $this->load->vars($url);
    }

    public function index()
    {
        $this->load->view('sys_col/index.html');
    }

    //获得列表
    public function get_list()
    {
        $data['list'] = $this->sys_col->get_list();
        foreach ($data['list']['list'] as $key => $val) {
            $dir = ($val['dir']) ? $val['dir'] . '/' : '';
            $ctrl = ($val['ctrl']) ? $val['ctrl'] . '/' : '';
            $method = ($val['method']) ? $val['method'] : '';
            $param = ($val['param']) ? '?' . $val['param'] : '';
            $data['list']['list'][$key]['url'] = $dir . $ctrl . $method . $param;
            $data['list']['list'][$key]['update_btn'] = '<a href="' . site_url('sys_col/update?sys_cid=' . $this->sys_cid . '&id=' . $val['id']) . '">编辑</a>';
            $data['list']['list'][$key]['insert_next_btn'] = '<a href="' . site_url('sys_col/insert?sys_cid=' . $this->sys_cid . '&id=' . $val['id']) . '">新增下级</a>';
            $data['list']['list'][$key]['del_btn'] = '<a href="javascript:;" data-name="del" data-id="' . $val['id'] . '">删除</a>';
            $data['list']['list'][$key]['prefix'] = str_repeat('&nbsp;&nbsp;', ($val['level'] - 1) * 2) . ((!empty($val['level'] - 1) ? '└─&nbsp;' : ''));
        }
        echo json_encode($data);
    }

    //新增
    public function insert()
    {
        $id = $this->input->get('id');
        $data['sys_col'] = $this->category->insert_option($id);
        $data['auth'] = $this->sys_dict->checkbox(1, 'auth');
        $data['user_type'] = $this->sys_dict->radio(6, 'user_type');
        $data['display'] = $this->sys_dict->radio(9, 'display');
        $this->load->view('sys_col/insert.html', $data);
    }

    //更新
    public function update()
    {
        $id = $this->input->get('id');
        $data['item'] = $this->sys_col->update();
        $data['sys_col'] = $this->category->update_option($id, $data['item']['pid']);
        $data['auth'] = $this->sys_dict->checkbox(1, 'auth', $data['item']['sys_col_auth']);
        $data['user_type'] = $this->sys_dict->radio(6, 'user_type', $data['item']['user_type']);
        $data['display'] = $this->sys_dict->radio(9, 'display', $data['item']['display']);
        $this->load->view('sys_col/update.html', $data);
    }


    //保存
    public function save()
    {
        $bool = $this->sys_col->save();
        if ($bool) {
            switch ($this->is_save) {
                case '1':
                    $this->prompt->success('操作成功！', site_url('sys_col?sys_cid=' . $this->sys_cid));
                    break;
                case '2':
                    $this->prompt->success('操作成功！', $this->peferer);
                    break;
            }
        } else {
            $this->prompt->error('操作失败！', site_url('sys_col?sys_cid=' . $this->sys_cid));
        }
    }

    //删除
    public function del()
    {
        $id = $this->input->post('id');
        $this->sys_col->del_sys_col_auth($id);//删除系统栏目权限
        $rows = $this->category->del($id);//删除系统栏目
        echo $rows;
    }

}