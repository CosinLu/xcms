<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:12
 */
class Info_col_muitipic_model extends M_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    //获得列表
    public function get_list($key = '', $page = '')
    {
        $this->db->select('t.*');
        $this->db->select('t1.name display_name,t1.color display_color');
        $this->db->select('t2.name info_col_name');
        $this->db->select('t3.rel_path');
        $this->db->from('info_col_muitipic t');
        $this->db->join('common_dict t1', 't1.ident=t.display', 'left');
        $this->db->join('info_col t2', 't2.id=t.cid', 'left');
        $this->db->join('uploads t3', 't3.id=t.cid', 'left');
        if ($key != '') {
            $this->db->like('t.name', $key);
        }
        $config['total_rows'] = $this->db->count_all_results('', FALSE);
        $config['per_page'] = $this->config->item('per_page', 'mcms');
        $config['cur_page'] = $page;
        $this->pagination->initialize($config);
        $this->db->order_by('t.cid asc,t.sort asc,t.id asc');
        $this->db->limit($config['per_page'], ($page - 1) * $config['per_page']);
        $data['list'] = $this->db->get()->result_array();
        $data['pagination'] = $this->pagination->create_ajax_links();
        $data['total'] = $config['total_rows'];

        return $data;
    }

    //更新
    public function update($id = '')
    {
        $this->db->where('id', $id);
        $res = $this->db->get('info_col_muitipic')->row_array();

        return $res;
    }

    //保存
    public function save($data = array())
    {
        if ($data['id']) {
            $bool = $this->db->where('id', $data['id'])->update('info_col_muitipic', $data['vals']);
        } else {
            $bool = $this->db->insert('info_col_muitipic', $data['vals']);
        }

        return $bool;
    }

    //信息栏目
    public function info_col()
    {
        $this->db->order_by('sort asc,id asc');
        $this->db->where(array(
            'pic' => 'muitipic',
            'display' => 'show'
        ));
        $res = $this->db->get('info_col')->result_array();

        return $res;
    }

}