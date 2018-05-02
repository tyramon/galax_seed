<?php
declare(strict_types=1);


$result='';

function compare(array $mail, string $emailClient):string
{
    $result='';
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
             $result= '<pre> Vous êtes bien inscrit. </pre>' ;
        }
        elseif ($result === 'Vous êtes déjà inscrit.')
        {
            $result= '<pre> Vous êtes déjà inscrit. </pre>';

        }
    }
}

?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GalaxSeed</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <div class="arg">
        <img src="img/LOGO.png"/>
        <div class="horloge">
            <div class="jours_heures">
                <div class="coming" id="days"><strong> 89 </strong><p>Jours</p></div>
                <div class="coming" id="hours"><strong> 5 </strong><p>Heures</p></div>
            </div>
            <div class="min_sec">
                <div class="coming" id="minutes"><strong> 51 </strong><p>Minutes</p></div>
                <div class="coming" id="seconds"><strong> 59 </strong><p>Secondes</p></div>
            </div>
        </div>
        <div class="form_message"> <?= $result ?> </div>
        <div class="form">
            <form action="" method="post">
                <input class="form_email" type="email" name="email" value="" placeholder="Inscrivez-vous à la newsletter!">
                <input class="form_submit" type="submit" name="submit" value="S'inscrire">
            </form>

        </div>

      </div>

    <div id="header">
        <div class="header" id="large-header">
            <canvas id="header-canvas" width="1245" height="894"></canvas>
        </div>
    </div>

    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/index.js"></script>
    <script src="js/horloge.js"></script>

</body>
</html>
