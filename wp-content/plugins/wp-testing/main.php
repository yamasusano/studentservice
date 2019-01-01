<?php
/*
Plugin Name: Test application project
Plugin URI: http://12bit.vn
Description: Used for testing purpose.
Version: 1.0.0
Author: 12bit.vn
Author URI: http://12bit.vn
License: GPLv2 or later
Text Domain: 12bit
*/

class Simple_Plugin_12Bit
{
    private static $_instance;

    public $author_name = '';

    public static function get_instance()
    {
        if (!is_null(self::$_instance)) {
            self::$_instance = new self();
        }

        return self::$_instance;
    }

    public function __construct()
    {
    }

    public function set_author_name($author_name)
    {
        $this->author_name = $author_name;
    }

    public function get_author_name()
    {
        return $this->author_name;
    }
}
