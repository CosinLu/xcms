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
        $this->db->select('sys_col.*');
        $this->db->select('sd1.name as user_type');
        $this->db->select('sd2.name as display_name,sd2.color as display_color');
        $this->db->select('group_concat(concat("<kbd>",sd3.name,"</kbd>") SEPARATOR "&nbsp;") as sys_col_auth');
        $this->db->from('sys_col');
        $this->db->join('sys_dict as sd1', 'sd1.ident=sys_col.user_type', 'left');
        $this->db->join('sys_dict as sd2', 'sd2.ident=sys_col.display', 'left');
        $this->db->join('sys_col_auth', 'sys_col_auth.sys_col_id=sys_col.id', 'left');
        $this->db->join('sys_dict as sd3', 'sd3.ident=sys_col_auth.sys_col_auth', 'left');
        $this->db->order_by('sys_col.sort asc,sys_col.id asc');
        $this->db->group_by('sys_col.id');
        $res = $this->db->get()->result_array();
        $data['list'] = $this->category->children($res);
        $data['total'] = count($res);
        return $data;
    }

    //更新
    public function update()
    {
        $id = $this->input->get('id');
        $this->db->select('sys_col.*,group_concat(sys_col_auth.sys_col_auth) as sys_col_auth');
        $this->db->from('sys_col');
        $this->db->join('sys_col_auth', 'sys_col_auth.sys_col_id=sys_col.id', 'left');
        $this->db->where('sys_col.id', $id);
        $res = $this->db->get()->row_array();
        return $res;
    }

    //保存
    public function save()
    {
        $id = $sys_col_id = $this->input->post('id');
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
            $bool = $sys_col_id = $this->category->insert($pid, $vals);
        }
        $this->set_sys_col_auth($sys_col_id, $this->input->post('auth'));//设置系统栏目权限
        return $bool;
    }

    /**
     * 设置系统栏目权限
     * @param $sys_col_id   系统栏目id
     * @param $sys_col_auth 系统栏目权限
     */
    public function set_sys_col_auth($sys_col_id, $sys_col_auth)
    {
        $this->del_sys_col_auth($sys_col_id);//删除栏目权限
        if (empty($sys_col_auth)) {
            return;
        }
        //设置写入数据
        foreach ($sys_col_auth as $val) {
            $vals[] = array(
                'sys_col_id' => $sys_col_id,
                'sys_col_auth' => $val
            );
        }
        $this->db->insert_batch('sys_col_auth', $vals);
    }

    /**
     * 删除系统栏目权限
     * @param $sys_col_id   系统栏目id
     * @return mixed
     */
    public function del_sys_col_auth($sys_col_id)
    {
        $this->db->where('sys_col_id', $sys_col_id);
        $this->db->delete('sys_col_auth');
        $rows = $this->db->affected_rows();
        return $rows;
    }

}