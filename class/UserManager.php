<?php
declare(strict_types=1);

class UserManager extends PDOManager
{
    private $pdo;

    public function __construct()
    {
        $this->pdo=parent::getInstance()->getPDO();
    }

    public function connexion(){

    }

    public function newUser(){

    }

    public function delete(){

    }

    public function edit(){

    }
}