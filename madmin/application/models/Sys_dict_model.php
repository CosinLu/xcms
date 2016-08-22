<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/22
 * Time: 12:40
 */
class Sys_dict_model extends MY_Model
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('category', array('tb_name' => 'sys_dict'));
    }

    //获得列表
    public function get_list()
    {
        $this->db->from('sys_dict');
        $this->db->order_by('sort asc,id asc');
        $res = $this->db->get()->result_array();
        $data['list'] = $this->category->children($res);
        $data['total_nums'] = count($res);
        return $data;
    }

    //更新
    public function update()
    {
        $id = $this->input->get('id');
        $this->db->where('id', $id);
        $res = $this->db->get('sys_dict')->row_array();
        return $res;
    }

    //保存
    public function save()
    {
        $id = $this->input->post('id');
        $pid = $this->input->post('pid');
        $vals = array(
            'name' => $this->input->post('name'),
            'ident' => $this->input->post('ident'),
            'color' => $this->input->post('color'),
            'remark' => $this->input->post('remark'),
            'sort' => $this->input->post('sort')
        );
        if ($id) {
            $bool = $this->category->update($id, $pid, $vals);
        } else {
            $bool = $this->category->insert($pid, $vals);
        }
        return $bool;
    }

    //数据字典类型
    public function sys_dict_type()
    {
        $this->db->where('pid', 0);
        $res = $this->db->get('sys_dict')->result_array();
        return $res;
    }

}