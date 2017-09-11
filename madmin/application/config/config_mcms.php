<?php
/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2017/9/11
 * Time: 14:16
 */

//后台配置
$config['mcms']['title'] = 'MCMS';
$config['mcms']['loading'] = '<div class="panel-body loading-hook">数据加载中...</div>';
$config['mcms']['nodata'] = '<div class="panel-body nodata-hook">暂无数据</div>';
$config['mcms']['err'] = '<div class="panel-body error-hook">数据加载失败</div>';
$config['mcms']['per_page'] = 15;
$config['mcms']['insert'] = 'insert';
$config['mcms']['del'] = 'del';
$config['mcms']['look'] = 'look';
$config['mcms']['update'] = 'update';
$config['mcms']['upload'] = '/uploads/';
$config['mcms']['thumb_width'] = 120;
$config['mcms']['thumb_height'] = 120;
$config['mcms']['thumb_marker'] = '_' . $config['mcms']['thumb_width'] . '_' . $config['mcms']['thumb_height'];