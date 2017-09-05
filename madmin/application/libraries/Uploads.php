<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2017/9/1
 * Time: 17:37
 */
class Uploads
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
     *
     * @param string $uploads_id 文件标识
     *
     * @return mixed
     */
    public function data($uploads_id = '')
    {
        if ($uploads_id == '') return '';
        $uploads_id_arr = explode(',', $uploads_id);
        $this->CI->db->select('id as upl_id,full_path as upl_path,is_image as upl_image,ext as upl_ext,client_name as upl_name,size as upl_size,image_width as upl_width,image_height as upl_height');
        $this->CI->db->where_in('id', $uploads_id_arr);
        $this->CI->db->order_by("instr('" . $uploads_id . "',id)");
        $res = $this->CI->db->get('uploads')->result_array();

        return json_encode($res);
    }
}