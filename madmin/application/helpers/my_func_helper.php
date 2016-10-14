<?php
/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/24
 * Time: 23:07
 */

/**
 * 下拉列表
 * @param array $data 原始数据
 * @param string $name 元素名称
 * @param int $select_val 选中值
 * @param int $disabled 禁用
 * @return string
 */
function ddl($data = array(), $name = '', $select_val = 0, $disabled = '')
{
    $str = '';
    $str .= '<select name="' . $name . '" class="form-control" ' . $disabled . '>';
    $str .= '<option value="0">-请选择-</option>';
    if (!empty($data)) {
        foreach ($data as $val) {
            $selected = ($val['id'] == $select_val) ? 'selected' : '';
            $str .= '<option value="' . $val['id'] . '" ' . $selected . '>' . $val['name'] . '</option>';
        }
    }
    $str .= '</select>';
    return $str;
}

/**
 * 选中下拉选项
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
 * @param array $multi_arr 原始数据
 * @param array $num 判断是否为第一次执行此函数，防止多次转换时存在冗余
 * @return array
 */
function multi_turn_one($multi_arr = array(), $num = 1)
{
    static $result = array();
    //第一次执行时清空数组
    if ($num == 1) {
        $result = array();
    }
    foreach ($multi_arr as $key => $val) {
        if (is_array($val)) {
            $this->multi_to_one($val, $num++);
        } else {
            $result[] = $val;
        }
    }
    return $result;
}


/**
 * 格式化文件大小d单位
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