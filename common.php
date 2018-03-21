<?php
declare(strict_types=1);
session_start();
require('ini.php');


/**
 * connectDB - Ouvre une connexion à une base de données MySQL
 * @param   string  $host
 *          string  $name
 *          string  $login
 *          string  $pwd
 * @return  object
**/

function connexionDB() : void {

  try {

    return new PDO('mysql:host='.DB_HOST.';dbname='.DB_NAME.';charset=utf8', DB_LOGIN, DB_PWD, array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));

  } catch (Exception $e) {
    die( $_e->getMessage() );
  }
}
