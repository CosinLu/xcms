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
        $this->db->select('t.*');
        $this->db->select('t1.name as display_name,t1.color as display_color');
        $this->db->select('t2.name as info_model_name');
        $this->db->select('t3.name as target_name');
        $this->db->from('info_col as t');
        $this->db->join('sys_dict as t1', 't1.ident=t.display', 'left');
        $this->db->join('info_model as t2', 't2.id=t.info_model_id', 'left');
        $this->db->join('sys_dict as t3', 't3.ident=t.target', 'left');
        $this->db->order_by('t.sort asc,t.id asc');
        $this->db->group_by('t.id');
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
        $id = $cid = $this->input->post('id');
        $pid = $this->input->post('pid');
        $location = $this->input->post('location');
        $url = $this->input->post('url');
        $vals = array(
            'info_model_id' => $this->input->post('info_model_id'),
            'url' => ($url) ? $url : prep_url($url),
            'name' => $this->input->post('name'),
            'dir' => $this->input->post('dir'),
            'pic' => $this->input->post('pic'),
            'remark' => $this->input->post('remark'),
            'location' => (!empty($location)) ? implode(',', $location) : '',
            'target' => $this->input->post('target'),
            'display' => $this->input->post('display'),
            'sort' => $this->input->post('sort'),
        );
        if ($id) {
            $bool = $this->category->update($id, $pid, $vals);
        } else {
            $bool = $cid = $this->category->insert($pid, $vals);
        }
        return $bool;
    }

    //模型
    public function info_model()
    {
        $this->db->where('display', 'show');
        $res = $this->db->get('info_model')->result_array();
        return $res;
    }

}