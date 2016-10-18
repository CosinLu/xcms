<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/9/6
 * Time: 23:06
 */
class Uploadifive_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    //将上传的文件信息写入到数据库
    public function save($vals = array())
    {
        $this->db->insert('uploads', $vals);
        $insert_id = $this->db->insert_id();
        return $insert_id;
    }

    //获取上传文件列表
    public function get_list()
    {
        $page = ($this->input->post('page')) ?: 1;
        $this->db->select('*');
        $this->db->from('uploads');
        $config['total_rows'] = $this->db->count_all_results('', FALSE);
        $config['per_page'] = 16;
        $config['cur_page'] = $page;
        $this->pagination->initialize($config);
        $this->db->order_by('id desc');
        $this->db->limit($config['per_page'], ($page - 1) * $config['per_page']);
        $data['list'] = $this->db->get()->result_array();
        //$data['pagination'] = $this->pagination->create_ajax_links();
        return $data;
    }

}