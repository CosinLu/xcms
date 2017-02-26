<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:12
 */
class Uploads_model extends MY_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    //获得列表
    public function get_list()
    {
        $key = $this->input->post('key');
        $page = ($this->input->post('page')) ?: 1;
        $this->db->from('uploads');
        if ($key != '') {
            $this->db->like('name', $key);
        }
        $config['total_rows'] = $this->db->count_all_results('', FALSE);
        $config['per_page'] = MYPERPAGE;
        $config['cur_page'] = $page;
        $this->pagination->initialize($config);
        $this->db->order_by('id desc');
        $this->db->limit($config['per_page'], ($page - 1) * $config['per_page']);
        $data['list'] = $this->db->get()->result_array();
        $data['pagination'] = $this->pagination->create_ajax_links();
        $data['total'] = $config['total_rows'];
        return $data;
    }

    //更新
    public function update()
    {
        $id = $this->input->get('id');
        $this->db->where('id', $id);
        $res = $this->db->get('uploads')->row_array();
        return $res;
    }

    //保存
    public function save()
    {
        $id = $this->input->post('id');
        $image = $this->input->post('image');
        $url = $this->input->post('url');
        $vals = array(
            'name' => $this->input->post('name'),
            'image' => (!empty($image)) ? implode(',', $image) : '',
            'url' => ($url) ? $url : prep_url($url),
            'display' => $this->input->post('display'),
            'remark' => $this->input->post('remark'),
            'sort' => $this->input->post('sort')
        );
        if ($id) {
            $bool = $this->db->where('id', $id)->update('uploads', $vals);
        } else {
            $bool = $this->db->insert('uploads', $vals);
        }
        return $bool;
    }

}