<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/9/5
 * Time: 16:53
 */
class Information extends MY_Controller
{
    protected $cid;

    public function __construct()
    {
        parent::__construct();
        $this->cid = $this->input->get('cid');
        $this->load->model('information_model', 'information');
        $this->load->library('category', array('tb_name' => 'info_col'), 'category');
        $this->main_sidebar();
    }

    public function index()
    {
        $data = $this->information->info_col();
        $children = array();
        foreach ($data as $key => $val) {
            $children[$key] = $this->category->children($data, $val['pid'], TRUE);
            foreach ($children[$key] as $val) {
                if ($val['sys_ctrl']) {
                    $url[$key] = $val['sys_ctrl'] . '?sys_cid=' . $this->sys_cid . '&cid=' . $val['id'];
                    break;
                } else {
                    $url[$key] = '';
                }
            }
        }
        $url = array_slice($url, 0, 1);
        redirect(site_url($url));
    }

    //获得信息栏目
    public function main_sidebar()
    {
        $this->db->select('info_col.*');
        $this->db->select('info_type.sys_ctrl');
        $this->db->from('info_col');
        $this->db->join('info_type', 'info_type.id=info_col.info_type_id', 'left');
        $this->db->where('info_col.display', 'show');
        $info_col_res = $this->db->get()->result_array();
        $info_col_sort = $this->category->children($info_col_res, 0, TRUE);
        $str = '';
        $start_level = -1;
        $parent_level = 0;
        foreach ($info_col_sort as $val) {
            $level = $val['level'];
            $current = ($val['id'] == $this->cid) ? 'current' : '';
            if ($start_level < 0) {
                $start_level = $level;
            }
            if ($level < $parent_level) {
                $str .= '</li>' . str_repeat('</ul></li>', $parent_level - $level);
            } elseif ($level > $parent_level) {
                $str .= '<ul data-level="' . ($level) . '">';
            } else {
                $str .= '</li>';
            }
            $str .= '<li>';
            if ($val['sys_ctrl'] == '') {
                $str .= '<a class="' . $current . '" href="javascript:;" data-name="mtree_link">';
            } else {
                $str .= '<a class="' . $current . '" href="' . site_url($val['sys_ctrl'] . '?sys_cid=' . $this->sys_cid . '&cid=' . $val['id']) . '" data-name="mtree_link">';
            }
            $str .= '<span data-name="mtree_indent"></span>';
            $str .= '<span data-name="mtree_btn"></span>';
            $str .= '<span data-name="mtree_name">' . $val['name'] . '</span>';
            $str .= '</a>';
            $parent_level = $level;
            if ($val['id'] == $this->cid) {
                $data['main_section_name'] = $val['name'];
            }
        }
        $str .= str_repeat('</li></ul>', $parent_level - $start_level + 1);
        $data['main_sidebar'] = $str;
        $this->load->vars($data);
    }

}