<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/22
 * Time: 12:40
 */
class Common_dict_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('tree');
    }

    //获取列表
    public function get_list($pid = '', $key = '', $page = '', $user_type = '')
    {
        $this->db->from('common_dict');
        $this->db->where(array(
            'pid' => $pid
        ));
        if ($key != '') {
            $this->db->like('name', $key);
        }
        //生产者禁止获取重要字典
        if ($user_type == 'pro') {
            $this->db->where(array(
                'user_type' => 'pro'
            ));
        }
        $config['total_rows'] = $this->db->count_all_results('', FALSE);
        $config['per_page'] = $this->config->item('per_page', 'mcms');
        $config['cur_page'] = $page;
        $this->pagination->initialize($config);
        $this->db->order_by('sort asc,id asc');
        $this->db->limit($config['per_page'], ($page - 1) * $config['per_page']);
        $data['list'] = $this->db->get()->result_array();
        $data['pagination'] = $this->pagination->create_ajax_links();
        $data['total'] = $config['total_rows'];

        return $data;
    }

    //修改
    public function update($id = '')
    {
        $this->db->where('id', $id);
        $res = $this->db->get('common_dict')->row_array();

        return $res;
    }

    //保存
    public function save($post = array())
    {
        if ($post['id']) {
            $bool = $this->tree->update($this->data(), 'common_dict', $post['id'], $post['vals']);
        } else {
            $bool = $this->tree->insert('common_dict', $post['vals']);
        }

        return $bool;
    }

    //字典类型
    public function common_dict_type()
    {
        $this->db->where('pid', 0);
        $res = $this->db->get('common_dict')->result_array();

        return $res;
    }

}