<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:12
 */
class Sys_user_model extends M_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    //获得列表
    public function get_list($key = '', $page = '')
    {
        $this->db->select('t.*');
        $this->db->select('t1.name as sys_role_name');
        $this->db->select('t2.name as status_name,t2.color as status_color');
        $this->db->from('sys_user as t');
        $this->db->join('sys_role as t1', 't1.id=t.role_id', 'left');
        $this->db->join('common_dict as t2', 't2.ident=t.status', 'left');
        if ($key != '') {
            $this->db->like('t.username', $key);
        }
        $this->db->where('user_type > ', 0);
        $config['total_rows'] = $this->db->count_all_results('', FALSE);
        $config['per_page'] = $this->config->item('per_page', 'mcms');
        $config['cur_page'] = $page;
        $this->pagination->initialize($config);
        $this->db->order_by('t.id asc');
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
        $res = $this->db->get('sys_user')->row_array();

        return $res;
    }

    //保存
    public function save($data = array())
    {
        if ($data['id']) {
            $bool = $this->db->where('id', $data['id'])->update('sys_user', $data['vals']);
        } else {
            $bool = $this->db->insert('sys_user', $data['vals']);
        }

        return $bool;
    }

    //角色
    public function sys_role()
    {
        $this->db->where('role_type > ', 0);
        $this->db->order_by('sort asc,id asc');
        $res = $this->db->get('sys_role')->result_array();

        return $res;
    }

}