<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/9/5
 * Time: 18:28
 */
class Page_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index($cid = '')
    {
        $this->db->select('t.name,t.id');
        $this->db->select('t1.*');
        $this->db->from('category t');
        $this->db->where('t.id', $cid);
        $this->db->join('page t1', 't1.cid=t.id', 'left');
        $res = $this->db->get()->row_array();

        return $res;
    }

    //保存
    public function save($post = array())
    {
        $bool = $this->db->replace('page', $post['vals']);

        return $bool;
    }


}