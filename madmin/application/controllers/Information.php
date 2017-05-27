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
    protected $main_section_name;

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
                if ($val['sys_tpl']) {
                    $url[$key] = $val['sys_tpl'] . '?sys_cid=' . $this->sys_cid . '&cid=' . $val['id'];
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
        $this->db->select('t.*');
        $this->db->select('t1.sys_tpl');
        $this->db->from('info_col as t');
        $this->db->join('info_tpl as t1', 't1.id=t.info_tpl_id', 'left');
        $this->db->where('t.display', 'show');
        $info_col_res = $this->db->get()->result_array();
        $info_col_sort = $this->category->children($info_col_res, 0, TRUE);
        $str = '<div class="mtree" data-name="mtreeMainSidebar">';
        $start_level = -1;
        $parent_level = 0;
        foreach ($info_col_sort as $val) {
            $level = $val['level'];
            $current = ($val['id'] == $this->cid) ? 'current' : '';
            $indent = (15 * ($level - 2)) . 'px';
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
            if ($val['sys_tpl'] == '') {
                $str .= '<a class="' . $current . '" href="javascript:;" data-name="mtreeLink">';
            } else {
                $str .= '<a class="' . $current . '" href="javascript:;" data-url="' . site_url($val['sys_tpl'] . '?sys_cid=' . $this->sys_cid . '&cid=' . $val['id']) . '" data-name="mtreeLink">';
            }
            $str .= '<div data-name="mtreeIndent" style="width:' . $indent . '"></div>';
            $str .= '<div data-name="mtreeBtn"></div>';
            $str .= '<div data-name="mtreeName">' . $val['name'] . '</div>';
            $str .= '</a>';
            $parent_level = $level;
            if ($val['id'] == $this->cid) {
                $data['main_section_name'] = $val['name'];
            }
        }
        $str .= str_repeat('</li></ul>', $parent_level - $start_level + 1);
        $str .= '</div>';
        $data['main_sidebar'] = $str;
        $this->main_section_name = $data['main_section_name'];
        $this->load->vars($data);
    }

    //获得当前栏目的模板标识
    public function info_tpl_id()
    {
        $res = $this->information->info_tpl_id();
        return $res;
    }

}