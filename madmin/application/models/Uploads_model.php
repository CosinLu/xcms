<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2017/8/29
 * Time: 10:55
 */
class Uploads_model extends CI_Model
{

    //获取上传文件列表
    public function get_list($page = '', $key = '')
    {
        $page = ($page) ?: 1;
        $this->db->select('id as upl_id,full_path as upl_path,is_image as upl_image,ext as upl_ext,client_name as upl_name,size as upl_size,image_width as upl_width,image_height as upl_height');
        $this->db->from('uploads');
        if ($key) {
            $this->db->like('client_name', $key);
        }
        //$config['total_rows'] = $this->db->count_all_results('', FALSE);
        $config['per_page'] = 15;
        $config['cur_page'] = $page;
        //$this->pagination->initialize($config);
        $this->db->order_by('id desc');
        $this->db->limit($config['per_page'], ($page - 1) * $config['per_page']);
        $data['list'] = $this->db->get()->result_array();
        //$data['pagination'] = $this->pagination->create_ajax_links();
        //$data['total'] = $config['total_rows'];

        return $data;
    }

    //写入
    public function save($vals = array())
    {
        $this->db->insert('uploads', $vals);
        $insert_id = $this->db->insert_id();

        return $insert_id;
    }

    //删除
    public function del($id = '')
    {
        //删除文件
        $this->del_file($id);
        //删除数据库数据
        $this->db->where('id', $id);
        $this->db->delete('uploads');
        $rows = $this->db->affected_rows();

        return $rows;
    }

    //删除文件
    public function del_file($id = '')
    {
        $id_arr = explode(',', $id);
        $this->db->select('full_abs_path');
        $this->db->where_in('id', $id_arr);
        $res = $this->db->get('uploads')->result_array();
        if (!empty($res)) {
            foreach ($res as $val) {
                if (is_file($val['full_abs_path'])) {
                    unlink($val['full_abs_path']);
                }
            }
        }
    }

}