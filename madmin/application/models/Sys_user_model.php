<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:12
 */
class Sys_user_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    //获取列表
    public function get_list($key = '', $page = '')
    {
        $this->db->select('t.*');
        $this->db->select('t1.name sys_role_name');
        $this->db->select('t2.name status_name,t2.color status_color');
        $this->db->from('sys_user t');
        $this->db->join('sys_role t1', 't1.id=t.role_id', 'left');
        $this->db->join('common_dict t2', 't2.ident=t.status', 'left');
        if ($key != '') {
            $this->db->like('t.username', $key);
        }
        if ($this->session->sys_session['user_type'] > 0) {
            $this->db->where('t.user_type > ', 0);
        }
        $config['total_rows'] = $this->db->count_all_results(NULL, FALSE);
        $config['per_page'] = config_item('my_per_page');
        $config['cur_page'] = $page;
        $this->pagination->initialize($config);
        $this->db->order_by('t.user_type asc,t.id asc');
        $this->db->limit($config['per_page'], ($page - 1) * $config['per_page']);
        $data['list'] = $this->db->get()->result_array();
        $data['pagination'] = $this->pagination->create_ajax_links();
        $data['total'] = $config['total_rows'];

        return $data;
    }

    //修改
    public function update($id = '')
    {
        $this->db->where('id', $id);
        $res = $this->db->get('sys_user')->row_array();

        return $res;
    }

    //保存
    public function save($post = array())
    {
        if ($post['id']) {
            $bool = $this->db->where('id', $post['id'])->update('sys_user', $post['vals']);
        } else {
            $bool = $this->db->insert('sys_user', $post['vals']);
        }

        return $bool;
    }

    //角色
    public function sys_role()
    {
        if ($this->session->sys_session['user_type'] > 0) {
            $this->db->where('role_type > ', 0);
        }
        $this->db->order_by('role_type asc,sort asc,id asc');
        $res = $this->db->get('sys_role')->result_array();

        return $res;
    }

    //验证用户名
    public function check_username($username = '', $id = '')
    {
        $this->db->where('username', $username);
        if ($id != '') $this->db->where('id!=', $id);
        $res = $this->db->get('sys_user')->result_array();
        return $res;
    }

}