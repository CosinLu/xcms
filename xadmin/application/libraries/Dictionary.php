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
     * @param array $arr
     * @return array|string
     */
    public function dict($arr = array())
    {
        if (!$arr) return '';
        $all_data = $this->data();
        $res = array();
        foreach ($arr as $key => $val) {
            $temp = array_pad($val, 2, '');
            list($type, $ident) = $temp;
            if (!$type) break;
            $data = $this->filter($all_data, $ident);
            if ($type == 'ddl') {
                //$data, $name, $selected_val, $disabled_val, $class, $multiple, $value_field , $text_field , $default
                $val = array_pad($val, 10, '');
                list($type, $ident, $name, $selected_val, $disabled_val, $class, $multiple, $value_field, $text_field, $default) = $val;
                $name = $name ?: $ident;
                $multiple = $multiple ?: FALSE;
                $value_field = $value_field ?: 'id';
                $text_field = $text_field ?: 'name';
                $default = $default ?: array('-请选择-', 0);
                $res[$name] = $type($data, $name, $selected_val, $disabled_val, $class, $multiple, $value_field, $text_field, $default);
            } else {
                //$data, $name, $checked_val, $disabled_val, $value_field, $text_field
                $val = array_pad($val, 7, '');
                list($type, $ident, $name, $checked_val, $disabled_val, $value_field, $text_field) = $val;
                $name = $name ?: $ident;
                $value_field = $value_field ?: 'id';
                $text_field = $text_field ?: 'name';
                $res[$name] = $type($data, $name, $checked_val, $disabled_val, $value_field, $text_field);
            }
        }

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
        if (!$ident) return array();
        if (!$data) $data = $this->data($ident);
        if (!$data) return array();
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
     * 获取指定字典
     *
     * @param string $ident 标记
     * @return string
     */
    public function source($ident = '')
    {
        $res = $this->data($ident);
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