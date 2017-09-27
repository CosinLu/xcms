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
     * 获取相应数据
     *
     * @param string $id
     * @return string
     */
    public function data($id = '')
    {
        if ($id == '') return array();
        $id_arr = explode(',', $id);
        $this->CI->db->select('id,rel_path,is_image,file_ext,client_name,file_size,image_width,image_height,raw_rel_path');
        $this->CI->db->where_in('id', $id_arr);
        $this->CI->db->order_by("instr('" . $id . "',id)");
        $res = $this->CI->db->get('uploads')->result_array();

        return $res;
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
    public function uploads($arr = array())
    {
        $res = array();
        if (is_array($arr)) {
            foreach ($arr as $val) {
                $val = array_pad($val, 2, '');
                $name = $val[0];
                $id = $val[1];
                $res[$name] = $this->data($id);
                if (!empty($res[$name])) {
                    foreach ($res[$name] as $key => $sub_val) {
                        $res[$name][$key]['thumb_rel_path'] = $sub_val['is_image'] ? $sub_val['raw_rel_path'] . $this->CI->config->item('thumb_marker', 'mcms') . $sub_val['file_ext'] : '';
                    }
                }
            }
        } else {
            $res = $this->data($arr);
            if (!empty($res)) {
                foreach ($res as $key => $val) {
                    $res[$key]['thumb_rel_path'] = $val['is_image'] ? $val['raw_rel_path'] . $this->CI->config->item('thumb_marker', 'mcms') . $val['file_ext'] : '';
                }
            }
        }

        return json_encode($res);
    }
}