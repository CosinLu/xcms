<?php
/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/24
 * Time: 23:07
 */

/**
 * 重构implode函数，防止第二个参数为空时报错
 *
 * @param string $separator
 * @param string $arr
 * @return string
 */
function new_implode($separator = ',', $arr = '')
{
    if ($arr == '') return '';

    return implode($separator, $arr);
}

/**
 * 重构explode函数，防止第二个参数为空时报错
 *
 * @param string $separator
 * @param string $str
 * @return array|string
 */
function new_explode($separator = ',', $str = '')
{
    if ($str == '') return array();
    if (is_array($str)) return $str;

    return explode($separator, $str);
}

/**
 * 判断链接是否有前缀 http:// or https://
 *
 * @param string $url
 */
function is_http($url = '')
{
    return preg_match('/(http:\/\/)|(https:\/\/)/i', $url);
}

/**
 * 转换成标准路径【将路径中的"\"、"//"替换成"/"】
 *
 * @param string $path
 * @return mixed|string
 */
function standard_path($path = '')
{
    $path = str_replace("\\", "/", $path);
    $path = str_replace("///", "/", $path);
    $path = str_replace("//", "/", $path);

    return $path;
}

/**
 * @param array $data
 * @param string $name
 * @param string $selected_val
 * @param string $disabled_val
 * @param string $class
 * @param bool $multiple
 * @param string $value_field
 * @param string $text_field
 * @param array $default
 * @return string
 */
function ddl($data = array(), $name = '', $selected_val = '', $disabled_val = '', $class = '', $multiple = FALSE, $value_field = 'id', $text_field = 'name', $default = array('-请选择-', 0))
{
    if (empty($data)) return '';

    $multiple = $multiple ? 'multiple' : '';
    $disabled = $disabled_val === TRUE ? 'disabled' : '';
    $selected_val = new_explode(',', $selected_val);
    $disabled_val = $disabled_val !== TRUE ? new_explode(',', $disabled_val) : array();

    $str = '';

    $str .= '<select name="' . $name . '" class="form-control ' . $class . '" ' . $multiple . ' ' . $disabled . '>';

    if ($default !== FALSE) {
        $default = new_explode(',', $default);
        $default = array_pad($default, 2, '');
        $str .= '<option value="' . $default[1] . '">' . $default[0] . '</option>';
    }

    foreach ($data as $key => $val) {
        $selected = in_array($val[$value_field], $selected_val) ? 'selected' : '';
        $disabled = in_array($val[$value_field], $disabled_val) ? 'disabled' : '';
        $str .= '<option value="' . $val[$value_field] . '" ' . $selected . ' ' . $disabled . '>' . $val[$text_field] . '</option>';
    }

    $str .= '</select>';

    return $str;
}

/**
 * 复选框
 *
 * @param array $data
 * @param string $name 控件名称
 * @param string $checked_val 已选
 * @param string $disabled_val 禁选
 * @param string $value_field value 字段值
 * @param string $text_field text 字段名
 * @return string
 */
function cbl($data = array(), $name = '', $checked_val = '', $disabled_val = '', $value_field = 'id', $text_field = 'name')
{
    if (empty($data)) return '';

    $str = '';
    foreach ($data as $key => $val) {
        //设置value
        $value = isset($val['ident']) && $val['ident'] != '' ? $val['ident'] : $val[$value_field];
        //设置name
        $name = isset($val['field']) && $val['field'] ? $val['field'] : $name;
        $checked = in_array($value, new_explode(',', $checked_val)) ? 'checked' : '';
        if ($disabled_val === TRUE) {
            $disabled = 'disabled';
        } else {
            $disabled = in_array($value, new_explode(',', $disabled_val)) ? 'disabled' : '';
        }
        $str .= '<label><input type="checkbox" value="' . $value . '" name="' . $name . '[]" ' . $checked . ' ' . $disabled . '><ins>' . $val[$text_field] . '</ins></label>';
    }

    return $str;
}

/**
 * 单选框
 *
 * @param array $data
 * @param string $name 控件名称
 * @param string $checked_val 已选
 * @param string $disabled_val 禁选
 * @param string $value_field value 字段值
 * @param string $text_field text 字段名
 * @return string
 */
function rbl($data = array(), $name = '', $checked_val = '', $disabled_val = '', $value_field = 'id', $text_field = 'name')
{
    if (empty($data)) return '';

    $str = '';
    foreach ($data as $key => $val) {
        //设置value
        $value = isset($val['ident']) && $val['ident'] != '' ? $val['ident'] : $val[$value_field];
        //设置name
        $name = isset($val['field']) && $val['field'] ? $val['field'] : $name;
        $checked = in_array($value, new_explode(',', $checked_val)) ? 'checked' : '';
        if ($disabled_val === TRUE) {
            $disabled = 'disabled';
        } else {
            $disabled = in_array($value, new_explode(',', $disabled_val)) ? 'disabled' : '';
        }
        $str .= '<label><input type="radio" value="' . $value . '" name="' . $name . '" ' . $checked . ' ' . $disabled . '><ins>' . $val[$text_field] . '</ins></label>';
    }

    return $str;
}

/**
 * 选中下拉选项
 *
 * @param string $initial_val
 * @param string $current_val
 * @return string
 */
function selected($initial_val = '', $current_val = '')
{
    $selected = ($initial_val == $current_val) ? 'selected' : '';

    return $selected;
}

/**
 * 选中radio/checkbox
 *
 * @param string $initial_val
 * @param string $current_val
 * @return string
 */
function checked($initial_val = '', $current_val = '')
{
    $current_val_arr = explode(',', $current_val);
    if (is_array($current_val_arr)) {
        $checked = (in_array($initial_val, $current_val_arr)) ? 'checked' : '';
    } else {
        $checked = ($initial_val == $current_val) ? 'checked' : '';
    }

    return $checked;
}

/**
 * 多维数组转一维数组
 *
 * @param array $multi_arr 原始数据
 * @param array $num 判断是否为第一次执行此函数，防止多次转换时存在冗余
 * @return array
 */
function multi_transform_one($multi_arr = array(), $num = 1)
{
    static $result = array();
    //第一次执行时清空数组
    if ($num == 1) {
        $result = array();
    }
    foreach ($multi_arr as $key => $val) {
        if (is_array($val)) {
            multi_turn_one($val, $num++);
        } else {
            $result[] = $val;
        }
    }

    return $result;
}


/**
 * 格式化文件大小d单位
 *
 * @param int $size
 * @param int $num
 * @return string
 */
function format_bytes($size = 0, $num = 1)
{
    $units = array(' B', ' KB', ' MB', ' GB', ' TB');
    for ($i = 0; $size >= 1024 && $i < 4; $i++) $size /= 1024;

    return round($size, $num) . $units[$i];
}

/**
 * 通过上传文件类型，获取文件icon
 *
 * @param string $arr 文件类型:array('文件类型'=>'值')
 * @return string
 */
function upload_icon($arr = array())
{
    $str = '';
    if (empty($arr)) return $str;
    foreach ($arr as $key => $val) {
        if (!empty($val)) {
            switch ($key) {
                case 'image':
                    $str .= '&nbsp;&nbsp;<i class="fa fa-image" title="图片"></i>';
                    break;
                case 'file':
                    $str .= '&nbsp;&nbsp;<i class="fa fa-file-o" title="文件"></i>';
                    break;
                case 'muiltimage':
                    $str .= '&nbsp;&nbsp;<i class="fa fa-th" title="多图"></i>';
                    break;
                default:
                    //默认为图片
                    $str .= '&nbsp;&nbsp;<i class="fa fa-image" title="图片"></i>';
                    break;
            }
        }
    }

    return $str;
}

/**
 * url转数组
 *
 * @param string $url
 * @param array $arr
 */
function url_to_arr($url = '', $arr = array())
{
    $reg = '/\?&|\?|&/';
    $url = preg_replace($reg, '/', $url);
    $n = strpos($url, '#');
    $url = ($n) ? strpos($url, '#') : $url;
    $arr_url = explode('/', $url);
    $new_arr = array();
    foreach ($arr as $k => $v) {
        array_push($new_arr, $k . '=' . $v);
    }

    return array_unique(array_merge($arr_url, $new_arr));

}

/**
 * 返回上一级
 *
 * @param string $url
 * @return string
 */
function go_back($url = '')
{
    $mhook = $url ? '' : 'back-hook';
    $url = $url ?: 'javascript:;';
    $str = '<a href="' . $url . '" class="btn btn-default btn-xs ' . $mhook . '"><i class="fa fa-level-up fa-flip-horizontal"></i>返回上一级</a>';

    return $str;
}

/**
 * 获取有效url
 *
 * @param array $data 数据源
 * @return mixed
 */
function valid_url($data = array())
{
    $CI =& get_instance();
    $CI->load->library('tree');
    $data_serialize = $CI->tree->serialize($data);
    $children = array();
    $url = array();
    foreach ($data_serialize as $key => $val) {
        if ($val['pid'] == 0) {
            $children[$key] = $CI->tree->get_children($data, $val['id'], TRUE);
            foreach ($children[$key] as $val) {
                if ($val['url']) {
                    $url[$key] = site_url($val['url']);
                    break;
                } else {
                    $url[$key] = 'javascript:;';
                }
            }
        }
    }

    return $url;
}