<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller
{

    public function index()
    {
        $this->load->view('welcome_message');
    }

    public function apisign($Arr, $Key)
    {
        $Arr2 = array();
        foreach ($Arr as $key => $value) {
            array_push($Arr2, $key . '=' . urlencode($value));
        }
        sort($Arr2);
        $Str = '';
        $Str = implode('&', $Arr2);
        $Str = md5($Str . $Key);
        return $Str;
    }

    public function send_post()
    {
        $key = 'dongfangjiguang';
        $arr = array(
            'template_id' => '10580',
            'template_para_schoolname' => '人大附中',
            'template_para_schoolurl' => 'http://tuiti.cn/',
            'mobilenum' => '80023',
            'tellfrom' => '18810622636',
            'textqianming' => '赛通'
        );
        $encodeKey = $this->apisign($arr, $key);

        $url = 'http://30.api.yunhuatong.com/api/sendtongzhi/';
        $post_data = array_merge($arr, array('key' => $encodeKey));

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
        $data = curl_exec($ch);
        curl_close($ch);
        var_dump($data);
        die;
    }
}
