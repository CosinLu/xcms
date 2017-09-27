<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/22
 * Time: 18:07
 */
class Common_dict_lib
{
    protected $CI;

    public function __construct()
    {
        $this->CI =& get_instance();
    }

    /**
     * 根据类型获取数据
     *
     * @param array $arr array(['控件类型','字典标识','控件名称','选中项','禁选项','默认值（下拉列表第一条数据）array('title','value') OR false'])
     * @return string
     */
    public function dict($arr = array())
    {
        if (empty($arr)) return '';
        //数据源
        $data = $this->data();
        //传参标准
        //array('type' => '', 'ident' => '', 'name' => '', 'selected' => '', 'forbidden' => '', 'default' => array('-请选择-', '0'))
        $res = array();
        foreach ($arr as $key => $val) {
            //格式化参数
            $val = array_pad($val, 6, '');
            list($type, $ident, $name, $selected, $forbidden, $default) = $val;
            //控件名称
            $name = $name ?: $ident;
            if ($type == 'ddl') {
                $res[$name] = $this->$type($data, $ident, $name, $selected, $forbidden, $default);
            } else {
                $res[$name] = $this->$type($data, $ident, $name, $selected, $forbidden);
            }
        }

        //返回数据
        return $res;
    }

    /**
     * 获取所有数据
     *
     * @param string $ident 字典标识
     * @return mixed
     */
    public function data($ident = '')
    {
        if ($ident != '') {
            $this->CI->db->select('t1.*');
            $this->CI->db->from('common_dict t');
            $this->CI->db->join('common_dict t1', 't1.pid=t.id', 'left');
            $this->CI->db->where('t.ident', $ident);
            $this->CI->db->group_by('t1.id');
            $this->CI->db->order_by('t1.sort asc,t1.id asc');
        }
        $res = $this->CI->db->get('common_dict')->result_array();

        return $res;
    }

    /**
     * 数据过滤
     *
     * @param array $data
     * @param string $ident
     * @return array|mixed|string
     */
    public function filter_data($data = array(), $ident = '')
    {
        //数据源
        if (empty($data)) $data = $this->data($ident);
        if (empty($data)) return '';
        //当前标识的id
        $pid = '';
        foreach ($data as $val) {
            if ($val['pid'] == 0 && $val['ident'] == $ident) {
                $pid = $val['id'];
                break;
            }
        }
        if ($pid == '') return '';
        //当前标识字典项
        $res = array();
        foreach ($data as $val) {
            if ($val['pid'] == $pid) {
                array_push($res, $val);
            }
        }

        return $res;
    }

    /**
     * 单选
     *
     * @param array $data 数据源
     * @param string $ident 字典标识
     * @param string $name 控件名称
     * @param string $selected_val 选中项
     * @param string|array $forbidden_val 禁用项
     * @return string
     */
    public function rbl($data = array(), $ident = '', $name = '', $selected_val = '', $forbidden_val = '')
    {
        //数据源
        $data = empty($data) ? $this->data($ident) : $this->filter_data($data, $ident);
        $str = '';
        $forbidden_val_arr = is_array($forbidden_val) ? $forbidden_val : explode(',', $forbidden_val);
        foreach ($data as $key => $val) {
            //设置选中项
            if ($selected_val == '' && $key == 0) {
                $checked = 'checked="checked"';
            } else if ($selected_val != '' && $val['ident'] == $selected_val) {
                $checked = 'checked="checked"';
            } else {
                $checked = '';
            }
            //设置禁选项
            $disabled = !empty($forbidden_val_arr) && in_array($val['ident'], $forbidden_val_arr) ? 'disabled="disabled"' : '';
            $str .= '<label><input type="radio" name="' . $name . '" value="' . $val['ident'] . '" ' . $checked . ' ' . $disabled . '><ins>' . $val['name'] . '</ins></label>';
        }

        return $str;
    }

    /**
     * 复选
     *
     * @param array $data 数据源
     * @param string $ident 字典标识
     * @param string $name 控件名称
     * @param string|array $selected_val 选中项
     * @param string|array $forbidden_val 禁用项
     * @return string
     */
    public function cbl($data = array(), $ident = '', $name = '', $selected_val = '', $forbidden_val = '')
    {
        //数据源
        $data = empty($data) ? $this->data($ident) : $this->filter_data($data, $ident);
        $str = '';
        $check_val_arr = is_array($selected_val) ? $selected_val : explode(',', $selected_val);
        $forbidden_val_arr = is_array($forbidden_val) ? $forbidden_val : explode(',', $forbidden_val);
        foreach ($data as $val) {
            //设置选中项
            $checked = !empty($check_val_arr) && in_array($val['ident'], $check_val_arr) ? 'checked="checked"' : '';
            //设置禁用项
            $disabled = !empty($forbidden_val_arr) && in_array($val['ident'], $forbidden_val_arr) ? 'disabled="disabled"' : '';
            $str .= '<label><input type="checkbox" name="' . $name . '[]" value="' . $val['ident'] . '" ' . $checked . ' ' . $disabled . '><ins>' . $val['name'] . '</ins></label>';
        }

        return $str;
    }

    /**
     * 下拉列表
     *
     * @param array $data 数据源
     * @param string $ident 字典标识
     * @param string $name 控件名称
     * @param string $selected_val 选中项
     * @param string|array $forbidden_val 禁用项
     * @param array|bool $default 第一条默认值：array('title','value') OR false
     * @return string
     */
    public function ddl($data = array(), $ident = '', $name = '', $selected_val = '', $forbidden_val = '', $default = array('-请选择-', '0'))
    {
        //默认值
        $default = is_array($default) ? array_merge(array('-请选择-', '0'), $default) : $default;
        //数据源
        $data = empty($data) ? $this->data($ident) : $this->filter_data($data, $ident);
        $str = '';
        $forbidden_val_arr = is_array($forbidden_val) ? $forbidden_val : explode(',', $forbidden_val);
        $str .= '<select name="' . $name . '" class="form-control">';
        $str .= $default ? '<option value="' . $default[1] . '">' . $default[0] . '</option>' : '';
        foreach ($data as $val) {
            $selected = ($val['ident'] == $selected_val) ? 'selected="selected"' : '';
            $disabled = !empty($forbidden_val_arr) && in_array($val['ident'], $forbidden_val_arr) ? 'disabled="disabled"' : '';
            $str .= '<option value="' . $val['ident'] . '" ' . $selected . ' ' . $disabled . '>' . $val['name'] . '</option>';
        }
        $str .= '</select>';

        return $str;

    }
}