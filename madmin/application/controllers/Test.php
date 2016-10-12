<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/9/27
 * Time: 11:13
 */
class Test extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        // 正确的抛出异常
        try {
            if (file_exists('test_try_catch.php')) {
                require ('test_try_catch.php');
            } else {
                throw new Exception('file is not exists');
            }
        } catch (Exception $e) {
            //var_dump($e);
            echo $e->getMessage();
        }

    }
}