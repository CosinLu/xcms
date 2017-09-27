<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/22
 * Time: 12:40
 */
class Info_col_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('tree');
    }

    //获取列表
    public function get_list()
    {
        $this->db->select('t.*');
        $this->db->select('t1.name display_name,t1.color display_color');
        $this->db->select('t2.name sys_tpl_name');
        $this->db->from('info_col t');
        $this->db->join('common_dict t1', 't1.ident=t.display', 'left');
        $this->db->join('sys_tpl t2', 't2.id=t.tpl_id', 'left');
        $this->db->order_by('t.sort asc,t.id asc');
        $this->db->group_by('t.id');
        $res = $this->db->get()->result_array();
        $data['list'] = $this->tree->serialize($res);
        $data['total'] = count($res);

        return $data;
    }

    //修改
    public function update($id = '')
    {
        $this->db->from('info_col');
        $this->db->where('info_col.id', $id);
        $res = $this->db->get()->row_array();

        return $res;
    }

    //保存
    public function save($post = array())
    {
        if ($post['id']) {
            $bool = $this->tree->update($this->data(), 'info_col', $post['id'], $post['vals']);
        } else {
            $bool = $this->tree->insert('info_col', $post['vals']);
        }

        return $bool;
    }

    //模型
    public function sys_tpl()
    {
        $this->db->where('display', 'show');
        $res = $this->db->get('sys_tpl')->result_array();

        return $res;
    }

    //所有数据
    public function data()
    {
        $this->db->where('display', 'show');
        $res = $this->db->get('info_col')->result_array();

        return $res;
    }

}