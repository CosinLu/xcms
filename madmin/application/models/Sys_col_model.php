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

    //获得列表
    public function get_list()
    {
        $this->db->select('t.*');
        $this->db->select('t1.name as user_type,t1.color as user_type_color');
        $this->db->select('t2.name as display_name,t2.color as display_color');
        $this->db->select('group_concat(concat("<kbd>",t4.name,"</kbd>") order by t4.ident SEPARATOR "&nbsp;") as col_auth');
        $this->db->from('sys_col as t');
        $this->db->join('sys_dict as t1', 't1.ident=t.user_type', 'left');
        $this->db->join('sys_dict as t2', 't2.ident=t.display', 'left');
        $this->db->join('sys_col_auth as t3', 't3.col_id=t.id', 'left');
        $this->db->join('sys_dict as t4', 't4.ident=t3.col_auth', 'left');
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
        $this->db->select('t.*');
        $this->db->select('group_concat(t1.col_auth) as col_auth');
        $this->db->from('sys_col as t');
        $this->db->join('sys_col_auth as t1', 't1.col_id=t.id', 'left');
        $this->db->where('t.id', $id);
        $res = $this->db->get()->row_array();
        return $res;
    }

    //保存
    public function save()
    {
        $id = $col_id = $this->input->post('id');
        $pid = $this->input->post('pid');
        $vals = array(
            'name' => $this->input->post('name'),
            'dir' => $this->input->post('dir'),
            'ctrl' => $this->input->post('ctrl'),
            'method' => $this->input->post('method'),
            'param' => $this->input->post('param'),
            'remark' => $this->input->post('remark'),
            'user_type' => $this->input->post('user_type'),
            'display' => $this->input->post('display'),
            'sort' => $this->input->post('sort'),
        );
        if ($id) {
            $bool = $this->category->update($id, $pid, $vals);
        } else {
            $bool = $col_id = $this->category->insert($pid, $vals);
        }
        $this->set_col_auth($col_id, $this->input->post('auth'));//设置系统栏目权限
        return $bool;
    }

    /**
     * 设置系统栏目权限
     * @param $col_id   系统栏目id
     * @param $col_auth 系统栏目权限
     */
    public function set_col_auth($col_id, $col_auth)
    {
        $this->del_col_auth($col_id);//删除栏目权限
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

    /**
     * 删除系统栏目权限
     * @param $col_id   系统栏目id
     * @return mixed
     */
    public function del_col_auth($col_id)
    {
        $this->db->where('col_id', $col_id);
        $this->db->delete('sys_col_auth');
        $rows = $this->db->affected_rows();
        return $rows;
    }
}