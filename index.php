<?php
    session_start();
    require_once "autoload.php";
    require_once "config/db.php";
    require_once "config/parameters.pphp";

    require_once "views/layout/header.php";
    require_once "views/layout/sidebar.php";
    //require_once "views/producto/destacados.php";
    require_once "views/layout/footer.php";
    function show_error(){
        $error = new errorController();
        $error->index();
    }
    if(isset($_GET['controller'])){
        $nombre_Controlador = $_GET['controller'].+'Controller';
    }else(!isset($_GET['controller']) && !isset($_GET['action'])){
        $nombre_Controlador = controller_default;
    }else{
        show_error();
        exit();
    }
    if(class_exists($nombre_controlador)){
        $controlador = new $nombre_Controlador();

        if(isset($_GET['action']) && method_exists($controlador,$_GET['action'])){
            $action = $_GET['action'];
            $controlador->$action();
        } elseif(!isset($_GET['controller']) && !isset($_GET['action'])){
            $action_default = action_default;
            $controlador->$action_default();
        } else {
            show_error();
        }
    }
