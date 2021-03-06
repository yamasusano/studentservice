<?php

class DbConnect
{
    private $host = 'localhost';
    private $dbName = 'capstone_project';
    private $user = 'admin';
    private $pass = 'Hoalac@123';
    private $port = '80';

    public function connect()
    {
        try {
            $conn = new PDO('mysql:host='.$this->host.'; dbname='.$this->dbName,
            $this->user, $this->pass, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            return $conn;
        } catch (PDOExeption $e) {
            echo 'Database Error:'.$e->getMessage();
        }
    }
}
