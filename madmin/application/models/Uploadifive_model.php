<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/9/6
 * Time: 23:06
 */
class Uploadifive_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    //将上传的文件信息写入到数据库
    public function save($vals = array())
    {
        $this->db->insert('uploads', $vals);
        $insert_id = $this->db->insert_id();
        return $insert_id;
    }

}