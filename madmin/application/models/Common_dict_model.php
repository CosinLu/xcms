<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/22
 * Time: 12:40
 */
class Common_dict_model extends M_Model
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('category', array('tb_name' => 'common_dict'));
    }

    //获得列表
    public function get_list($pid = '', $key = '', $page = '', $type = '')
    {
        $this->db->from('common_dict');
        $this->db->where(array(
            'pid' => $pid
        ));
        if ($key != '') {
            $this->db->like('t.name', $key);
        }
        //非开发者禁止获取重要字典
        if ($type > 0) {
            $this->db->where(array(
                'user_type > ' => 0
            ));
        }
        $config['total_rows'] = $this->db->count_all_results('', FALSE);
        $config['per_page'] = M_PERPAGE;
        $config['cur_page'] = $page;
        $this->pagination->initialize($config);
        $this->db->order_by('sort asc,id asc');
        $this->db->limit($config['per_page'], ($page - 1) * $config['per_page']);
        $data['list'] = $this->db->get()->result_array();
        $data['pagination'] = $this->pagination->create_ajax_links();
        $data['total'] = $config['total_rows'];
        return $data;
    }

    //更新
    public function update($id = '')
    {
        $this->db->where('id', $id);
        $res = $this->db->get('common_dict')->row_array();
        return $res;
    }

    //保存
    public function save($data = array())
    {
        if ($data['id']) {
            $bool = $this->category->update($data['id'], $data['pid'], $data['vals']);
        } else {
            $bool = $this->category->insert($data['pid'], $data['vals']);
        }
        return $bool;
    }

    //数据字典类型
    public function common_dict_type()
    {
        $this->db->where('pid', 0);
        $res = $this->db->get('common_dict')->result_array();
        return $res;
    }

}