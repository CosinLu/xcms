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
        $this->load->library('category_lib', array('tb_name' => 'navigation'));
    }

    //获得列表
    public function get_list()
    {
        $this->db->select('t.*');
        $this->db->select('t1.name as display_name,t1.color as display_color');
        $this->db->select('t2.name as position_name');
        $this->db->from('navigation as t');
        $this->db->join('common_dict as t1', 't1.ident=t.display', 'left');
        $this->db->join('common_dict as t2', 't2.ident=t.position', 'left');
        $this->db->order_by('t.sort asc,t.id asc');
        $this->db->group_by('t.id');
        $res = $this->db->get()->result_array();
        $data['list'] = $this->category_lib->children($res);
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
            $bool = $this->category_lib->update($data['id'], $data['pid'], $data['vals']);
        } else {
            $bool = $this->category_lib->insert($data['pid'], $data['vals']);
        }

        return $bool;
    }

    //获得信息栏目
    public function cols()
    {
        $this->db->select('t.*');
        $this->db->select('t1.sys_tpl');
        $this->db->from('info_col as t');
        $this->db->join('sys_tpl as t1', 't1.id=t.tpl_id', 'left');
        $this->db->where('t.display', 'show');
        $this->db->order_by('t.sort asc,t.id asc');
        $res = $this->db->get()->result_array();
        $res = $this->category_lib->children($res);
        $new_res = array();
        foreach ($res as $key => $val) {
            $link = $val['url'] ?: $val['dir'];
            $new_val = array_merge($val, array('data' => '{"dir":"' . $link . '"}'));
            array_push($new_res, $new_val);
        }
        array_push($new_res, array(
            'id' => '-1',
            'name' => '自定义链接',
            'pid' => '0',
            'level' => '1',
            'data' => '{"dir":"http://"}',
            'sort' => '99999999999'
        ));

        return $new_res;
    }

}