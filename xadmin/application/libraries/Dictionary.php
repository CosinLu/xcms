<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/22
 * Time: 18:07
 */
class Dictionary
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
        //array('type' => '', 'ident' => '', 'name' => '', 'selected' => '', 'disabled' => '', 'default' => array('-请选择-', '0'))
        $res = array();
        foreach ($arr as $key => $val) {
            //格式化参数
            $val = array_pad($val, 6, '');
            list($type, $ident, $name, $selected, $disabled, $default) = $val;
            $default = $default ?: array('-请选择-', '0');
            //控件名称
            $name = $name ?: $ident;
            if ($type == 'ddl') {
                $res[$name] = $this->$type($data, $ident, $name, $selected, $disabled, $default);
            } else {
                $res[$name] = $this->$type($data, $ident, $name, $selected, $disabled);
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
    public function filter($data = array(), $ident = '')
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
     * @param string|array $disabled_val 禁用项
     * @return string
     */
    public function rbl($data = array(), $ident = '', $name = '', $selected_val = '', $disabled_val = '')
    {
        //数据源
        $data = empty($data) ? $this->data($ident) : $this->filter($data, $ident);
        $str = '';
        if ($disabled_val !== TRUE) {
            $disabled_val = is_array($disabled_val) ? $disabled_val : explode(',', $disabled_val);
        }
        if (!empty($data)) {
            foreach ($data as $key => $val) {
                //ident为空时使用id填充
                $value = $val['ident'] ?: $val['id'];
                //设置选中项
                if ($selected_val == '' && $key == 0) {
                    $checked = 'checked="checked"';
                } else if ($selected_val != '' && $value == $selected_val) {
                    $checked = 'checked="checked"';
                } else {
                    $checked = '';
                }
                //设置禁选项
                if ($disabled_val === TRUE) {
                    $disabled = 'disabled="disabled"';
                } else {
                    if (!empty($disabled_val) && in_array($value, $disabled_val)) {
                        $disabled = 'disabled="disabled"';
                    } else {
                        $disabled = '';
                    }
                }
                //指定控件名称
                $field = $val['field'] ?: $name;
                $str .= '<label><input type="radio" name="' . $field . '" value="' . $value . '" ' . $checked . ' ' . $disabled . '><ins>' . $val['name'] . '</ins></label>';
            }
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
     * @param string|array $disabled_val 禁用项
     * @return string
     */
    public function cbl($data = array(), $ident = '', $name = '', $checked_val = '', $disabled_val = '')
    {
        //数据源
        $data = empty($data) ? $this->data($ident) : $this->filter($data, $ident);
        $str = '';
        $checked_val = is_array($checked_val) ? $checked_val : explode(',', $checked_val);
        $disabled_val = is_array($disabled_val) ? $disabled_val : explode(',', $disabled_val);
        if (!empty($data)) {
            foreach ($data as $val) {
                //ident为空时使用id填充
                $value = $val['ident'] ?: $val['id'];
                //设置选中项
                $checked = !empty($checked_val) && in_array($value, $checked_val) ? 'checked="checked"' : '';
                //设置禁选项
                if ($disabled_val === TRUE) {
                    $disabled = 'disabled="disabled"';
                } else {
                    if (!empty($disabled_val) && in_array($value, $disabled_val)) {
                        $disabled = 'disabled="disabled"';
                    } else {
                        $disabled = '';
                    }
                }
                //指定控件名称
                $field = $val['field'] ?: $name;
                $str .= '<label><input type="checkbox" name="' . $field . '[]" value="' . $value . '" ' . $checked . ' ' . $disabled . '><ins>' . $val['name'] . '</ins></label>';
            }
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
     * @param string|array $disabled_val 禁用项
     * @param array|bool $default 第一条默认值：array('title','value') OR false
     * @return string
     */
    public function ddl($data = array(), $ident = '', $name = '', $selected_val = '', $disabled_val = '', $default = array('-请选择-', '0'))
    {
        //默认值
        $default = is_array($default) ? array_merge(array('-请选择-', '0'), $default) : $default;
        //数据源
        $data = empty($data) ? $this->data($ident) : $this->filter($data, $ident);
        $str = '';
        //禁用
        if ($disabled_val === TRUE) {
            $disabled = 'disabled';
        } else {
            $disabled = '';
            if (!is_array($disabled_val)) {
                $disabled_val = explode(',', $disabled_val);
            }
        }
        $str .= '<select name="' . $name . '" ' . $disabled . ' class="form-control">';
        $str .= $default ? '<option value="' . $default[1] . '">' . $default[0] . '</option>' : '';
        if (!empty($data)) {
            foreach ($data as $val) {
                //ident为空时使用id填充
                $value = $val['ident'] ?: $val['id'];
                //选中
                $selected = ($value == $selected_val) ? 'selected="selected"' : '';
                //禁止选择
                if ($disabled_val === TRUE) {
                    $option_disabled = '';
                } else {
                    if (!empty($disabled_val) && in_array($value, $disabled_val)) {
                        $option_disabled = 'disabled';
                    } else {
                        $option_disabled = '';
                    }
                }
                $str .= '<option value="' . $value . '" ' . $selected . ' ' . $option_disabled . '>' . $val['name'] . '</option>';
            }
        }
        $str .= '</select>';

        return $str;
    }


    /**
     * 获取指定字典
     *
     * @param string $ident 标记
     * @return string
     */
    public function source($ident = '')
    {
        $this->CI->db->select('t.ident,t.name,t.color');
        $this->CI->db->from('common_dict t');
        $this->CI->db->join('common_dict t1', "t1.ident='{$ident}'", 'left');
        $this->CI->db->where('t.pid=t1.id');
        $res = $this->CI->db->get()->result_array();
        $data = array();
        foreach ($res as $key => $val) {
            $data[] = array(
                'value' => $val['ident'],
                'text' => '<font color=' . $val['color'] . '>' . $val['name'] . '</font>'
            );
        }

        return json_encode($data);
    }
}