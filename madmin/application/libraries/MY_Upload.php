<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/9/6
 * Time: 11:55
 */
class MY_Upload extends CI_Upload
{
    protected $CI;
    protected $relative_path;

    public function __construct($config = array())
    {
        parent::__construct($config);
        $this->CI =& get_instance();
    }

    /**
     * 验证上传路径
     * @return bool
     */
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

    /**
     * 处理返回数据
     * 1.p1是数组则循环处理 array(name,id)
     * 2.p1是字符串
     *
     * @param string $p1
     * @param string $p2
     * @return string
     */
    public function result($arr = array())
    {
        $res = array();
        if (is_array($arr)) {
            foreach ($arr as $val) {
                $val = array_pad($val, 2, '');
                $name = $val[0];
                $id = $val[1];
                $res[$name] = $this->get_data($id);
                if (!empty($res[$name])) {
                    foreach ($res[$name] as $key => $sub_val) {
                        $res[$name][$key]['thumb_rel_path'] = $sub_val['is_image'] ? $sub_val['raw_rel_path'] . config_item('my_thumb_marker') . $sub_val['file_ext'] : '';
                    }
                }
            }
        } else {
            $res = $this->get_data($arr);
            if (!empty($res)) {
                foreach ($res as $key => $val) {
                    $res[$key]['thumb_rel_path'] = $val['is_image'] ? $val['raw_rel_path'] . config_item('my_thumb_marker') . $val['file_ext'] : '';
                }
            }
        }

        return json_encode($res);
    }

    /**
     * 获取相应数据
     *
     * @param string $id
     * @return string
     */
    public function get_data($id = '')
    {
        if ($id == '') return array();
        $id_arr = explode(',', $id);
        $this->CI->db->select('id,rel_path,is_image,file_ext,client_name,file_size,image_width,image_height,raw_rel_path');
        $this->CI->db->where_in('id', $id_arr);
        $this->CI->db->order_by("instr('" . $id . "',id)");
        $res = $this->CI->db->get('uploads')->result_array();

        return $res;
    }


}