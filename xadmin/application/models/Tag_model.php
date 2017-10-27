<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:12
 */
class Tag_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    //获取列表
    public function get_list($key = '', $page = '')
    {
        $this->db->select('t.*');
        $this->db->select('t1.name display_name,t1.color display_color');
        $this->db->select('t2.rel_path');
        $this->db->from('tag t');
        $this->db->join('common_dict t1', 't1.ident=t.display', 'left');
        $this->db->join('uploads t2', 't2.id=t.thumb', 'left');
        if ($key != '') {
            $this->db->like('t.name', $key);
        }
        $config['total_rows'] = $this->db->count_all_results(NULL, FALSE);
        $config['per_page'] = config_item('my_per_page');
        $config['cur_page'] = $page;
        $this->pagination->initialize($config);
        $this->db->order_by('is_recommend desc,t.sort asc,t.id asc');
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
        $res = $this->db->get('tag')->row_array();

        return $res;
    }

    //保存
    public function save($post = array())
    {
        if ($post['id']) {
            $bool = $this->db->where('id', $post['id'])->update('tag', $post['vals']);
        } else {
            $bool = $this->db->insert('tag', $post['vals']);
        }

        return $bool;
    }

}