<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:12
 */
class Sys_user_model extends MY_Model
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
        $this->db->select('sys_user.*');
        $this->db->select('sys_role.name as sys_role_name');
        $this->db->select('sys_dict.name as state_name,sys_dict.color as state_color');
        $this->db->from('sys_user');
        $this->db->join('sys_role', 'sys_role.id=sys_user.sys_role_id', 'left');
        $this->db->join('sys_dict', 'sys_dict.ident=sys_user.state', 'left');
        if ($key) {
            $this->db->like('sys_user.username', $key);
        }
        $config['total_rows'] = $this->db->count_all_results('', FALSE);
        $config['per_page'] = MYPERPAGE;
        $config['cur_page'] = $page;
        $this->pagination->initialize($config);
        $this->db->order_by('sys_user.id asc');
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
        $res = $this->db->get('sys_user')->row_array();
        return $res;
    }

    //保存
    public function save()
    {
        $id = $this->input->post('id');
        $password = ($this->input->post('password')) ? md5($this->input->post('password')) : '';
        $vals = array_filter(
            array(
                'sys_role_id' => $this->input->post('sys_role_id'),
                'username' => $this->input->post('username'),
                'password' => $password,
                'nickname' => $this->input->post('nickname'),
                'realname' => $this->input->post('realname'),
                'state' => $this->input->post('state'),
                'remark' => $this->input->post('remark')
            )
        );
        if ($id) {
            $bool = $this->db->where('id', $id)->update('sys_user', $vals);
        } else {
            $this->db->insert('sys_user', $vals);
            $bool = $this->db->insert_id();
        }
        return $bool;
    }

    //角色
    public function sys_role()
    {
        $this->db->order_by('sort asc,id asc');
        $res = $this->db->get('sys_role')->result_array();
        return $res;
    }

}