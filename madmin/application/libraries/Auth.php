<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/9/1
 * Time: 16:26
 */
class Auth
{
    protected $CI;
    protected $user_info;
    protected $tb_sys_menu;
    protected $tb_sys_menu_auth;
    protected $tb_sys_role_auth;
    protected $tb_sys_user_auth;
    protected $tb_common_dict;

    public function __construct($arr = array())
    {
        $this->CI =& get_instance();
        $this->tb_sys_menu = $this->CI->db->dbprefix . 'sys_menu';
        $this->tb_sys_menu_auth = $this->CI->db->dbprefix . 'sys_menu_auth';
        $this->tb_sys_role_auth = $this->CI->db->dbprefix . 'sys_role_auth';
        $this->tb_sys_user_auth = $this->CI->db->dbprefix . 'sys_user_auth';
        $this->tb_common_dict = $this->CI->db->dbprefix . 'common_dict';
        $this->user_info = (isset($arr['user_info'])) ? $arr['user_info'] : $this->CI->session->sys_session;
    }

    //根据权限获取系统栏目
    public function get($type = '', $id = '')
    {
        $user_type = $this->user_info['user_type'];
        //开发者
        if ($user_type == 0) {
            $sql = "SELECT
                `t`.*,
                GROUP_CONCAT(`t1`.`sys_menu_auth` ORDER BY `t1`.`sys_menu_auth` ASC) `sys_menu_auth`,
                GROUP_CONCAT(`t2`.`name` ORDER BY `t2`.`ident` ASC) `sys_menu_auth_name`";
            if ($id) {
                $sql .= ",`t3`.`sys_menu_auth_str`,`t3`.`sys_menu_id`";
            }
            $sql .= " FROM
                `{$this->tb_sys_menu}` `t`
            LEFT JOIN 
                `{$this->tb_sys_menu_auth}` `t1` ON `t1`.`sys_menu_id`=`t`.`id`
            LEFT JOIN 
                `{$this->tb_common_dict}` `t2` ON `t2`.`ident`=`t1`.`sys_menu_auth`";
            if ($id) {
                if ($type == 'role') {
                    $sql .= " LEFT JOIN (
                        SELECT
                            GROUP_CONCAT(`sys_menu_auth` ORDER BY `sys_menu_auth` ASC) `sys_menu_auth_str`,
                            `sys_menu_id`
                        FROM
                            `{$this->tb_sys_role_auth}`
                        WHERE 
                            `role_id`='{$id}'
                        GROUP BY
                            `sys_menu_id`
                    ) `t3` ON `t3`.`sys_menu_id` = `t`.`id`";
                } elseif ($type == 'user') {
                    $sql .= " LEFT JOIN (
                        SELECT
                            GROUP_CONCAT(`sys_menu_auth` ORDER BY `sys_menu_auth` ASC) `sys_menu_auth_str`,
                            `sys_menu_id`
                        FROM
                            `{$this->tb_sys_user_auth}`
                        WHERE 
                            `user_id`='{$id}'
                        GROUP BY
                            `sys_menu_id`
                    ) `t3` ON `t3`.`sys_menu_id` = `t`.`id`";
                }
            }
            $sql .= " WHERE 
                `t`.`display`='show'
            GROUP BY 
                `t`.`id`
            ORDER BY 
                `t`.`sort` ASC,`t`.`id` ASC";
        } //系统默认，超级管理员
        elseif ($user_type == 1) {
            $sql = "SELECT
                `t`.*,
                GROUP_CONCAT(`t1`.`sys_menu_auth` ORDER BY `t1`.`sys_menu_auth` ASC) `sys_menu_auth`,
                GROUP_CONCAT(`t2`.`name` ORDER BY `t2`.`ident` ASC) `sys_menu_auth_name`";
            if ($id) {
                $sql .= ",`t3`.`sys_menu_auth_str`,`t3`.`sys_menu_id`";
            }
            $sql .= " FROM
                `{$this->tb_sys_menu}` `t`
            LEFT JOIN 
                `{$this->tb_sys_menu_auth}` `t1` ON `t1`.`sys_menu_id`=`t`.`id`
            LEFT JOIN 
                `{$this->tb_common_dict}` `t2` ON `t2`.`ident`=`t1`.`sys_menu_auth` ";
            if ($id) {
                if ($type == 'role') {
                    $sql .= " LEFT JOIN (
                        SELECT
                            GROUP_CONCAT(`sys_menu_auth` ORDER BY `sys_menu_auth` ASC) `sys_menu_auth_str`,
                            `sys_menu_id`
                        FROM
                            `{$this->tb_sys_role_auth}`
                        WHERE 
                            `role_id`='{$id}'
                        GROUP BY
                            `sys_menu_id`
                    ) `t3` ON `t3`.`sys_menu_id` = `t`.`id`";
                } elseif ($type == 'user') {
                    $sql .= " LEFT JOIN (
                        SELECT
                            GROUP_CONCAT(`sys_menu_auth` ORDER BY `sys_menu_auth` ASC) `sys_menu_auth_str`,
                            `sys_menu_id`
                        FROM
                            `{$this->tb_sys_user_auth}`
                        WHERE 
                            `user_id`='{$id}'
                        GROUP BY
                            `sys_menu_id`
                    ) `t3` ON `t3`.`sys_menu_id` = `t`.`id`";
                }
            }
            $sql .= " WHERE 
                `t`.`display`='show'
            AND
                `t`.`user_type`='pro'
            GROUP BY 
                `t`.`id`
            ORDER BY 
                `t`.`sort` ASC,`t`.`id` ASC";
        } //普通管理员
        elseif ($user_type > 1) {
            $sql = "SELECT 
              *, GROUP_CONCAT(`sys_menu_auth`) `sys_menu_auth`
            FROM
                (
                    SELECT
                        `t`.*,
                        GROUP_CONCAT(`t1`.`sys_menu_auth` ORDER BY `t1`.`sys_menu_auth` ASC) `sys_menu_auth`,
                        GROUP_CONCAT(`t2`.`name` ORDER BY `t2`.`ident` ASC) `sys_menu_auth_name`";
            if ($id) {
                $sql .= ",`t3`.`sys_menu_auth_str`,`t3`.`sys_menu_id`";
            }
            $sql .= " FROM
                        `{$this->tb_sys_menu}` `t`
                    LEFT JOIN 
                        `{$this->tb_sys_role_auth}` `t1` ON `t1`.`sys_menu_id` = `t`.`id`
                    LEFT JOIN 
                        `{$this->tb_common_dict}` `t2` ON `t2`.`ident`=`t1`.`sys_menu_auth`";
            if ($id) {
                if ($type == 'role') {
                    $sql .= " LEFT JOIN (
                                SELECT
                                    GROUP_CONCAT(`sys_menu_auth` ORDER BY `sys_menu_auth` ASC) `sys_menu_auth_str`,
                                    `sys_menu_id`
                                FROM
                                    `{$this->tb_sys_role_auth}`
                                WHERE 
                                    `role_id`='{$id}'
                                GROUP BY
                                    `sys_menu_id`
                            ) `t3` ON `t3`.`sys_menu_id` = `t`.`id`";
                } elseif ($type == 'user') {
                    $sql .= " LEFT JOIN (
                                SELECT
                                    GROUP_CONCAT(`sys_menu_auth` ORDER BY `sys_menu_auth` ASC) `sys_menu_auth_str`,
                                    `sys_menu_id`
                                FROM
                                    `{$this->tb_sys_user_auth}`
                                WHERE 
                                    `user_id`='{$id}'
                                GROUP BY
                                    `sys_menu_id`
                            ) `t3` ON `t3`.`sys_menu_id` = `t`.`id`";
                }
            }
            $sql .= " WHERE
                        `t`.`display` = 'show'
                    AND 
                        `t1`.`role_id` = '{$this->user_info['role_id']}'
                    GROUP BY
                        `t`.`id`
                    UNION ALL
                    SELECT
                        `t`.*,
                        GROUP_CONCAT(`t1`.`sys_menu_auth` ORDER BY `t1`.`sys_menu_auth` ASC) `sys_menu_auth`,
                        GROUP_CONCAT(`t2`.`name` ORDER BY `t2`.`ident` ASC) `sys_menu_auth_name`";
            if ($id) {
                $sql .= ",`t3`.`sys_menu_auth_str`,`t3`.`sys_menu_id`";
            }
            $sql .= " FROM
                        `{$this->tb_sys_menu}` `t`
                    LEFT JOIN 
                        `{$this->tb_sys_user_auth}` `t1` ON `t1`.`sys_menu_id` = `t`.`id`
                    LEFT JOIN 
                        `{$this->tb_common_dict}` `t2` ON `t2`.`ident`=`t1`.`sys_menu_auth`";
            if ($id) {
                if ($type == 'role') {
                    $sql .= " LEFT JOIN (
                                SELECT
                                    GROUP_CONCAT(`sys_menu_auth` ORDER BY `sys_menu_auth` ASC) `sys_menu_auth_str`,
                                    `sys_menu_id`
                                FROM
                                    `{$this->tb_sys_role_auth}`
                                WHERE 
                                    `role_id`='{$id}'
                                GROUP BY
                                    `sys_menu_id`
                            ) `t3` ON `t3`.`sys_menu_id` = `t`.`id`";
                } elseif ($type == 'user') {
                    $sql .= " LEFT JOIN (
                                SELECT
                                    GROUP_CONCAT(`sys_menu_auth` ORDER BY `sys_menu_auth` ASC) `sys_menu_auth_str`,
                                    `sys_menu_id`
                                FROM
                                    `{$this->tb_sys_user_auth}`
                                WHERE 
                                    `user_id`='{$id}'
                                GROUP BY
                                    `sys_menu_id`
                            ) `t3` ON `t3`.`sys_menu_id` = `t`.`id`";
                }
            }
            $sql .= " WHERE
                        `t`.`display` = 'show'
                    AND 
                        `t1`.`user_id` = '{$this->user_info['user_id']}'
                    GROUP BY
                        `t`.`id`
                ) t
            GROUP BY
                `id`
            ORDER BY
                `sort` ASC,
                `id` ASC";
        }
        $res = $this->CI->db->query($sql)->result_array();
        $res = $this->CI->tree->serialize($res);

        return $res;
    }

    /**
     * 根据权限输出字符串
     *
     * @param string $initial_auth 所需权限
     * @param string $current_auth 当前拥有权限
     * @param string $have_auth_str 有权限时输出的字符串
     * @param string $no_auth_str 无权限时输出的字符串
     * @return string
     */
    public function set($initial_auth = '', $current_auth = '', $have_auth_str = '', $no_auth_str = '')
    {
        //$peferer = (isset($_SERVER['HTTP_REFERER'])) ? $_SERVER['HTTP_REFERER'] : '';
        $current_auth_arr = array_unique(explode(',', strtolower($current_auth)));
        if ($have_auth_str != '') {
            if (in_array(strtolower($initial_auth), $current_auth_arr)) {
                return $have_auth_str;
            }
        } else {
            if (!in_array(strtolower($initial_auth), $current_auth_arr)) {
                $this->CI->load->library('jump');
                $this->CI->jump->error('非法操作！', site_url('welcome/logout'));
            }
        }

        return $no_auth_str;
    }

}