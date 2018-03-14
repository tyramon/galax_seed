<?php

declare(strict_types=1);
session_start();

$erreur='';

if (isset($_GET['inscription']))
{
    header("location: galax_inscription.php");
    exit;
}

if (!isset($_SESSION['espaceMembre']['utilisateurAutorise']))
{
    $_SESSION['espaceMembre']['utilisateurAutorise']=array();
}

if (!isset($_SESSION['espaceMembre']['clientConnecte']))
{
    $_SESSION['espaceMembre']['clientConnecte'] = array();
}


if (isset($_POST['pseudo']) && isset($_POST['password']))
{
    if (empty($_POST['pseudo']) || empty($_POST['password']))
    {
        $erreur = 'Veuillez renseigner les 2 champs du formulaire.';
    }
    else
    {
        $pseudo=htmlspecialchars($_POST['pseudo']);
        $password=htmlspecialchars($_POST['password']);

        // ici
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
    <title>Document</title>
</head>

<body>

<h1>Page de connexion</h1>

<p>Veuillez renseigner les champs suivants :</p>

<form method="post" action="">
    <label for="pseudo">Votre pseudo : </label><input type="text" name="pseudo" id="pseudo">
    <label for="password">Votre mot de passe : </label><input type="password" name="password" id="password">
    <input type="submit" value="Connexion">
</form>

<?php if (!empty($erreur))
{
    echo $erreur;
}
?>

<p>Pour vous inscrire, <a type="button" href="?inscription">Cliquez ici</a></p>

</body>
//auteur Shib4lba le supreme
</html>
