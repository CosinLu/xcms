<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:12
 */
class Info_article_model extends MY_Model
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
        $parent_id_arr = $this->category->parent_id(array(), $this->cid, TRUE);
        $key = $this->input->post('key');
        $page = ($this->input->post('page')) ?: 1;
        $this->db->select('t.*');
        $this->db->select('t1.name as display_name,t1.color as display_color');
        $this->db->from('info_article as t');
        $this->db->join('sys_dict as t1', 't1.ident=t.display', 'left');
        if ($key != '') {
            $this->db->like('t.name', $key);
        }
        $this->db->where_in('t.cid', $parent_id_arr);
        $config['total_rows'] = $this->db->count_all_results('', FALSE);
        $config['per_page'] = MYPERPAGE;
        $config['cur_page'] = $page;
        $this->pagination->initialize($config);
        $this->db->order_by('t.sort asc,t.id asc');
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
        $res = $this->db->get('info_article')->row_array();
        return $res;
    }

    //保存
    public function save()
    {
        $id = $this->input->post('id');
        $image_arr = ($this->input->post('image')) ? implode(',', $this->input->post('image')) : '';
        $vals = array(
            'cid' => $this->input->get('cid'),
            'title' => $this->input->post('title'),
            'image' => $image_arr,
            'display' => $this->input->post('display'),
            'remark' => $this->input->post('remark'),
            'sort' => $this->input->post('sort'),
            'content' => $this->input->post('content'),
            'update_time' => time(),
        );
        if ($id) {
            $bool = $this->db->where('id', $id)->update('info_article', $vals);
        } else {
            $bool = $this->db->insert('info_article', $vals);
        }
        return $bool;
    }

}