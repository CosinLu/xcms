<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/9/9
 * Time: 18:32
 */
class M_Session
{
    public function __construct()
    {
        if (!isset($_SESSION)) {
            session_start();
        }
    }


}