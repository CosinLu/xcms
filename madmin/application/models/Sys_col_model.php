<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/22
 * Time: 12:40
 */
class Sys_col_model extends CI_Model
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
        $this->db->select('group_concat(concat("<kbd>",t3.name,"</kbd>") order by t3.sort asc,t3.id asc SEPARATOR "&nbsp;") col_auth');
        $this->db->select('t4.name user_type_name,t4.color user_type_color');
        $this->db->from('sys_col t');
        $this->db->join('common_dict t1', 't1.ident=t.display', 'left');
        $this->db->join('sys_col_auth t2', 't2.col_id=t.id', 'left');
        $this->db->join('common_dict t3', 't3.ident=t2.col_auth', 'left');
        $this->db->join('common_dict t4', 't4.ident=t.user_type', 'left');
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
        $this->db->select('t.*');
        $this->db->select('group_concat(t1.col_auth) col_auth');
        $this->db->from('sys_col t');
        $this->db->join('sys_col_auth t1', 't1.col_id=t.id', 'left');
        $this->db->where('t.id', $id);
        $res = $this->db->get()->row_array();

        return $res;
    }

    //保存
    public function save($post = array())
    {
        $col_id = $post['id'];
        if ($post['id']) {
            $bool = $this->tree->update($this->data(), 'sys_col', $post['id'], $post['vals']);
        } else {
            $bool = $col_id = $this->tree->insert('sys_col', $post['vals']);
        }
        //设置系统栏目权限
        $this->set_col_auth($col_id, $post['auth']);

        return $bool;
    }

    //设置系统栏目权限
    public function set_col_auth($col_id, $col_auth)
    {
        //删除栏目权限
        $this->del_col_auth($col_id);
        if (empty($col_auth)) {
            return;
        }
        //设置写入数据
        foreach ($col_auth as $val) {
            $vals[] = array(
                'col_id' => $col_id,
                'col_auth' => $val
            );
        }
        $this->db->insert_batch('sys_col_auth', $vals);
    }

    //删除系统栏目权限
    public function del_col_auth($col_id)
    {
        $this->db->where('col_id', $col_id);
        $this->db->delete('sys_col_auth');
        $rows = $this->db->affected_rows();

        return $rows;
    }

    //获取所有数据
    public function data()
    {
        $this->db->where('display', 'show');
        $res = $this->db->get('sys_col')->result_array();

        return $res;
    }
}