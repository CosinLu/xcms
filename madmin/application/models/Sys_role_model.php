<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:12
 */
class Sys_role_model extends M_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    //获得列表
    public function get_list($key = '', $page = '')
    {
        $this->db->from('sys_role');
        if ($key != '') {
            $this->db->like('name', $key);
        }
        $this->db->where('role_type > ', 0);
        $config['total_rows'] = $this->db->count_all_results('', FALSE);
        $config['per_page'] = $this->config->item('per_page', 'mcms');
        $config['cur_page'] = $page;
        $this->pagination->initialize($config);
        $this->db->order_by('sort asc,id asc');
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
        $res = $this->db->get('sys_role')->row_array();

        return $res;
    }

    //保存
    public function save($data = array())
    {
        if ($data['id']) {
            $bool = $this->db->where('id', $data['id'])->update('sys_role', $data['vals']);
        } else {
            $bool = $this->db->insert('sys_role', $data['vals']);
        }

        return $bool;
    }

}