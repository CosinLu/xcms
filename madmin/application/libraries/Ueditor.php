<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2017/3/22
 * Time: 10:32
 */
class Ueditor
{
    protected $CI;

    public function __construct()
    {
        $this->CI =& get_instance();
        $this->edit_upload_path();

    }

    //修改上传路径
    public function edit_upload_path()
    {
        $upload = trim($this->CI->config->item('upload'));
        $config_txt_path = str_replace('//', '/', str_replace('\\', '/', FCPATH . '/plugin/ueditor/php/config.txt'));
        file_put_contents($config_txt_path, $upload);
    }

}