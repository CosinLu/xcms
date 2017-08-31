<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/22
 * Time: 12:40
 */
class Navigation_model extends M_Model
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('category', array('tb_name' => 'navigation'));
    }

    //获得列表
    public function get_list()
    {
        $this->db->select('t.*');
        $this->db->select('t1.name as display_name,t1.color as display_color');
        $this->db->select('t2.name as position_name');
        $this->db->from('navigation as t');
        $this->db->join('sys_dict as t1', 't1.ident=t.display', 'left');
        $this->db->join('sys_dict as t2', 't2.ident=t.position', 'left');
        $this->db->order_by('t.sort asc,t.id asc');
        $this->db->group_by('t.id');
        $res = $this->db->get()->result_array();
        $data['list'] = $this->category->children($res);
        $data['total'] = count($res);

        return $data;
    }

    //更新
    public function update($id = '')
    {
        $this->db->from('navigation');
        $this->db->where('navigation.id', $id);
        $res = $this->db->get()->row_array();

        return $res;
    }

    //保存
    public function save($data = array())
    {
        if ($data['id']) {
            $bool = $this->category->update($data['id'], $data['pid'], $data['vals']);
        } else {
            $bool = $this->category->insert($data['pid'], $data['vals']);
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

}