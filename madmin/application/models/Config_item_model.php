<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:12
 */
class Config_item_model extends MY_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    //获得列表
    public function get_list()
    {
        $key = $this->input->post('key');
        $page = ($this->input->post('page')) ?: 1;
        $this->db->select('t.*');
        $this->db->select('t1.name as display_name,t1.color as display_color');
        $this->db->select('t2.name as config_group_name');
        $this->db->from('config as t');
        $this->db->join('sys_dict as t1', 't1.ident = t.display', 'left');
        $this->db->join('config_group as t2', 't2.id=t.config_group_id', 'left');
        if ($key != '') {
            $this->db->like('t.title', $key);
        }
        $config['total_rows'] = $this->db->count_all_results('', FALSE);
        $config['per_page'] = MYPERPAGE;
        $config['cur_page'] = $page;
        $this->pagination->initialize($config);
        $this->db->order_by('t.sort asc,t.id asc');
        $this->db->limit($config['per_page'], ($page - 1) * $config['per_page']);
        $data['list'] = $this->db->get()->result_array();
        $data['pagination'] = $this->pagination->create_ajax_links();
        $data['total'] = $config['total_rows'];
        return $data;
    }

    //更新
    public function update()
    {
        $id = $this->input->get('id');
        $this->db->where('id', $id);
        $res = $this->db->get('config')->row_array();
        return $res;
    }

    //保存
    public function save()
    {
        $id = $this->input->post('id');
        $vals = array(
            'title' => $this->input->post('title'),
            'name' => $this->input->post('name'),
            'config_group_id' => $this->input->post('config_group_id'),
            'type' => $this->input->post('type'),
            'param' => $this->input->post('param'),
            'remark' => $this->input->post('remark'),
            'display' => $this->input->post('display'),
            'sort' => $this->input->post('sort')
        );
        if ($id) {
            $bool = $this->db->where('id', $id)->update('config', $vals);
        } else {
            $bool = $this->db->insert('config', $vals);
        }
        return $bool;
    }

    //配置组
    public function config_group()
    {
        $this->db->where('display', 'show');
        $this->db->order_by('sort asc,id asc');
        $res = $this->db->get('config_group')->result_array();
        return $res;
    }

}