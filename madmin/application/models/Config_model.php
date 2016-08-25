<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/25
 * Time: 16:16
 */
class Config_model extends MY_Model
{
    protected $config_group_id;

    public function __construct()
    {
        parent::__construct();
        $this->config_group_id = $this->input->get('config_group_id');
    }

    //配置项
    public function config_item()
    {
        //默认第一个显示第一个配置组
        if ($this->config_group_id == '') {
            foreach ($this->config_group() as $val) {
                $this->config_group_id = $val['id'];
                break;
            }
        }
        $this->db->order_by('sort asc,id asc');
        $this->db->where(array(
            'config_group_id' => $this->config_group_id,
            'display' => 'show'
        ));
        $result = $this->db->get('config')->result_array();
        return $result;
    }

    //配置组
    public function config_group()
    {
        $this->db->where('display', 'show');
        $this->db->order_by('sort asc,id asc');
        $res = $this->db->get('config_group')->result_array();
        return $res;
    }

    //保存
    public function save()
    {
        $rows = 1;
        $vals = $this->input->post();
        if (!empty($vals)) {
            foreach ($vals as $key => $val) {
                $value = (is_array($val)) ? implode(',', $val) : $val;
                $this->db->where(array('name' => $key))->update('config', array('value' => $value));
                $rows += $this->db->affected_rows();
            }
        }
        return $rows;
    }

}