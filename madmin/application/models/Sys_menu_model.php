<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/22
 * Time: 12:40
 */
class Sys_menu_model extends CI_Model
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
        $this->db->select('group_concat(concat("<kbd>",t3.name,"</kbd>") order by t3.sort asc,t3.id asc SEPARATOR "&nbsp;") sys_menu_auth');
        $this->db->select('t4.name user_type_name,t4.color user_type_color');
        $this->db->from('sys_menu t');
        $this->db->join('common_dict t1', 't1.ident=t.display', 'left');
        $this->db->join('sys_menu_auth t2', 't2.sys_menu_id=t.id', 'left');
        $this->db->join('common_dict t3', 't3.ident=t2.sys_menu_auth', 'left');
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
        $this->db->select('group_concat(t1.sys_menu_auth) sys_menu_auth');
        $this->db->from('sys_menu t');
        $this->db->join('sys_menu_auth t1', 't1.sys_menu_id=t.id', 'left');
        $this->db->where('t.id', $id);
        $res = $this->db->get()->row_array();

        return $res;
    }

    //保存
    public function save($post = array())
    {
        $sys_menu_id = $post['id'];
        if ($post['id']) {
            $bool = $this->tree->update($this->data(), 'sys_menu', $post['id'], $post['vals']);
        } else {
            $bool = $sys_menu_id = $this->tree->insert('sys_menu', $post['vals']);
        }
        //设置系统栏目权限
        $this->set_sys_menu_auth($sys_menu_id, $post['auth']);

        return $bool;
    }

    //设置系统栏目权限
    public function set_sys_menu_auth($sys_menu_id, $sys_menu_auth)
    {
        //删除栏目权限
        $this->del_sys_menu_auth($sys_menu_id);
        if (empty($sys_menu_auth)) {
            return;
        }
        //设置写入数据
        foreach ($sys_menu_auth as $val) {
            $vals[] = array(
                'sys_menu_id' => $sys_menu_id,
                'sys_menu_auth' => $val
            );
        }
        $this->db->insert_batch('sys_menu_auth', $vals);
    }

    //删除系统栏目权限
    public function del_sys_menu_auth($sys_menu_id)
    {
        $this->db->where('sys_menu_id', $sys_menu_id);
        $this->db->delete('sys_menu_auth');
        $rows = $this->db->affected_rows();

        return $rows;
    }

    //获取所有数据
    public function data()
    {
        $res = $this->db->get('sys_menu')->result_array();

        return $res;
    }
}