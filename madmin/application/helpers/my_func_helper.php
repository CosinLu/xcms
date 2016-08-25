<?php
/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/24
 * Time: 23:07
 */

/**
 * 下拉框
 * @param array $data 原始数据
 * @param string $name 元素名称
 * @param int $select_val 选中值
 * @return string
 */
function droplist($data = array(), $name = '', $select_val = 0)
{
    $str = '';
    $str .= '<select name="' . $name . '" class="form-control">';
    $str .= '<option value="0">-请选择-</option>';
    foreach ($data as $val) {
        $selected = ($val['id'] == $select_val) ? 'selected' : '';
        $str .= '<option value="' . $val['id'] . '" ' . $selected . '>' . $val['name'] . '</option>';
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