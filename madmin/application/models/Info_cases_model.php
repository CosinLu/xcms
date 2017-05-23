<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:12
 */
class Info_cases_model extends MY_Model
{
    protected $cid;

    public function __construct()
    {
        parent::__construct();
        $this->cid = $this->input->get('cid');
        $this->load->library('category', array('tb_name' => 'info_col'), 'category');
    }

    //获得列表
    public function get_list()
    {
        $children_id_arr = $this->category->children_id(array(), $this->cid, TRUE);
        $key = $this->input->post('key');
        $page = ($this->input->post('page')) ?: 1;
        $this->db->select('t.*');
        $this->db->select('t1.name as display_name,t1.color as display_color');
        $this->db->from('info_cases as t');
        $this->db->join('sys_dict as t1', 't1.ident=t.display', 'left');
        if ($key != '') {
            $this->db->like('t.name', $key);
        }
        $this->db->where_in('t.cid', $children_id_arr);
        $config['total_rows'] = $this->db->count_all_results('', FALSE);
        $config['per_page'] = MYPERPAGE;
        $config['cur_page'] = $page;
        $this->pagination->initialize($config);
        $this->db->order_by('t.sort desc,t.id desc');
        $this->db->limit($config['per_page'], ($page - 1) * $config['per_page']);
        $data['list'] = $this->db->get()->result_array();
        $data['pagination'] = $this->pagination->create_ajax_links();
        $data['total'] = $config['total_rows'];
        return $data;
    }

    //更新
    public function update()
    {
        $id = $this->input->get('id');
        $this->db->where('id', $id);
        $res = $this->db->get('info_cases')->row_array();
        return $res;
    }

    //保存
    public function save()
    {
        $id = $this->input->post('id');
        $image = $this->input->post('image');
        $images = $this->input->post('images');
        $vals = array(
            'cid' => $this->input->post('cid'),
            'title' => $this->input->post('title'),
            'case_url' => $this->input->post('case_url'),
            'image' => (!empty($image)) ? implode(',', $image) : '',
            'images' => (!empty($images)) ? implode(',', $images) : '',
            'target' => $this->input->post('target'),
            'display' => $this->input->post('display'),
            'sort' => $this->input->post('sort'),
            'content' => $this->input->post('content'),
            'create_time' => strtotime($this->input->post('create_time'))
        );
        if ($id) {
            $bool = $this->db->where('id', $id)->update('info_cases', $vals);
        } else {
            $bool = $this->db->insert('info_cases', $vals);
        }
        return $bool;
    }

}