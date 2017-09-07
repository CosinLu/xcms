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
    }

    //修改上传路径
    public function edit_upload_path()
    {
        $settings_path = str_replace('\\', '/', FCPATH . 'plugin/ueditor/php/settings.json');
        $str = file_get_contents($settings_path);
        $str = preg_replace('/"upload": ".*"/', '"upload": "' . $this->CI->config->item('upload', 'mcms') . '"', $str);
        file_put_contents($settings_path, $str);
    }

}