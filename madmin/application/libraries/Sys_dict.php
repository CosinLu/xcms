<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/22
 * Time: 18:07
 */
class Sys_dict
{
    protected $CI;

    public function __construct()
    {
        $this->CI = &get_instance();
    }

    public function all($pid = 0)
    {
        $this->CI->db->where('pid', $pid);
        $res = $this->CI->db->get('sys_dict')->result_array();
        return $res;
    }

    //单选框
    public function radio($pid = 0, $name = '', $check_val = '')
    {
        $str = '';
        $res = $this->all($pid);
        foreach ($res as $key => $val) {
            if ($check_val == '') {
                $checked = ($key == 0) ? 'checked' : '';
            } else {
                $checked = ($val['ident'] == $check_val) ? 'checked' : '';
            }
            $str .= '<label><input type="radio" name="' . $name . '" value="' . $val['ident'] . '" ' . $checked . '><ins></ins>' . $val['name'] . '</label>';
        }
        return $str;
    }

    //复选框
    public function checkbox($pid = 0, $name = '', $check_val = '')
    {
        $str = '';
        $res = $this->all($pid);
        foreach ($res as $val) {
            if (is_array($check_val)) {
                $checked = (in_array($val['ident'], $check_val)) ? 'checked' : '';
            } else {
                $checked = ($val['ident'] == $check_val) ? 'checked' : '';
            }
            $str .= '<label><input type="checkbox" name="' . $name . '[]" value="' . $val['ident'] . '" ' . $checked . '><ins></ins>' . $val['name'] . '</label>';
        }
        return $str;
    }
}