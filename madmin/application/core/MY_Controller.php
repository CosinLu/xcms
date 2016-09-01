<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/22
 * Time: 10:05
 */
class MY_Controller extends CI_Controller
{
    protected $sys_session;
    protected $sys_cid;//系统栏目标识
    protected $prferer;//上一个页面url
    protected $is_save;//保存：1=保存，2=保存并继续新增

    public function __construct()
    {
        parent::__construct();
        $this->sys_session = $this->session->sys_session;
        $this->sys_cid = $this->input->get('sys_cid');
        $this->peferer = (isset($_SERVER['HTTP_REFERER'])) ? $_SERVER['HTTP_REFERER'] : '';
        $this->is_save = ($this->input->post('is_save') == '') ? '1' : $this->input->post('is_save');
        $this->load->library('sys_auth', array(
            'user_info' => $this->sys_session,
            'sys_cid' => $this->sys_cid
        ));
        //var_dump($this->sys_session);
        $this->load->vars($this->sys_auth->menu());
        $this->load->vars($this->sys_auth->sidebar());
    }


}


//信息控制器
class MY_info_Controller extends MY_Controller
{
    protected $info_cid;

    public function __construct()
    {
        parent::__construct();
        $this->load->library('category', array('tb_name' => 'info_col'), 'category');
        $this->info_cid = $this->input->get('info_cid');
        $this->info_col_sidebar();
    }

    //获得信息栏目
    public function info_col_sidebar()
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
            $current = ($val['id'] == $this->info_cid) ? 'current' : '';
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
                $str .= '<a class="' . $current . '" href="' . site_url($val['sys_ctrl'] . '?sys_cid=' . $this->sys_cid . '&info_cid=' . $val['id']) . '" data-name="mtree_link">';
            }
            $str .= '<span data-name="mtree_indent"></span>';
            $str .= '<span data-name="mtree_btn"></span>';
            $str .= '<span data-name="mtree_name">' . $val['name'] . '</span>';
            $str .= '</a>';
            $parent_level = $level;
            if ($val['id'] == $this->info_cid) {
                $data['main_section_name'] = $val['name'];
            }
        }
        $str .= str_repeat('</li></ul>', $parent_level - $start_level + 1);
        $data['main_sidebar'] = $str;
        $this->load->vars($data);
    }

}