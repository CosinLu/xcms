<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/9/6
 * Time: 11:52
 */
class Uploadifive extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('uploadifive_model', 'uploadifive');
        $this->set_url();
    }

    //设置url
    public function set_url()
    {
        $url['get_list_url'] = site_url('uploadifive/get_list');
        $this->load->vars($url);
    }

    public function do_upload()
    {
        $file_obj_name = $this->input->post('fileObjName');
        $config = array(
            'upload_path' => '/uploads/' . date('Ymd', time()) . '/',//上传路径
            'allowed_types' => '*',//允许上传文件类型：*=所有类型
            'file_name' => md5(uniqid(microtime(TRUE), TRUE))//新文件名
        );
        $this->load->library('upload', $config);
        $this->upload->do_upload($file_obj_name);
        $data = $this->upload->data();
        $data['errors'] = $this->upload->display_errors();
        $data['id'] = $this->uploadifive->save($data);
        $data['file_obj_name'] = $file_obj_name;
        echo json_encode($data);
    }

    public function check_exists()
    {
        echo 0;
    }

    //在线浏览
    public function online()
    {
        $data['multi'] = $this->input->get('multi');
        $data['name'] = $this->input->get('name');
        $this->load->view('uploadifive/online.html', $data);
    }

    //上传文件列表
    public function get_list()
    {
        $data['list'] = $this->uploadifive->get_list();
        foreach ($data['list']['list'] as $key => $val) {
            /*//文件存在
            if (is_file($val['full_abs_path'])) {
                $data['list']['list'][$key]['is_file'] = 1;
                //图片文件
                if ($val['is_image']) {
                    $data['list']['list'][$key]['file'] = '<img title="' . $val['client_name'] . '" src="' . $val['full_path'] . '">';
                    $data['list']['list'][$key]['size_str_diy'] = '&nbsp;-&nbsp;' . $val['image_width'] . '×' . $val['image_height'] . 'px';
                } else {//非图片文件
                    $data['list']['list'][$key]['file'] = '<img title="' . $val['client_name'] . '" data-src="holder.js/100px80?theme=primary&text=File type is ' . $val['ext'] . '">';
                    $data['list']['list'][$key]['size_str_diy'] = '';
                }
            } else {//文件不存在
                $data['list']['list'][$key]['is_file'] = 0;
                $data['list']['list'][$key]['file'] = '<img title="' . $val['client_name'] . '"  data-src="holder.js/100px80?theme=danger&text=File does not exist">';
            }*/
            $data['list']['list'][$key]['is_file'] = 1;
            //图片文件
            if ($val['is_image']) {
                $data['list']['list'][$key]['file'] = '<img title="' . $val['client_name'] . '" src="' . $val['full_path'] . '">';
                $data['list']['list'][$key]['size_str_diy'] = '&nbsp;-&nbsp;' . $val['image_width'] . '×' . $val['image_height'] . 'px';
            } else {//非图片文件
                $data['list']['list'][$key]['file'] = '<img title="' . $val['client_name'] . '" data-src="holder.js/100px80?theme=primary&text=File type is ' . $val['ext'] . '">';
                $data['list']['list'][$key]['size_str_diy'] = '';
            }
            $data['list']['list'][$key]['size'] = format_bytes($val['size'] * 1024);
        }
        echo json_encode($data);
    }

}