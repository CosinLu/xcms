<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:12
 */
class Uploads_model extends M_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    //获得列表
    public function get_list($key = '', $page = '')
    {
        $this->db->from('uploads');
        if ($key != '') {
            $this->db->like('client_name', $key);
            $this->db->or_like('full_path', $key);
        }
        $config['total_rows'] = $this->db->count_all_results('', FALSE);
        $config['per_page'] = M_PERPAGE;
        $config['cur_page'] = $page;
        $this->pagination->initialize($config);
        $this->db->order_by('id desc');
        $this->db->limit($config['per_page'], ($page - 1) * $config['per_page']);
        $data['list'] = $this->db->get()->result_array();
        $data['pagination'] = $this->pagination->create_ajax_links();
        $data['total'] = $config['total_rows'];
        return $data;
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

    //批量删除
    public function batch_del($tbname = '', $id = '', $primary = '')
    {
        $id_arr = explode(',', $id);
        $this->del_file($id);
        $this->db->where_in($primary, $id_arr);
        $this->db->delete($tbname);
        $rows = $this->db->affected_rows();
        return $rows;
    }

}