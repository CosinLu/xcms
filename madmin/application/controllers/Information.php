<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/9/5
 * Time: 16:53
 */
class Information extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('information_model', 'information');
        $this->load->library('category', array('tb_name' => 'info_col'), 'category');
    }

    public function index()
    {
        $data = $this->information->info_col();
        $children = array();
        foreach ($data as $key => $val) {
            $children[$key] = $this->category->children($data, $val['pid'], TRUE);
            foreach ($children[$key] as $val) {
                if ($val['sys_ctrl']) {
                    $url[$key] = $val['sys_ctrl'] . '?sys_cid=' . $this->sys_cid . '&info_cid=' . $val['id'];
                    break;
                } else {
                    $url[$key] = '';
                }
            }
        }
        $url = array_slice($url, 0, 1);
        redirect($url);
    }

}