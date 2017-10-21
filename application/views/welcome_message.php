<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>欢迎使用 XCMS</title>

    <style type="text/css">

        body {
            background-color: #fff;
            margin: 40px;
            font: 13px/20px normal Helvetica, Arial, sans-serif;
            color: #4F5155;
        }

        a {
            color: #003399;
            background-color: transparent;
            font-weight: normal;
        }

        h1 {
            color: #444;
            background-color: transparent;
            border-bottom: 1px solid #D0D0D0;
            font-size: 19px;
            font-weight: normal;
            margin: 0 0 14px 0;
            padding: 14px 15px 10px 15px;
        }

        code {
            font-family: Consolas, Monaco, Courier New, Courier, monospace;
            font-size: 12px;
            background-color: #f9f9f9;
            border: 1px solid #D0D0D0;
            color: #002166;
            display: block;
            margin: 14px 0 14px 0;
            padding: 12px 10px 12px 10px;
            -webkit-border-radius: 2px;
            -moz-border-radius: 2px;
            border-radius: 2px;;
        }

        #body {
            margin: 0 15px 0 15px;
        }

        p.footer {
            text-align: right;
            font-size: 11px;
            border-top: 1px solid #D0D0D0;
            line-height: 32px;
            padding: 0 10px 0 10px;
            margin: 20px 0 0 0;
        }

        #container {
            margin: 10px;
            border: 1px solid #D0D0D0;
            box-shadow: 0 0 8px #D0D0D0;
            -webkit-border-radius: 2px;
            -moz-border-radius: 2px;
            border-radius: 2px;
        }
    </style>
</head>
<body>

<div id="container">
    <h1>欢迎使用 XCMS</h1>

    <div id="body">
        <h3>使用说明</h3>
        <p>1.将根目录下的xcms.sql数据库导入</p>

        <p>2.修改数据库配置信息</p>
        <code>
            <p>文件 xadmin/application/config/database.php</p>
            <p>'hostname' => 'localhost',</p>
            <p>'username' => '',</p>
            <p>'password' => '',</p>
            <p>'database' => '',</p>
        </code>

        <p>3.修改基准路径</p>
        <code>
            <p>文件 xadmin/application/config/config.php</p>
            <p>$config['base_url'] ='';</p>
        </code>
        <p>初始用户名：admin，密码：123456； <a href="xadmin" target="_blank">后台入口</a></p>
        <p>其他信息请参考官方 <a href="http://codeigniter.org.cn/user_guide/" target="_blank">用户手册</a></p>
    </div>

    <p class="footer">
        <?php echo (ENVIRONMENT === 'development') ? 'CodeIgniter Version <strong>' . CI_VERSION . '</strong>' : '' ?>
    </p>
</div>

</body>
</html>