<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2017/9/1
 * Time: 17:37
 */
class Uploads_lib
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
     * @return mixed
     */
    public function data($uploads_id = '')
    {
        if ($uploads_id == '') return '';
        $uploads_id_arr = explode(',', $uploads_id);
        $this->CI->db->select('id,rel_path,is_image,file_ext,client_name,file_size,image_width,image_height,raw_rel_path');
        $this->CI->db->where_in('id', $uploads_id_arr);
        $this->CI->db->order_by("instr('" . $uploads_id . "',id)");
        $res = $this->CI->db->get('uploads')->result_array();
        foreach ($res as $key => $val) {
            $res[$key]['thumb_rel_path'] = $val['is_image'] ? $val['raw_rel_path'] . $this->CI->config->item('thumb_marker', 'mcms') . $val['file_ext'] : '';
        }

        return json_encode($res);
    }
}