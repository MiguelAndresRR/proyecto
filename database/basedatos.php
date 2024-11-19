<?php
    class DataBase{

public static function connect (){
    $db = new mysql('localhost','root','','proyecto');
    $db->query("SET NAMES 'utf8'");
    return $db;
    }
}