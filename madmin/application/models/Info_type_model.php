<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:12
 */
class Info_type_model extends MY_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    //获得列表
    public function get_list()
    {
        $key = $this->input->post('key');
        $page = ($this->input->post('page')) ?: 1;
        $this->db->select('info_type.*');
        $this->db->select('sys_dict.name as display_name,sys_dict.color as display_color');
        $this->db->from('info_type');
        $this->db->join('sys_dict', 'sys_dict.ident=info_type.display', 'left');
        if ($key) {
            $this->db->like('info_type.name', $key);
        }
        $config['total_rows'] = $this->db->count_all_results('', FALSE);
        $config['per_page'] = MYPERPAGE;
        $config['cur_page'] = $page;
        $this->pagination->initialize($config);
        $this->db->order_by('info_type.sort asc,info_type.id asc');
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
        $res = $this->db->get('info_type')->row_array();
        return $res;
    }

    //保存
    public function save()
    {
        $id = $this->input->post('id');
        $vals = array(
            'name' => $this->input->post('name'),
            'ctrl' => $this->input->post('ctrl'),
            'sys_ctrl' => $this->input->post('sys_ctrl'),
            'remark' => $this->input->post('remark'),
            'display' => $this->input->post('display'),
            'sort' => $this->input->post('sort')
        );
        if ($id) {
            $bool = $this->db->where('id', $id)->update('info_type', $vals);
        } else {
            $this->db->insert('info_type', $vals);
            $bool = $this->db->insert_id();
        }
        return $bool;
    }

}