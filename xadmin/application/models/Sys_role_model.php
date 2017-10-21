<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:12
 */
class Sys_role_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    //获取列表
    public function get_list($key = '', $page = '')
    {
        $this->db->from('sys_role');
        if ($key != '') {
            $this->db->like('name', $key);
        }
        if ($this->session->sys_session['user_type'] > 0) {
            $this->db->where('role_type > ', 0);
        }
        $config['total_rows'] = $this->db->count_all_results(NULL, FALSE);
        $config['per_page'] = config_item('my_per_page');
        $config['cur_page'] = $page;
        $this->pagination->initialize($config);
        $this->db->order_by('role_type asc,sort asc,id asc');
        $this->db->limit($config['per_page'], ($page - 1) * $config['per_page']);
        $res['list'] = $this->db->get()->result_array();
        $res['pagination'] = $this->pagination->create_ajax_links();
        $res['total'] = $config['total_rows'];

        return $res;
    }

    //修改
    public function update($id = '')
    {
        $this->db->where('id', $id);
        $res = $this->db->get('sys_role')->row_array();

        return $res;
    }

    //保存
    public function save($post = array())
    {
        if ($post['id']) {
            $bool = $this->db->where('id', $post['id'])->update('sys_role', $post['vals']);
        } else {
            $bool = $this->db->insert('sys_role', $post['vals']);
        }

        return $bool;
    }

}