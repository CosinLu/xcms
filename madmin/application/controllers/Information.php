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
    protected $children_cid;
    protected $main_section_name;

    public function __construct()
    {
        parent::__construct();
        $this->cid = $this->input->get('cid');
        $this->load->model('information_model');
        $this->children_cid = $this->tree->get_children($this->information_model->data(), $this->cid, TRUE, 'id');
        $this->main_sidebar();
    }

    public function main_sidebar()
    {
        $this->db->select('t.*');
        $this->db->select('t1.model');
        $this->db->from('category t');
        $this->db->join('model t1', 't1.id=t.model_id', 'left');
        $this->db->where('t.display', 'show');
        $category_res = $this->db->get()->result_array();
        $category_sort = $this->tree->serialize($category_res);
        $str = '<div class="ph pt iframe_main_sidebar_btn_group"><a href="' . site_url('category/insert') . '" class="btn btn-primary btn-block">新增栏目</a></div>';
        $str .= '<div class="nano iframe_main_sidebar_nano nano-hook">';
        $str .= '<div class="ph mt nano-content">';
        $str .= '<div class="mtree mtree-main-sidebar-hook">';
        $start_level = -1;
        $parent_level = 0;
        $data['main_section_name'] = '';
        foreach ($category_sort as $val) {
            $level = $val['level'];
            $current = ($val['id'] == $this->cid) ? 'current' : '';
            $indent = (15 * ($level - 1)) . 'px';
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
            if ($val['model'] == '') {
                $str .= '<a class="' . $current . ' mtree_link mtree-link-hook" href="javascript:;">';
            } else {
                $str .= '<a class="' . $current . ' mtree_link mtree-link-hook" href="javascript:;" data-url="' . site_url($val['model'] . '?cid=' . $val['id']) . '">';
            }
            $str .= '<div class="mtree_indent mtree-indent-hook" style="width:' . $indent . '"></div>';
            $str .= '<div class="mtree_btn mtree-btn-hook"></div>';
            $str .= '<div class="mtree_name mtree-name-hook">' . $val['name'] . '</div>';
            $str .= '</a>';
            $parent_level = $level;
            if ($val['id'] == $this->cid) {
                $data['main_section_name'] = $val['name'];
            }
        }
        $str .= str_repeat('</li></ul>', $parent_level - $start_level + 1);
        $str .= '</div>';
        $str .= '</div>';
        $str .= '</div>';
        $data['main_sidebar'] = $str;
        $this->main_section_name = $data['main_section_name'];
        $this->load->vars($data);
    }

    //获取信息栏目
    public function index()
    {
        $data = $this->information_model->cols();
        $children = array();
        $url = array();
        foreach ($data as $key => $val) {
            $children[$key] = $this->tree->get_children($data, $val['pid'], TRUE);
            foreach ($children[$key] as $val) {
                if ($val['model']) {
                    $url[$key] = $val['model'] . '?cid=' . $val['id'];
                    break;
                } else {
                    $url[$key] = '';
                }
            }
        }
        if (count($url)) {
            $url = array_slice($url, 0, 1);
            redirect(site_url($url));
        } else {
            $this->load->view('information/index.html');
        }
    }

    //获取当前栏目的模型标识
    public function model_id()
    {
        $res = $this->information_model->model_id($this->cid);

        return $res;
    }

}