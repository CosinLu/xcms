<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:12
 */
class Customer_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    //获取列表
    public function get_list($key = '', $page = '')
    {
        $this->db->select('t.*');
        $this->db->from('customer t');
        if ($key != '') {
            $this->db->like('t.company', $key);
        }
        $config['total_rows'] = $this->db->count_all_results(NULL, FALSE);
        $config['per_page'] = config_item('my_per_page');
        $config['cur_page'] = $page;
        $this->pagination->initialize($config);
        $this->db->order_by('t.sort desc,t.id desc');
        $this->db->limit($config['per_page'], ($page - 1) * $config['per_page']);
        $res['list'] = $this->db->get()->result_array();
        $res['pagination'] = $this->pagination->create_ajax_links();
        $res['total'] = $config['total_rows'];

        return $res;
    }

    //修改
    public function update($id = '')
    {
        $this->db->where('id', $id);
        $res = $this->db->get('customer')->row_array();

        return $res;
    }

    //保存
    public function save($post = array())
    {
        if ($post['id']) {
            $this->db->where('id', $post['id'])->update('customer', $post['vals']);
            $id = $post['id'];
        } else {
            $this->db->insert('customer', $post['vals']);
            $id = $this->db->insert_id();
        }

        return $id;
    }

    //保存行业分类
    public function save_industry($post = array())
    {
        $this->db->insert('common_dict', $post);
        $id = $this->db->insert_id();

        return $id;
    }

    //获取附加信息
    public function get_additional_info($type = '', $customer_id = '')
    {
        if ($type == '') return array();

        $this->db->from("customer_{$type}");
        $this->db->where('customer_id', $customer_id);
        $this->db->order_by('sort desc,id desc');
        $res['list'] = $this->db->get()->result_array();

        return $res;
    }

    //修改附加信息
    public function update_additional_info($type = '', $id = '')
    {
        $this->db->where('id', $id);
        $res = $this->db->get("customer_{$type}")->row_array();

        return $res;
    }

    //保存附加信息
    public function save_additional_info($post = array())
    {
        if ($post['id']) {
            $bool = $this->db->where('id', $post['id'])->update("customer_{$post['type']}", $post['vals']);
        } else {
            $bool = $this->db->insert("customer_{$post['type']}", $post['vals']);
        }

        return $bool;
    }

    //删除公司及附加信息
    public function del($id = array())
    {
        //删除联系人
        $this->db->where_in('customer_id', $id)->delete('customer_contact');
        //删除备注
        $this->db->where_in('customer_id', $id)->delete('customer_remark');
        //删除基础信息
        $this->db->where_in('id', $id)->delete('customer');
        $rows = $this->db->affected_rows();

        return $rows;
    }

}