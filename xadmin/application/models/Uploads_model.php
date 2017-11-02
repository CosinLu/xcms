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
        $this->db->select('id,client_name,rel_path,is_image,file_ext,client_name,file_size,image_width,image_height,raw_rel_path');
        $this->db->from('uploads');
        if ($key) {
            $this->db->like('client_name', $key);
        }
        $config['total_rows'] = $this->db->count_all_results(NULL, FALSE);
        $config['per_page'] = 24;
        $config['cur_page'] = $page;
        $this->pagination->initialize($config);
        $this->db->order_by('id desc');
        $this->db->limit($config['per_page'], ($page - 1) * $config['per_page']);
        $res['pagination'] = $this->pagination->create_ajax_links();
        $res['list'] = $this->db->get()->result_array();

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
    public function del($tbname = '', $id = '', $primary = '')
    {
        $this->del_file($id);
        $this->db->where($primary, $id);
        $this->db->delete($tbname);
        $rows = $this->db->affected_rows();

        return $rows;
    }

    //批量删除
    public function batch_del($tbname = '', $id = array(), $primary = '')
    {
        $this->del_file($id);
        $this->db->where_in($primary, $id);
        $this->db->delete($tbname);
        $rows = $this->db->affected_rows();

        return $rows;
    }

    //删除文件
    public function del_file($id = '')
    {
        $this->db->select('abs_path_dir,raw_name,file_ext');
        $this->db->where_in('id', $id);
        $res = $this->db->get('uploads')->result_array();
        if (!empty($res)) {
            foreach ($res as $val) {
                $file = $val['abs_path_dir'] . $val['raw_name'] . $val['file_ext'];
                $thumb_file = $val['abs_path_dir'] . $val['raw_name'] . config_item('my_thumb_marker') . $val['file_ext'];
                if (is_file($file)) unlink($file);
                if (is_file($thumb_file)) unlink($thumb_file);
            }
        }
    }

}