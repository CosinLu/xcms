<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/9/5
 * Time: 18:28
 */
require_once 'Information.php';

class Info_single extends Information
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('info_single_model', 'info_single');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['save_url'] = $this->sys_auth->set_auth(MYUPDATE, $this->col_auth, site_url('info_single/save?sys_cid=' . $this->sys_cid . '&cid=' . $this->cid));
        $url['save_btn'] = $this->sys_auth->set_auth(MYUPDATE, $this->col_auth, '<button type="submit" name="is_save" value="1" class="btn btn-primary">保存
                                </button>');
        $this->load->vars($url);
    }

    public function index()
    {
        $data['item'] = $this->info_single->index();
        $this->load->view('info_single/update.html', $data);
    }

    //保存
    public function save()
    {
        $bool = $this->info_single->save();
        $this->sys_log->insert($this->main_section_name, '2', $bool);//日志
        $config['icon'] = 1;
        if ($bool) {
            echo json_encode($config);
        } else {
            $config['icon'] = 2;
            echo json_encode($config);
        }
    }


}