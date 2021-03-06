<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="utf-8" />
    <title>jarditou</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

</head>
<?php    
        require "connexion_bdd.php"; 
        $db = connexionBase(); 
        ?>

<body>
    <header>
        <div class="d-sm-none d-lg-block">
            <div class="row">
                <div class="col-8">
                    <img src="images/jarditou_logo.jpg" alt="jarditou_logo" width="150">
                </div>
                <div class="col-4">
                    <h2 class="text-center">Tout le jardin</h2>
                </div>
              
            </div>
        </div>
    </header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Jarditou.com</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <li class="nav-item active">
                    <a class="nav-link" href="index.php">Acceuil<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item "></li>
                    <a class="nav-link" href="form_ident.php">Identification</a>
                    </li>
                    <li class="nav-item "></li>
                    <a class="nav-link" href="form_inscription.php">Inscription</a>
                    </li>
                <!--<li class="nav-item">
                    <a class="nav-link" href="tableau.php">Tableau</a>
                </li>-->
                <li class="nav-item">
                    <a class="nav-link" href="contact.php">Contact</a>
                </li>
            </ul>
            
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="text" placeholder="Votre promotion">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Rechercher</button>
            </form>
        </div>
    </nav>
    <img src="images/promotion.jpg" alt="promotion" width="100%">
    <div class="row shadow p-0 mb-3 bg_body rounded" style="margin:auto">
        <div class="col-lg-8 fs-5 col-xs-12">
            <article>
                <h2>l'entreprise</h2>
                <p style="font-size: 17px;">Notre entreprise familiale met tous son savoir-faire &agrave; votre disposition dans le domaine du jardin et du paysagisme.</p>
                <p style="font-size: 17px;">Cr&eacute;&eacute;e il y a 70 ans, notre entreprise vend fleurs, arbustes, mat&eacute;riel &agrave; main et motoris&eacute;s.</p>
                <p style="font-size: 17px;">Implant&eacute;s &agrave; Amiens, nous intervenons dans tout le d&eacute;partement de la Somme:Albert, Doullens, P&eacute;ronne, Abbville, Corbie</p>
            </article>
            <article>
                <h2>Qualit&eacute;</h2>
                <p style="font-size: 17px;">Nous mettons &agrave; votre disposition un service personnalis&eacute;, avec 1 seul interlocuteur durant tout votre projet.</p>
                <p style="font-size: 17px;">Vous serez s&#232;duit par expertise, nos comp&#232;tences et notre s&#232;rieux</p>
            </article>
            <article>
                <h2>Devis gratuit</h2>
                <p style="font-size: 17px;">Vous pouvez bien s&ucirc;r contacter pour de plus amples informations ou pour une demande d'intervention. Vous souhaitez un devis? Nous vous le r&#232;alisons gratuitement.</p>
            </article>
        </div>
        <div class="col-lg-4 bg-warning col-xs-12 px-0">
            <p class="fs-3 text-center"> [COLONE DROITE]</p>
        </div>
    </div>
   <?php 
   require "piedpage.php";
   ?>
