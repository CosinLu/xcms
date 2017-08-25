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
        str_replace('\\', '/', $this->upload_path);
        if ($this->upload_path === '') {
            $this->set_error('upload_no_filepath', 'error');
            return FALSE;
        }
        if (stripos($this->upload_path, ':') != 1) {
            $DOCUMENT_ROOT = str_replace('\\', '/', $_SERVER['DOCUMENT_ROOT']);
            $this->upload_path = str_replace('//', '/', $DOCUMENT_ROOT . $this->upload_path);
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
            'name' => $this->file_name,
            'type' => $this->file_type,
            'abs_path' => $this->upload_path,
            'full_abs_path' => $this->upload_path . $this->file_name,
            'path' => $this->relative_path,
            'full_path' => $this->relative_path . $this->file_name,
            'raw_name' => str_replace($this->file_ext, '', $this->file_name),
            'orig_name' => $this->orig_name,
            'client_name' => $this->client_name,
            'ext' => $this->file_ext,
            'size' => $this->file_size,
            'is_image' => $this->is_image(),
            'image_width' => $this->image_width,
            'image_height' => $this->image_height,
            'image_type' => $this->image_type,
            'image_size_str' => $this->image_size_str,
        );
        if (!empty($index)) {
            return isset($data[$index]) ? $data[$index] : NULL;
        }
        return $data;
    }
}