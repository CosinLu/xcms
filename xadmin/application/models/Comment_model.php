<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:12
 */
class Comment_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    //获取列表
    public function get_list($key = '', $page = '')
    {
        $this->db->select('t.*');
        $this->db->select('t1.name audit_status_name,t1.color audit_status_color');
        $this->db->select('t2.username');
        $this->db->from('comment t');
        $this->db->join('common_dict t1', 't1.ident=t.audit_status', 'left');
        $this->db->join('user t2', 't2.id=t.user_id', 'left');
        $config['total_rows'] = $this->db->count_all_results(NULL, FALSE);
        $config['per_page'] = config_item('my_per_page');
        $config['cur_page'] = $page;
        $this->pagination->initialize($config);
        $this->db->order_by('t.create_time desc,t.id desc');
        $this->db->limit($config['per_page'], ($page - 1) * $config['per_page']);
        $res['list'] = $this->db->get()->result_array();
        $res['pagination'] = $this->pagination->create_ajax_links();
        $res['total'] = $config['total_rows'];

        return $res;
    }

    //修改
    public function update($id = '')
    {
        $this->db->select('t.*');
        $this->db->select('t1.username');
        $this->db->from('comment t');
        $this->db->join('user t1', 't1.id=t.user_id', 'left');
        $this->db->where('t.id', $id);
        $res = $this->db->get()->row_array();

        return $res;
    }

    //保存
    public function save($post = array())
    {
        if ($post['id']) {
            $bool = $this->db->where('id', $post['id'])->update('comment', $post['vals']);
        } else {
            $bool = $this->db->insert('comment', $post['vals']);
        }

        return $bool;
    }

    //获取状态
    public function audit_status()
    {
        $this->db->from('common_dict t');
        $this->db->join('common_dict t1', 't1.id=t.pid and t1.ident="audit_status"', 'left');
        $res = $this->db->get()->result_array();

        return $res;
    }

}