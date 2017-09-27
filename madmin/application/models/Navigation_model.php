<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/22
 * Time: 12:40
 */
class Navigation_model extends CI_Model
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
        $this->db->select('t2.name position_name');
        $this->db->from('navigation t');
        $this->db->join('common_dict t1', 't1.ident=t.display', 'left');
        $this->db->join('common_dict t2', 't2.ident=t.position', 'left');
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
        $this->db->from('navigation');
        $this->db->where('id', $id);
        $res = $this->db->get()->row_array();

        return $res;
    }

    //保存
    public function save($post = array())
    {
        if ($post['id']) {
            $bool = $this->tree->update($this->data(), 'navigation', $post['id'], $post['vals']);
        } else {
            $bool = $this->tree->insert('navigation', $post['vals']);
        }

        return $bool;
    }

    //获取信息栏目
    public function cols()
    {
        $this->db->select('t.*');
        $this->db->select('t1.sys_tpl');
        $this->db->from('info_col t');
        $this->db->join('sys_tpl t1', 't1.id=t.tpl_id', 'left');
        $this->db->where('t.display', 'show');
        $this->db->order_by('t.sort asc,t.id asc');
        $res = $this->db->get()->result_array();
        $res = $this->tree->serialize($res);
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

    //获取所有数据
    public function data()
    {
        $this->db->where('display', 'show');
        $res = $this->db->get('navigation')->result_array();
        return $res;
    }

}