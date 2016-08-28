<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/22
 * Time: 12:40
 */
class Info_col_model extends MY_Model
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('category', array('tb_name' => 'info_col'));
    }

    //获得列表
    public function get_list()
    {
        $this->db->select('info_col.*');
        $this->db->select('sd1.name as display_name,sd1.color as display_color');
        $this->db->select('info_type.name as info_type_name');
        $this->db->from('info_col');
        $this->db->join('sys_dict as sd1', 'sd1.ident=info_col.display', 'left');
        $this->db->join('info_type', 'info_type.id=info_col.info_type_id', 'left');
        $this->db->order_by('info_col.sort asc,info_col.id asc');
        $this->db->group_by('info_col.id');
        $res = $this->db->get()->result_array();
        $data['list'] = $this->category->children($res);
        $data['total'] = count($res);
        return $data;
    }

    //更新
    public function update()
    {
        $id = $this->input->get('id');
        $this->db->from('info_col');
        $this->db->where('info_col.id', $id);
        $res = $this->db->get()->row_array();
        return $res;
    }

    //保存
    public function save()
    {
        $id = $info_col_id = $this->input->post('id');
        $pid = $this->input->post('pid');
        $vals = array(
            'info_type_id' => $this->input->post('info_type_id'),
            'name' => $this->input->post('name'),
            'remark' => $this->input->post('remark'),
            'display' => $this->input->post('display'),
            'sort' => $this->input->post('sort'),
        );
        if ($id) {
            $bool = $this->category->update($id, $pid, $vals);
        } else {
            $bool = $info_col_id = $this->category->insert($pid, $vals);
        }
        return $bool;
    }

    //信息类型
    public function info_type()
    {
        $this->db->where('display', 'show');
        $res = $this->db->get('info_type')->result_array();
        return $res;
    }

}