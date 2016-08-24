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

    /**
     * 单选框
     * @param int $pid 属性上级id
     * @param string $name 元素名称
     * @param string $check_val 选中值
     * @return string
     */
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

    /**
     * 复选框
     * @param int $pid 属性上级id
     * @param string $name 元素名称
     * @param string $check_val 选中值
     * @return string
     */
    public function checkbox($pid = 0, $name = '', $check_val = '')
    {
        $str = '';
        $check_val_arr = explode(',', $check_val);
        $res = $this->all($pid);
        foreach ($res as $val) {
            if (is_array($check_val_arr)) {
                $checked = (in_array($val['ident'], $check_val_arr)) ? 'checked' : '';
            } else {
                $checked = ($val['ident'] == $check_val) ? 'checked' : '';
            }
            $str .= '<label><input type="checkbox" name="' . $name . '[]" value="' . $val['ident'] . '" ' . $checked . '><ins></ins>' . $val['name'] . '</label>';
        }
        return $str;
    }

    /**
     * 下拉菜单
     * @param int $pid 属性上级id
     * @param string $name 元素名称
     * @param string $select_val 选中值
     * @return string
     */
    public function select($pid = 0, $name = '', $select_val = '')
    {
        $str = '';
        $res = $this->all($pid);
        $str .= '<select name="' . $name . '" class="form-control">';
        $str .= '<option value="0">-请选择-</option>';
        foreach ($res as $val) {
            $selected = ($val['ident'] == $select_val) ? 'selected' : '';
            $str .= '<option value="' . $val['ident'] . '" ' . $selected . '>' . $val['name'] . '</option>';
        }
        $str .= '</select>';
        return $str;

    }
}