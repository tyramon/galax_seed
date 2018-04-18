<?php
/**
 * Created by PhpStorm.
 * User: webuser1801
 * Date: 18/04/2018
 * Time: 14:23
 */
declare(strict_types=1)
class CardManager
{


    public function __construct()
    {
    }

    //Recupere toutes les cartes du deck
    public function initDeck( ){

    }

    // Melange les cartes
    public function mix(){

    }

    // Attaquer un joueur
    public function attack(object $cible, int $degat){

    }

    // la carte recoit des degats
    public function subis(int $degat, object $attaquant){

    }

    // la carte disparais du board
    public function discard(){

    }

    // le joueur joue sa carte sur le board
    public function invoke(object $card){

    }
}
