<<<<<<< HEAD
<?php
/**
 * Created by PhpStorm.
 * User: webuser1801
 * Date: 18/04/2018
 * Time: 14:20
 */

class HeroManager
{

}
=======
<?php
/**
 * Created by PhpStorm.
 * User: webuser1801
 * Date: 18/04/2018
 * Time: 14:20
 */

class HeroManager
{
    private $_pdo;

    public function initHero(){

    }

    public function killHero(){

    }

    /**
     * @return mixed
     */
    public function getPdo()
    {
        return $this->_pdo;
    }

    /**
     * @param mixed $pdo
     */
    public function setPdo($pdo)
    {
        $this->_pdo = $pdo;
    }
}
>>>>>>> origin/dev
