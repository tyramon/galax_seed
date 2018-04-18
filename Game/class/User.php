<?php
/**
 * Created by PhpStorm.
 * User: webuser1801
 * Date: 18/04/2018
 * Time: 14:19
 */

class User
{
    private $_id;
    private $_login;
    private $_password;
    private $_email;
    private $_registration_date;
    private $_game_count;
    private $_victory_count;
    private $_avatar;

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->_id;
    }

    /**
     * @param mixed $id
     */
    public function setId($id)
    {
        $this->_id = $id;
    }

    /**
     * @return mixed
     */
    public function getLogin()
    {
        return $this->_login;
    }

    /**
     * @param mixed $login
     */
    public function setLogin($login)
    {
        $this->_login = $login;
    }

    /**
     * @return mixed
     */
    public function getPassword()
    {
        return $this->_password;
    }

    /**
     * @param mixed $password
     */
    public function setPassword($password)
    {
        $this->_password = $password;
    }

    /**
     * @return mixed
     */
    public function getEmail()
    {
        return $this->_email;
    }

    /**
     * @param mixed $email
     */
    public function setEmail($email)
    {
        $this->_email = $email;
    }

    /**
     * @return mixed
     */
    public function getRegistrationDate()
    {
        return $this->_registration_date;
    }

    /**
     * @param mixed $registration_date
     */
    public function setRegistrationDate($registration_date)
    {
        $this->_registration_date = $registration_date;
    }

    /**
     * @return mixed
     */
    public function getGameCount()
    {
        return $this->_game_count;
    }

    /**
     * @param mixed $game_count
     */
    public function setGameCount($game_count)
    {
        $this->_game_count = $game_count;
    }

    /**
     * @return mixed
     */
    public function getVictoryCount()
    {
        return $this->_victory_count;
    }

    /**
     * @param mixed $victory_count
     */
    public function setVictoryCount($victory_count)
    {
        $this->_victory_count = $victory_count;
    }

    /**
     * @return mixed
     */
    public function getAvatar()
    {
        return $this->_avatar;
    }

    /**
     * @param mixed $avatar
     */
    public function setAvatar($avatar)
    {
        $this->_avatar = $avatar;
    }

}