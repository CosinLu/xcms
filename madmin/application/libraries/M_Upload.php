<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/9/6
 * Time: 11:55
 */
class M_Upload extends CI_Upload
{
    protected $relative_path;

    public function __construct(array $config)
    {
        parent::__construct($config);
    }

    public function validate_upload_path()
    {
        $this->relative_path = $this->upload_path;
        standard_path($this->upload_path);
        if ($this->upload_path === '') {
            $this->set_error('upload_no_filepath', 'error');

            return FALSE;
        }
        if (stripos($this->upload_path, ':') != 1) {
            $DOCUMENT_ROOT = standard_path($_SERVER['DOCUMENT_ROOT']);
            $this->upload_path = standard_path($DOCUMENT_ROOT . $this->upload_path);
        }
        if (!is_dir($this->upload_path)) {
            mkdir($this->upload_path, 0777, TRUE);
        }
        if (!is_really_writable($this->upload_path)) {
            $this->set_error('upload_not_writable', 'error');

            return FALSE;
        }
        $this->upload_path = preg_replace('/(.+?)\/*$/', '\\1/', $this->upload_path);

        return TRUE;
    }

    public function data($index = NULL)
    {
        $data = array(
            'file_name' => $this->file_name,//文件名
            'file_type' => $this->file_type,//文件类型
            'abs_path_dir' => $this->upload_path,//绝对路径目录
            'abs_path' => $this->upload_path . $this->file_name,//绝对路径
            'rel_path_dir' => $this->relative_path,//相对路径目录
            'rel_path' => $this->relative_path . $this->file_name,//相对路径
            'raw_name' => str_replace($this->file_ext, '', $this->file_name),//文件名，不含后缀名
            'raw_rel_path' => $this->relative_path . str_replace($this->file_ext, '', $this->file_name),//相对路径，不含后缀名
            'orig_name' => $this->orig_name,//原始的文件名
            'client_name' => $this->client_name,//用户提交过来的文件名
            'file_ext' => $this->file_ext,//文件后缀名，包括句点
            'file_size' => $this->file_size,//文件大小（单位 kb）
            'is_image' => $this->is_image(),//文件是否为图片（1 = image. 0 = not.）
            'image_width' => $this->image_width,//图片宽度
            'image_height' => $this->image_height,//图片高度
            'image_type' => $this->image_type,//图片类型（通常是不带句点的文件后缀名）
            'image_size_str' => $this->image_size_str,//一个包含了图片宽度和高度的字符串（用于放在 image 标签中）
        );
        if (!empty($index)) {
            return isset($data[$index]) ? $data[$index] : NULL;
        }

        return $data;
    }
}