<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/22
 * Time: 12:40
 */
class Sys_col_model extends MY_Model
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('category', array('tb_name' => 'sys_col'));
    }

    public function index()
    {

    }

    public function get_list()
    {
        $this->db->from('sys_col');
        $this->db->order_by('id asc');
        $sys_col_data = $this->db->get()->result_array();
        $data['list'] = $this->category->children($sys_col_data);
        $data['total_nums'] = count($sys_col_data);
        return $data;
    }

    //更新
    public function update(){
        $id = $this->input->get('id');
        $this->db->where('id',$id);
        $res = $this->db->get('sys_col')->row_array();
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

}