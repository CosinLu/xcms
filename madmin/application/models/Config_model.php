<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/25
 * Time: 16:16
 */
class Config_model extends MY_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    //配置项
    public function config_item($config_group_id = '')
    {
        //默认第一个显示第一个配置组
        if ($config_group_id == '') {
            foreach ($this->config_group() as $val) {
                $config_group_id = $val['id'];
                break;
            }
        }
        $this->db->order_by('sort asc,id asc');
        $this->db->where(array(
            'config_group_id' => $config_group_id,
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
    public function save($data = array())
    {
        $rows = 1;
        $value = array();
        if (!empty($data['vals'])) {
            foreach ($data['vals'] as $key => $val) {
                $value[] = array(
                    'name' => $key,
                    'value' => (is_array($val)) ? implode(',', $val) : $val
                );
            }
            $this->db->update_batch('config', $value, 'name');
            $rows += $this->db->affected_rows();
        }
        return $rows;
    }

}