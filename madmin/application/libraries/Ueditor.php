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

    /**
     * 修改上传路径
     */
    public function edit_upload_path()
    {
        $settings_path = str_replace('\\', '/', FCPATH . 'plugin/ueditor/php/settings.json');
        $str = file_get_contents($settings_path);
        $str = preg_replace('/"upload":\s?"?.*"?[^,\s]/', '"upload": "' . config_item('my_upload') . '"', $str);
        $str = preg_replace('/"imageMaxSize":\s?"?.*"?[^,\s]/', '"imageMaxSize": ' . config_item('my_image_max_size'), $str);
        $str = preg_replace('/"scrawlMaxSize":\s?"?.*"?[^,\s]/', '"scrawlMaxSize": ' . config_item('my_scrawl_max_size'), $str);
        $str = preg_replace('/"catcherMaxSize":\s?"?.*"?[^,\s]/', '"catcherMaxSize": ' . config_item('my_catcher_max_size'), $str);
        $str = preg_replace('/"videoMaxSize":\s?"?.*"?[^,\s]/', '"videoMaxSize": ' . config_item('my_video_max_size'), $str);
        $str = preg_replace('/"fileMaxSize":\s?"?.*"?[^,\s]/', '"fileMaxSize": ' . config_item('my_file_max_size'), $str);
        file_put_contents($settings_path, $str);
    }

}