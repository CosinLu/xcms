<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/9/5
 * Time: 18:28
 */
require_once 'Info.php';

class Info_page extends Info
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('info_page_model');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['save_url'] = $this->auth->set(config_item('my_update'), $this->sys_menu_auth, site_url('info_page/save?cid=' . $this->cid));
        $url['save_btn'] = $this->auth->set(config_item('my_update'), $this->sys_menu_auth, '<button type="submit" name="is_save" value="1" class="btn btn-primary">保存
                                </button>');
        $this->load->vars($url);
    }

    public function index()
    {
        $data['record'] = $this->info_page_model->index($this->cid);
        $data['create_time'] = date('Y-m-d H:i:s', time());
        $this->load->view('info_page/index.html', $data);
    }

    //保存
    public function save()
    {
        $post = array(
            'vals' => array(
                'cid' => $this->input->post('cid'),
                'content' => $this->input->post('content', FALSE),
                'create_time' => $this->input->post('create_time')
            )
        );
        $bool = $this->info_page_model->save($post);
        //写入日志
        $this->oplog->insert($this->main_section_name, '2', $bool);
        $config['icon'] = 1;
        if ($bool) {
            echo json_encode($config);
        } else {
            $config['icon'] = 2;
            echo json_encode($config);
        }
    }


}