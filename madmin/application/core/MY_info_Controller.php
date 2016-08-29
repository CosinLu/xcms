<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/29
 * Time: 22:19
 */
class MY_info_Controller extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('category', array('tb_name' => 'info_col'), 'category');
        $this->info_col_sidebar();
    }

    //获得信息栏目
    public function info_col_sidebar()
    {
        $this->db->where('display', 'show');
        $info_col_res = $this->db->get('info_col')->result_array();
        $info_col_sort = $this->category->children($info_col_res);
        $str = '';
        $parent_level = 0;
        foreach ($info_col_sort as $val) {
            $level = $val['level'];
            $current = ($val['id'] == $this->sys_cid) ? 'current' : '';
            if ($level < $parent_level) {
                $str .= '</li>' . str_repeat('</ul></li>', $parent_level - $level);
            } elseif ($level > $parent_level) {
                $str .= '<ul data-level="' . ($level - 1) . '">';
            } else {
                $str .= '</li>';
            }
            $str .= '<li>';
            $str .= '<a href="javascript:;" class="' . $current . '" data-name="mtree_link">';
            $str .= '<span data-name="mtree_indent"></span>';
            $str .= '<span data-name="mtree_btn"></span>';
            $str .= '<span data-name="mtree_name">' . $val['name'] . '</span>';
            $str .= '</a>';
            $parent_level = $level;
        }
        $str .= str_repeat('</li></ul>', $parent_level + 1);
        $data['info_col_sidebar'] = $str;
        $this->load->vars($data);
    }

}