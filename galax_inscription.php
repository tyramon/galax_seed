<?php

declare(strict_types=1);
session_start();

$msg='';
$msgClass='';

if (isset($_GET['retour']))
{
    header("location: galax_compte.php");
    exit;
}

if (!isset($_SESSION['espaceMembre']['nouveauInscrit']))
{
    $_SESSION['espaceMembre']['nouveauInscrit']=array();
}


if (!isset($_SESSION['espaceMembre']['clientConnecte']))
{
    $_SESSION['espaceMembre']['clientConnecte'] = array();
}

if (isset($_POST['identifiant']) && isset($_POST['passe']) && isset($_POST['confirm']) && isset($_POST['mail']))
{
    if (empty($_POST['identifiant']) || empty($_POST['passe']) || empty($_POST['confirm']) || empty($_POST['mail']))
    {
        $msg='Veuiller renseigner tous les champs du formulaire.';
        $msgClass='erreur';
    }
    else
    {
        if ($_POST['passe'] !== $_POST['confirm'])
        {
            $msg='Votre mot de passe et sa confirmation ne sont pas identiques.';
            $msgClass='erreur';
        }
        else
        {
            $identifiant=htmlspecialchars($_POST['identifiant']);
            $passe=htmlspecialchars($_POST['passe']);
            $mail=htmlspecialchars($_POST['mail']);

            $bdd = new PDO('mysql:host=localhost;dbname=galax_seed;charset=utf8', 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));

            $req = $bdd->prepare('INSERT INTO user ( `u_id`, `u_identifiant`, `u_passe`, `u_mail` ) 
                                    VALUES (:id, :identifiant, :passe, :mail)');
            $req->execute(array(
                'id' => NULL,
                'identifiant' => $identifiant,
                'passe' => password_hash($passe, PASSWORD_DEFAULT),
                'mail' => $mail
                ));
            $msg = 'Vous etes inscrit!!!';
            $msgClass='succes';

            // verifier les doublons d'identifiant
            // con
        }
    }
}

?>

<!doctype html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Inscription Galaxseed</title>
</head>
<body>

<h1>Page d'incription</h1>

<p>Renseigner les champs suivants: </p>

<div>
    <form method="post" action="">
        <label for="identifiant">Votre pseudo : </label><input type="text" name="identifiant" id="identifiant" value=""><br/>
        <label for="passe">Votre mot de passe : </label><input type="password" name="passe" id="passe" value=""><br/>
        <label for="confirm">Confirmer votre mot de passe : </label><input type="password" name="confirm" id="confirm" value=""><br/>
        <label for="mail">Votre mail : </label><input type="text" name="mail" id="mail" value=""><br/>
        <input type="submit" value="S'inscrire">
    </form>
</div>
<?php if(!empty($msg)){
    echo '<div class="' . $msgClass . '">' . $msg . '</div>';
} ?>


<a type="button" href="?retour">RETOUR à la page de connexion</a>

</body>
</html>
