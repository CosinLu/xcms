<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:12
 */
class Info_cases_model extends M_Model
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('category_lib', array('tb_name' => 'info_col'), 'category_lib');
    }

    //获得列表
    public function get_list($cid = '', $key = '', $page = '')
    {
        $children_id_arr = $this->category_lib->children_id(array(), $cid, TRUE);
        $this->db->select('t.*');
        $this->db->select('t1.name as display_name,t1.color as display_color');
        $this->db->from('info_cases as t');
        $this->db->join('common_dict as t1', 't1.ident=t.display', 'left');
        if ($key != '') {
            $this->db->like('t.name', $key);
        }
        $this->db->where_in('t.cid', $children_id_arr);
        $config['total_rows'] = $this->db->count_all_results('', FALSE);
        $config['per_page'] = $this->config->item('per_page', 'mcms');
        $config['cur_page'] = $page;
        $this->pagination->initialize($config);
        $this->db->order_by('t.sort desc,t.create_time desc,t.id desc');
        $this->db->limit($config['per_page'], ($page - 1) * $config['per_page']);
        $data['list'] = $this->db->get()->result_array();
        $data['pagination'] = $this->pagination->create_ajax_links();
        $data['total'] = $config['total_rows'];

        return $data;
    }

    //更新
    public function update($id = '')
    {
        $this->db->where('id', $id);
        $res = $this->db->get('info_cases')->row_array();

        return $res;
    }

    //保存
    public function save($data = array())
    {
        if ($data['id']) {
            $bool = $this->db->where('id', $data['id'])->update('info_cases', $data['vals']);
        } else {
            $bool = $this->db->insert('info_cases', $data['vals']);
        }

        return $bool;
    }

}