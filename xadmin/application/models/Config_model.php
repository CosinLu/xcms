<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/25
 * Time: 16:16
 */
class Config_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    //配置项
    public function config_item($category = '')
    {
        //默认第一个显示第一个配置组
        if ($category == '') {
            foreach ($this->config_group() as $val) {
                $category = $val['category'];
                break;
            }
        }
        $this->db->order_by('sort asc,id asc');
        $this->db->where(array(
            'category' => $category,
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
    public function save($post = array())
    {
        $rows = 1;
        $value = array();
        if (!empty($post['vals'])) {
            foreach ($post['vals'] as $key => $val) {
                $value[] = array(
                    'variable' => $key,
                    'value' => (is_array($val)) ? implode(',', $val) : $val
                );
            }
            $this->db->update_batch('config', $value, 'variable');
            $rows += $this->db->affected_rows();
        }

        return $rows;
    }

}