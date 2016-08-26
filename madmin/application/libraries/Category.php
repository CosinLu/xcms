<?php
defined('BASEPATH') OR exit('Error');

/**
 * Author: 孟祥涵
 * Date: 2016/4/29
 * Time: 23:38
 * Email: 1056811341@qq.com
 */
class Category
{
    private $CI;
    private $tb_name;
    private $id_name;
    private $category_name;
    private $level_name;
    private $pid_name;
    private $pid;
    private $level;
    private $slevel;
    private $depth;
    private $self;

    /**
     * 构造函数
     * Category constructor.
     * @param array $arr 参数名，如果没定义，则采用默认值
     */
    public function __construct($params = array())
    {
        $this->CI =& get_instance();
        $this->tb_name = (isset($params['tb_name'])) ? $params['tb_name'] : 'sys_col';
        $this->id_name = (isset($params['id_name'])) ? $params['id_name'] : 'id';
        $this->category_name = (isset($params['category_name'])) ? $params['category_name'] : 'name';
        $this->level_name = (isset($params['level_name'])) ? $params['level_name'] : 'level';
        $this->pid_name = (isset($params['pid_name'])) ? $params['pid_name'] : 'pid';
        $this->sort_name = (isset($params['sort_name'])) ? $params['sort_name'] : 'sort';
        $this->pid = (isset($params['pid'])) ? $params['pid'] : 0;
        $this->level = (isset($params['level'])) ? $params['level'] : 1;
        $this->slevel = (isset($params['slevel'])) ? $params['slevel'] : 0;
        $this->depth = (isset($params['depth'])) ? $params['depth'] : 0;
        $this->self = (isset($params['self'])) ? $params['self'] : 0;
    }

    /**
     * 获得所有数据
     * @return mixed
     */
    public function all()
    {
        $query = $this->CI->db->get($this->tb_name);
        return $query->result_array();
    }

    /**
     * 获取指定的某条数据
     * @param array $data
     * @param string $id
     * @return array|mixed
     */
    public function one($data = array(), $id = '')
    {
        $res = array();
        if ($id == '') {
            return $res;
        }
        if (!empty($data)) {
            foreach ($data as $val) {
                if ($val[$this->id_name] == $id) {
                    $res = $val;
                    break;
                }
            }
        } else {
            $this->CI->db->where($this->id_name, $id);
            $res = $this->CI->db->get($this->tb_name)->row_array();
        }
        return $res;
    }

    /**
     * 获得下级分类
     * @param array $data
     * @param int $pid 当前分类的id即为下级分类的pid
     * @param bool $self 包含当前分类【默认FALSE】：FALSE=不包含，TRUE=包含
     * @return array
     */
    public function children($data = array(), $pid = 0, $self = FALSE)
    {
        if (empty($data)) {
            $data = $this->all();
        }
        $self_arr = array();
        $children_arr = $this->_children($data, $pid);
        if ($self) {
            foreach ($data as $val) {
                if ($val[$this->id_name] == $pid) {
                    $self_arr[] = $val;
                }
            }
        }
        return array_merge($self_arr, $children_arr);
    }

    /**
     * 递归获得下级分类
     * @param array $data
     * @param int $pid 当前分类的id即为下级分类的pid
     * @return array
     */
    public function _children($data = array(), $pid = 0)
    {
        if (empty($data)) {
            $data = $this->all();
        }
        $children_arr = array();
        $res_arr = array();

        //当前分类下的子分类
        foreach ($data as $val) {
            if ($val[$this->pid_name] == $pid) {
                //将子分类加入到数组
                $children_arr[] = $val;
            }
        }
        //如果不存在子分类则结束
        if (empty($children_arr)) {
            return array();
        }
        //排序
        usort($children_arr, array('Category', 'compare_sort'));
        foreach ($children_arr as $val) {
            $res_arr[] = $val;
            $temp = $this->_children($data, $val[$this->id_name]);
            if (!empty($temp)) {
                $res_arr = array_merge($res_arr, $temp);
            }
        }
        return $res_arr;
    }

    /**
     * 获得下级分类id
     * @param array $data
     * @param int $pid 当前分类的id即为下级分类的pid
     * @param bool $self 包含当前分类【默认FALSE】：FALSE=不包含，TRUE=包含
     * @return array
     */
    public function children_id($data = array(), $pid = 0, $self = FALSE)
    {
        $children_arr = $this->children($data, $pid, $self);
        $children_id_arr = array();
        foreach ($children_arr as $val) {
            $children_id_arr[] = $val[$this->id_name];
        }
        return $children_id_arr;
    }

    /**
     * 获得上级分类
     * @param array $data
     * @param int $id 当前分类的id
     * @param bool $self
     * @return array
     */
    public function parent($data = array(), $id = 0, $self = FALSE)
    {
        if (empty($id)) {
            return array();
        }
        if (empty($data)) {
            $data = $this->all();
        }
        $pid = 0;
        $self_arr = array();
        foreach ($data as $val) {
            if ($val[$this->id_name] == $id) {
                $pid = $val[$this->pid_name];
                $self_arr[] = $val;
                break;
            }
        }
        $parent_arr = $this->_parent($data, $pid);
        if ($self) {
            return array_merge($parent_arr, $self_arr);
        }
        return $parent_arr;
    }

    /**
     * 递归获得上级分类
     * @param array $data
     * @param int $id 当前分类的pid即为上级分类的id
     * @return array
     */
    public function _parent($data = array(), $id = 0)
    {
        if (empty($id)) {
            return array();
        }
        if (empty($data)) {
            $data = $this->all();
        }
        $parent_arr = array();
        $res_arr = array();

        //当前分类的上级分类
        foreach ($data as $val) {
            if ($val[$this->id_name] == $id) {
                $parent_arr[] = $val;
            }
        }
        //如果上级分类不存在则结束
        if (empty($parent_arr)) {
            return array();
        }
        foreach ($parent_arr as $val) {
            $res_arr[] = $val;
            $temp = $this->_parent($data, $val[$this->pid_name]);
            if (!empty($temp)) {
                $res_arr = array_merge($res_arr, $temp);
            }
        }
        return array_reverse($res_arr);
    }

    /**
     * 获得上级分类id
     * @param array $data
     * @param int $id 当前分类的id
     * @param bool $self
     * @return array
     */
    public function parent_id($data = array(), $id = 0, $self = FALSE)
    {
        $parent_arr = $this->parent($data, $id, $self);
        $parent_id_arr = array();
        foreach ($parent_arr as $val) {
            $parent_id_arr[] = $val[$this->id_name];
        }
        return $parent_id_arr;
    }


    //数组排序
    public function compare_sort($a, $b)
    {
        $a_sort = $a[$this->sort_name];
        $b_sort = $b[$this->sort_name];
        if ($a_sort == $b_sort) {
            return ($a[$this->id_name] > $b[$this->id_name]) ? 1 : -1;
        }
        return ($a_sort > $b_sort) ? 1 : -1;
    }

    /**
     * 下拉菜单项
     * @param array $data
     * @param bool $root
     * @return string
     */
    public function option($data = array(), $root = TRUE)
    {
        $str = '';
        $start_level = 1;
        $root_arr = array(
            array(
                $this->id_name => 0,
                $this->category_name => '根目录',
                $this->level_name => 0,
            )
        );
        $data = $this->children($data, 0, TRUE);
        if ($root) {
            $data = array_merge($root_arr, $data);
            $start_level = 0;
        }
        foreach ($data as $val) {
            $prefix = ($val[$this->level_name] > $start_level) ? '└─&nbsp;' : '';
            $space = str_repeat('&nbsp;&nbsp;', ($val[$this->level_name] - $start_level) * 2);
            $str .= '<option value="' . $val[$this->id_name] . '">' . $space . $prefix . $val[$this->category_name] . '</option>';
        }
        return $str;
    }

    public function insert_option($id = 0, $data = array(), $root = TRUE)
    {
        $str = '';
        $start_level = 1;
        $root_arr = array(
            array(
                $this->id_name => 0,
                $this->category_name => '根目录',
                $this->level_name => 0,
            )
        );
        $data = $this->children($data, 0, TRUE);
        if ($root) {
            $data = array_merge($root_arr, $data);
            $start_level = 0;
        }
        foreach ($data as $val) {
            $prefix = ($val[$this->level_name] > $start_level) ? '└─&nbsp;' : '';
            $space = str_repeat('&nbsp;&nbsp;', ($val[$this->level_name] - $start_level) * 2);
            //选中
            $selected = ($val[$this->id_name] == $id) ? 'selected' : '';
            $str .= '<option value="' . $val[$this->id_name] . '" ' . $selected . '>' . $space . $prefix . $val[$this->category_name] . '</option>';
        }
        return $str;
    }

    public function update_option($id = 0, $pid = 0, $data = array(), $root = TRUE)
    {
        $str = '';
        $start_level = 1;
        $root_arr = array(
            array(
                $this->id_name => 0,
                $this->category_name => '根目录',
                $this->pid_name => -1,
                $this->level_name => 0,
            )
        );
        $data = $this->children($data, 0, TRUE);
        if ($root) {
            $data = array_merge($root_arr, $data);
            $start_level = 0;
        }
        //获取当前分类的所有下级
        $children_id = $this->children_id($data, $id, TRUE);
        //var_dump($children_id);
        foreach ($data as $val) {
            $prefix = ($val[$this->level_name] > $start_level) ? '└─&nbsp;' : '';
            $space = str_repeat('&nbsp;&nbsp;', ($val[$this->level_name] - $start_level) * 2);
            //选中
            $selected = ($val[$this->id_name] == $pid) ? 'selected' : '';
            //禁止选择
            $disabled = (in_array($val[$this->id_name], $children_id)) ? 'disabled' : '';
            $str .= '<option value="' . $val[$this->id_name] . '" ' . $selected . ' ' . $disabled . '>' . $space . $prefix . $val[$this->category_name] . '</option>';
        }
        return $str;
    }

    /**
     * 获取下级url
     * @param array $data 初始数据
     * @return mixed
     */
    public function children_url($data = array())
    {
        if (empty($data)) {
            $data = $this->all();
        }
        $children_all = $this->children($data, 0);
        $children = array();
        foreach ($children_all as $key => $val) {
            if ($val[$this->pid_name] == 0) {
                $children[$key] = $this->children($data, $val[$this->id_name], TRUE);
                foreach ($children[$key] as $val) {
                    if ($val['dir'] OR $val['ctrl'] OR $val['method']) {
                        $dir = ($val['dir']) ? $val['dir'] . '/' : '';
                        $ctrl = ($val['ctrl']) ? $val['ctrl'] . '/' : '';
                        $method = ($val['method']) ? $val['method'] . '/' : '';
                        $param = ($val['param']) ? '?sys_cid=' . $val['id'] . '&' . $val['param'] : '?sys_cid=' . $val['id'];
                        $url[$key] = site_url($dir . $ctrl . $method . $param);
                        break;
                    } else {
                        $url[$key] = 'javascript:;';
                    }
                }
            }
        }
        return $url;
    }

    /**
     * 新增分类
     * @param int $pid 上级分类标识
     * @param array $vals 插入的数据
     * @return mixed
     */
    public function insert($pid = 0, $vals = array())
    {
        if (empty($pid)) {
            $level = 1;
        } else {
            $res = $this->one(array(), $pid);//获得父级分类信息
            $level = $res[$this->level_name] + 1;//待写入数据的分类等级
        }
        //写入数据
        $vals[$this->level_name] = $level;
        $vals[$this->pid_name] = $pid;
        $this->CI->db->insert($this->tb_name, $vals);
        $insert_id = $this->CI->db->insert_id();
        return $insert_id;
    }

    /**
     * 更新数据
     * @param string $id 标识
     * @param string $pid_val 上级标识
     * @param array $array 更新的数据
     * @return bool
     */
    public function update($id = 0, $pid = 0, $vals = array())
    {
        if (empty($id)) {
            return FALSE;
        }
        $res = $this->one(array(), $id);//当前分类信息
        $parent_res = $this->one(array(), $pid);//上级分类信息
        $parent_level = (empty($parent_res)) ? 0 : $parent_res[$this->level_name];//上级分类等级
        $new_level = $parent_level + 1;//当前分类新等级
        $level = $res[$this->level_name];//当前分类未修改前的等级
        $differ_level = $new_level - $level;//新旧等级差
        //更新当前分类所有下级等级
        //  1.获得当前分类所有下级
        $children = $this->children(array(), $id);
        //  2.遍历修改
        foreach ($children as $val) {
            $next_new_level = $val[$this->level_name] + $differ_level;//下级的新等级
            //执行更新
            $this->CI->db->set($this->level_name, $next_new_level);
            $this->CI->db->where($this->id_name, $val[$this->id_name]);
            $this->CI->db->update($this->tb_name);
        }
        //更新当前分类等级及数据
        $vals[$this->level_name] = $new_level;
        $vals[$this->pid_name] = $pid;
        $this->CI->db->where($this->id_name, $id);
        $bool = $this->CI->db->update($this->tb_name, $vals);
        return $bool;
    }

    /**
     * 删除当前分类以及所有下级分类
     * @param int $id
     * @return bool
     */
    public function del($id = 0)
    {
        if (empty($id)) {
            return FALSE;
        }
        $children_id = $this->children_id(array(), $id, TRUE);//获得当前所有下级分类id【包括当前分类id】
        if (empty($children_id)) {
            return FALSE;
        }
        $this->CI->db->where_in($this->id_name, $children_id);
        $this->CI->db->delete($this->tb_name);
        $rows = $this->CI->db->affected_rows();
        return $rows;
    }

}