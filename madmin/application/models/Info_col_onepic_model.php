<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:12
 */
class Info_col_onepic_model extends MY_Model
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
        $this->db->select('t.id,t.name');
        $this->db->select('t1.url,t1.remark');
        $this->db->select('t2.full_path');
        $this->db->from('info_col as t');
        $this->db->join('info_col_onepic as t1', 't1.cid=t.id', 'left');
        $this->db->join('uploads as t2', 't2.id=t1.image', 'left');
        if ($key != '') {
            $this->db->like('t.name', $key);
        }
        $this->db->where('t.pic', 'onepic');
        $config['total_rows'] = $this->db->count_all_results('', FALSE);
        $config['per_page'] = MYPERPAGE;
        $config['cur_page'] = $page;
        $this->pagination->initialize($config);
        $this->db->order_by('t.sort asc,t.id asc');
        $this->db->limit($config['per_page'], ($page - 1) * $config['per_page']);
        $data['list'] = $this->db->get()->result_array();
        $data['pagination'] = $this->pagination->create_ajax_links();
        $data['total'] = $config['total_rows'];
        return $data;
    }

    //更新
    public function update()
    {
        $cid = $this->input->get('cid');
        $this->db->select('t.id,t.name');
        $this->db->select('t1.*');
        $this->db->from('info_col as t');
        $this->db->join('info_col_onepic as t1', 't1.cid=t.id', 'left');
        $this->db->where('t.id', $cid);
        $res = $this->db->get()->row_array();
        return $res;
    }

    //保存
    public function save()
    {
        $image = $this->input->post('image');
        $url = $this->input->post('url');
        $vals = array(
            'cid' => $this->input->post('cid'),
            'image' => (!empty($image)) ? implode(',', $image) : '',
            'url' => ($url) ? $url : prep_url($url),
            'remark' => $this->input->post('remark')
        );
        $bool = $this->db->replace('info_col_onepic', $vals);
        return $bool;
    }

}