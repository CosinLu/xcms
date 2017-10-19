<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/22
 * Time: 12:40
 */
class Info_category_model extends CI_Model
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
        $this->db->select('t2.name model_name');
        $this->db->from('info_category t');
        $this->db->join('common_dict t1', 't1.ident=t.display', 'left');
        $this->db->join('info_model t2', 't2.id=t.model_id', 'left');
        $this->db->order_by('t.sort asc,t.id asc');
        $this->db->group_by('t.id');
        $res = $this->db->get()->result_array();
        $res['list'] = $this->tree->serialize($res);

        return $res;
    }

    //修改
    public function update($id = '')
    {
        $this->db->from('info_category t');
        $this->db->where('t.id', $id);
        $res = $this->db->get()->row_array();

        return $res;
    }

    //保存
    public function save($post = array())
    {
        if ($post['id']) {
            $bool = $this->tree->update($this->data(), 'info_category', $post['id'], $post['vals']);
        } else {
            $bool = $this->tree->insert('info_category', $post['vals']);
        }

        return $bool;
    }

    //模型
    public function model()
    {
        $this->db->where('display', 'show');
        $res = $this->db->get('info_model')->result_array();

        return $res;
    }

    //所有数据
    public function data()
    {
        $res = $this->db->get('info_category')->result_array();

        return $res;
    }

}