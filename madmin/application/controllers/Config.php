<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/8/25
 * Time: 16:12
 */
class Config extends MY_Controller
{
    protected $config_group_id;

    public function __construct()
    {
        parent::__construct();
        $this->load->model('config_model');
        $this->config_group_id = $this->input->get('config_group_id');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['save_url'] = site_url('config/save?sys_cid=' . $this->sys_cid . '&config_group_id=' . $this->config_group_id);
        $url['save_btn'] = $this->sys_auth->set_auth(MYUPDATE, $this->col_auth, '<button type="submit" class="btn btn-default btn-primary">保存</button>');
        $this->load->vars($url);
    }

    public function index()
    {
        $data['config_group_btn'] = $this->config_group_btn();
        $data['config_item'] = $this->config_model->config_item();
        foreach ($data['config_item'] as $key => $val) {
            $data['config_item'][$key]['param_arr'] = $this->transform_param($val['param']);
            $data['config_item'][$key]['val'] = ($val['type'] == 'checkbox') ? explode(',', $val['value']) : $val['value'];
        }
        $this->load->view('config/update.html', $data);
    }

    /**
     * 转换参数
     * 转换后用于配置信息中的radio，checkbox,select
     * @param string $str 待转换字符串【格式：1|开启,0|关闭】
     * @return array
     */
    public function transform_param($str = '')
    {
        if ($str == '') return array();
        $arr = explode(',', $str);
        if (!empty($arr)) {
            foreach ($arr as $key => $val) {
                $res[$key] = explode('|', $val);
                $res[$key] = array(
                    'value' => $res[$key][0],
                    'name' => $res[$key][1]
                );
            }
        }
        return $res;
    }

    //配置组按钮组
    public function config_group_btn()
    {
        $res = $this->config_model->config_group();
        $str = '';
        //多余一个按钮时显示按钮组
        if (count($res) > 1) {
            $str .= '<div class="col-xs-10 col-xs-offset-2">';
            $str .= '<div class="btn-group">';
            foreach ($res as $key => $val) {
                if ($this->config_group_id == '') {
                    $active = ($key == 0) ? 'active' : '';
                } else {
                    $active = ($val['id'] == $this->config_group_id) ? 'active' : '';
                }
                $str .= '<a href="' . site_url('config?sys_cid=' . $this->sys_cid . '&config_group_id=' . $val['id']) . '" class="btn btn-default ' . $active . '">' . $val['name'] . '</a>';
            }
            $str .= '</div>';
            $str .= '</div>';
        }
        return $str;
    }

    //保存
    public function save()
    {
        $rows = $this->config_model->save();
        $this->sys_log->insert($this->section_name, '2', 1);//日志
        if ($rows) {
            $this->prompt->success('操作成功！', site_url('config?sys_cid=' . $this->sys_cid . '&config_group_id=' . $this->config_group_id));
        } else {
            $this->prompt->error('操作失败！', site_url('config?sys_cid=' . $this->sys_cid . '&config_group_id=' . $this->config_group_id));
        }
    }

}