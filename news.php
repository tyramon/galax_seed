<?php
declare(strict_types=1);

$emailClient=htmlentities($_POST['email']);

function compare(array $mail, $emailClient):string
{

    foreach ($mail as $valeur)
    {
        if ($valeur === $emailClient)
        {
            $result = 'Vous êtes déjà inscrit.';
        }
        else
        {
            $result='Vous êtes bien inscrit.';
        }
    }
    return $result;
}



if (isset($_POST['email']))
{
    $emailClient=htmlentities($_POST['email']);
    if (!file_exists('email.txt'))
    {
        $fichierClient = fopen('email.txt', 'a+');
        fwrite($fichierClient, $emailClient);
        fclose($fichierClient);
    }
    else
    {
        $tableauMail = file('email.txt');
        $result=compare($tableauMail, $emailClient);

        if ($result ==='Vous êtes bien inscrit.')
        {
            $fichierClient = fopen('email.txt', 'a');
            $contenu = PHP_EOL . $emailClient;
            fwrite($fichierClient, $contenu);
            fclose($fichierClient);
            echo $result;
        }
        elseif ($result === 'Vous êtes déjà inscrit.')
        {
            echo $result;
        }
    }
}

?>
<html>

<body>

<form action="" method="POST" >
    <label for="email">email</label>
    <input type="text" id="email" name="email" >
    <input value="go" type="submit">


</form>

</body>

</html>


