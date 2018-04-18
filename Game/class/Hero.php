<?php
/**
 * Created by PhpStorm.
 * User: webuser1801
 * Date: 18/04/2018
 * Time: 14:21
 */

class Hero
{
    private $_id;
    private $_hp;
    private $_mana_pool;
    private $_name;
    private $_illustration;

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
    public function getHp()
    {
        return $this->_hp;
    }

    /**
     * @param mixed $hp
     */
    public function setHp($hp)
    {
        $this->_hp = $hp;
    }

    /**
     * @return mixed
     */
    public function getManaPool()
    {
        return $this->_mana_pool;
    }

    /**
     * @param mixed $mana_pool
     */
    public function setManaPool($mana_pool)
    {
        $this->_mana_pool = $mana_pool;
    }

    /**
     * @return mixed
     */
    public function getName()
    {
        return $this->_name;
    }

    /**
     * @param mixed $name
     */
    public function setName($name)
    {
        $this->_name = $name;
    }

    /**
     * @return mixed
     */
    public function getIllustration()
    {
        return $this->_illustration;
    }

    /**
     * @param mixed $illustration
     */
    public function setIllustration($illustration)
    {
        $this->_illustration = $illustration;
    }

}