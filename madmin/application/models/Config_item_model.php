<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:12
 */
class Config_item_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    //获取列表
    public function get_list($key = '', $page = '', $category = '')
    {
        $this->db->select('t.*');
        $this->db->select('t1.name display_name,t1.color display_color');
        $this->db->select('t2.name config_group_name');
        $this->db->from('config t');
        $this->db->join('common_dict t1', 't1.ident = t.display', 'left');
        $this->db->join('config_group t2', 't2.category=t.category', 'left');
        if ($key != '') {
            $this->db->like('t.title', $key);
        }
        if ($category != '') {
            $this->db->where('t.category', $category);
        }
        $config['total_rows'] = $this->db->count_all_results('', FALSE);
        $config['per_page'] = $this->config->item('per_page', 'mcms');
        $config['cur_page'] = $page;
        $this->pagination->initialize($config);
        $this->db->order_by('t.sort asc,t.id asc');
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
        $res = $this->db->get('config')->row_array();

        return $res;
    }

    //保存
    public function save($post = array())
    {
        if ($post['id']) {
            $bool = $this->db->where('id', $post['id'])->update('config', $post['vals']);
        } else {
            $bool = $this->db->insert('config', $post['vals']);
        }

        return $bool;
    }

    //配置组
    public function config_group()
    {
        $this->db->select('name,category');
        $this->db->where('display', 'show');
        $this->db->order_by('sort asc,id asc');
        $res = $this->db->get('config_group')->result_array();

        return $res;
    }

}