<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/22
 * Time: 10:05
 */
class MY_Controller extends CI_Controller
{
    protected $sys_cid;//系统栏目标识
    protected $prferer;//上一个页面url
    protected $is_save;//保存：1=保存，2=保存并继续新增

    public function __construct()
    {
        parent::__construct();
        $this->sys_cid = $this->input->get('sys_id');
        $this->peferer = (isset($_SERVER['HTTP_REFERER'])) ? $_SERVER['HTTP_REFERER'] : '';
        $this->is_save = ($this->input->post('is_save') == '') ? '1' : $this->input->post('is_save');
    }


}