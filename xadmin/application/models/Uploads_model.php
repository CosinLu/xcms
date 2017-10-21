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
        $this->db->select('id,rel_path,is_image,file_ext,client_name,file_size,image_width,image_height,raw_rel_path');
        $this->db->from('uploads');
        if ($key) {
            $this->db->like('client_name', $key);
        }
        $config['per_page'] = 15;
        $config['cur_page'] = $page;
        $this->db->order_by('id desc');
        $this->db->limit($config['per_page'], ($page - 1) * $config['per_page']);
        $res = $this->db->get()->result_array();

        return $res;
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