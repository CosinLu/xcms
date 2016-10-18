<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/9/9
 * Time: 14:41
 */
class Uploadifive
{
    protected $CI;
    protected $tb_name;

    public function __construct($arr = array())
    {
        $this->CI =& get_instance();
        $this->tb_name = (isset($arr['tb_name'])) ? $arr['tb_name'] : 'uploads';
    }

    /**
     * 获得数据
     * @param string $uploads_id 文件标识
     * @return mixed
     */
    public function get_data($uploads_id = '')
    {
        $uploads_id_arr = explode(',', $uploads_id);
        $this->CI->db->where_in('id', $uploads_id_arr);
        $this->CI->db->order_by('id asc');
        $res = $this->CI->db->get($this->tb_name)->result_array();
        return $res;
    }

    /**
     * 获得文件列表
     * @param string $uploads_id 文件标识
     * @param string $name input名
     * @return string
     */
    public function get_list($uploads_id = '', $name = '')
    {
        $data = $this->get_data($uploads_id);
        $str = $this->list_str($data, $name);
        return $str;
    }

    /**
     * 拼接列表字符串
     * @param array $data 数据
     * @param string $name input名
     * @return string
     */
    public function list_str($data = array(), $name = 'image')
    {
        $str = '';
        foreach ($data as $key => $val) {
            $str .= '<div class="uploadifive-queue-item col-xs-3 complete" id="uploadifive-image-file-' . $key . '">';
            $str .= '<div class="thumbnail">';
            if ($val['is_image']) {
                $str .= '<img title="' . $val['client_name'] . '" src="' . $val['full_path'] . '" data-src="">';
            } else {
                $str .= '<img title="' . $val['client_name'] . '" src="' . $val['full_path'] . '" data-src="holder.js/138x80?bg=337AB7&text=File type is ' . $val['ext'] . '" class="img">';
            }
            $str .= '<div class="caption"><p class="filename" title="' . $val['client_name'] . '">' . $val['client_name'] . '</p>';
            $str .= '<p><span class="filesize">' . format_bytes($val['size'] * 1024) . '</span>';
            $str .= '</p>';
            $str .= '<button type="button" class="close-item btn btn-danger btn-sm">删除</button>';
            $str .= '</div>';
            $str .= '</div>';
            $str .= '<input type="hidden" name="' . $name . '[]" value="' . $val['id'] . '">';
            $str .= '</div>';
        }
        return $str;
    }
}