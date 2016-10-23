<?php

/**
 * Created by PhpStorm.
 * User: MengXianghan
 * Date: 2016/8/23
 * Time: 21:12
 */
class Sys_log_model extends MY_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    //获得列表
    public function get_list()
    {
        $start_time = $this->input->post('start_time');
        $stop_time = $this->input->post('stop_time');
        $page = ($this->input->post('page')) ?: 1;
        $this->db->select('t.*');
        $this->db->select('t1.name as status_name,t1.color as status_color');
        $this->db->select('t2.name as opera_name');
        $this->db->from('sys_log as t');
        $this->db->join('sys_dict as t1', 't1.ident=t.status', 'left');
        $this->db->join('sys_dict as t2', 't2.ident=t.opera', 'left');
        if ($start_time && $stop_time) {
            $this->db->where('time >', strtotime($start_time));
            $this->db->where('time <', strtotime($stop_time));
        }
        if ($this->session->sys_session['user_type'] == 'pro') {
            if ($this->session->sys_session['sys_manager'] == '0') {
                $this->db->where('user_id', $this->session->sys_session['user_id']);
            } else {
                $this->db->where('user_id > ', '1');
            }
        }
        $config['total_rows'] = $this->db->count_all_results('', FALSE);
        $config['per_page'] = MYPERPAGE;
        $config['cur_page'] = $page;
        $this->pagination->initialize($config);
        $this->db->order_by('t.time desc');
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
        $res = $this->db->get('sys_log')->row_array();
        return $res;
    }

    //保存
    public function save()
    {
        $id = $this->input->post('id');
        $vals = array(
            'name' => $this->input->post('name'),
            'ctrl' => $this->input->post('ctrl'),
            'sys_ctrl' => $this->input->post('sys_ctrl'),
            'remark' => $this->input->post('remark'),
            'display' => $this->input->post('display'),
            'sort' => $this->input->post('sort')
        );
        if ($id) {
            $bool = $this->db->where('id', $id)->update('sys_log', $vals);
        } else {
            $bool = $this->db->insert('sys_log', $vals);
        }
        return $bool;
    }

}