<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2017/8/31
 * Time: 17:48
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
        $uploads_id_arr = explode(',', $uploads_id);
        $this->CI->db->where_in('id', $uploads_id_arr);
        $this->CI->db->order_by("instr('" . $uploads_id . "',id)");
        $res = $this->CI->db->get($this->tb_name)->result_array();

        return $res;
    }

}