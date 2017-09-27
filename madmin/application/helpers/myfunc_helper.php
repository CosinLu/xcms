<?php
/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/24
 * Time: 23:07
 */


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
 * 下拉菜单
 *
 * @param array $data 数据源
 * @param string $name 菜单名称
 * @param string $disabled 是否禁用
 * @param string $option_val 选项值
 * @param string $option_name 选项名
 * @param string $selected_val 已选选项值
 * @param string $disabled_val 禁用选项值
 * @param bool $default 默认
 * @return string
 */
function ddl($data = array(), $name = '', $disabled = '', $option_val = 'id', $option_name = 'name', $selected_val = '', $disabled_val = '', $default = TRUE)
{
    $str = '';
    $str .= '<select name="' . $name . '" class="form-control" ' . $disabled . '>';

    if ($default === TRUE) {
        $str .= '<option value="-1">-请选择-</option>';
    } else if (is_array($default)) {
        $str .= '<option value="' . $default[0] . '">' . $default[1] . '</option>';
    } else if (is_string($default) && $default != '') {
        $str .= '<option value="-1">' . $default . '</option>';
    }

    if (!empty($data)) {
        foreach ($data as $val) {
            //选中值
            $option_selected = '';
            if ($selected_val != '') $option_selected = (in_array($val[$option_val], explode(',', $selected_val))) ? 'selected' : '';
            //禁用值
            $option_disabled = '';
            if ($disabled_val != '') $option_disabled = (in_array($val[$option_val], explode(',', $disabled_val))) ? 'disabled' : '';
            $str .= '<option value="' . $val[$option_val] . '" ' . $option_selected . ' ' . $option_disabled . '>' . $val[$option_name] . '</option>';
        }
    }
    $str .= '</select>';

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
    //welcome?&sys_cid=7&a=1
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