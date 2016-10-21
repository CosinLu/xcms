<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/10/20
 * Time: 9:48
 */
class Sys_log
{
    protected $CI;
    protected $browser;
    protected $version;
    protected $platform;
    protected $ip;
    protected $user_id;
    protected $username;

    public function __construct()
    {
        $this->CI =& get_instance();
        $this->browser = $this->CI->agent->browser();
        $this->version = $this->CI->agent->version();
        $this->platform = $this->CI->agent->platform();
        $this->ip = $this->CI->input->ip_address();
        $this->user_id = $this->CI->session->sys_session['user_id'];
        $this->username = $this->CI->session->sys_session['username'];
    }

    /**
     * 插入操作日志
     * @param string $col_name 栏目名
     * @param string $opera_code 操作：1=新增，2=修改，3=删除
     * @param int $status 状态：error=失败，success=成功
     */
    public function insert($col_name = '', $opera_code = '', $status = '')
    {
        switch ($opera_code) {
            case '1':
                $opera = 'insert';
                break;
            case '2':
                $opera = 'update';
                break;
            case '3':
                $opera = 'del';
                break;
        }
        $vals = array(
            'user_id' => $this->user_id,
            'username' => $this->username,
            'col_name' => $col_name,
            'opera' => $opera,
            'status' => ($status) ? 'success' : 'fail',
            'browser' => $this->browser,
            'version' => $this->version,
            'platform' => $this->platform,
            'hostname' => gethostbyaddr($_SERVER['REMOTE_ADDR']),
            'ip' => $this->ip,
            'time' => time()
        );
        $this->CI->db->insert('sys_log', $vals);
    }


}