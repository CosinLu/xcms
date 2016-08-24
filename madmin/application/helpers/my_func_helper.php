<?php
/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/24
 * Time: 23:07
 */

/**
 * 下拉菜单
 * @param array $data 原始数据
 * @param string $name 元素名称
 * @param int $select_val 选中值
 * @return string
 */
function select($data = array(), $name = '', $select_val = 0)
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