<?php
session_start();
/**
 * --------------------------------------------------
 * DB
 * --------------------------------------------------
**/
if( !defined('GENERAL')) {
  define(GENERAL, 1);
  const DB_HOST = 'localhost';
  const DB_NAME = 'galaxseed';
  const DB_LOGIN = 'root';
  const DB_PWD = '';
}
