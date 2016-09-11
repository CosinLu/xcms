<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/9/5
 * Time: 18:28
 */
class Info_single_model extends MY_Model
{
    protected $info_cid;

    public function __construct()
    {
        parent::__construct();
        $this->info_cid = $this->input->get('info_cid');
    }

    public function index()
    {
        $this->db->select('t.name,t.id');
        $this->db->select('t1.remark,t1.content');
        $this->db->from('info_col as t');
        $this->db->where('t.id', $this->info_cid);
        $this->db->join('info_single as t1', 't1.info_col_id=t.id', 'left');
        $res = $this->db->get()->row_array();
        return $res;
    }

    //保存
    public function save()
    {
        $info_col_id = $this->input->post('info_col_id');
        $vals = array(
            'info_col_id' => $info_col_id,
            'remark' => $this->input->post('remark'),
            'content' => $this->input->post('content')
        );
        $bool = $this->db->replace('info_single', $vals);
        return $bool;
    }


}