  
<?php
session_start();
?>
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
                
              
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="text" placeholder="Votre promotion">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Rechercher</button>
            </form>
        </div>
    </nav>
    <img src="images/promotion.jpg" alt="promotion" width="100%">
    
</head>



<h1 class= "text-center" >Inscription</h1>

<form id="form" name="form" method="POST" class="form-group" action="script_inscription.php" >

<label for="uti_ident" >Identifiant </label>
      <br>
        <input  class="form-control" type="text" name= "uti_ident" size="10" maxlength="10" >
      <br>

<label for="uti_mdp" >Mot de passe </label>
      <br>
        <input  class="form-control" type="text" name= "uti_mdp" size="10" maxlength="10">
      <br>
      <label for="uti_nom" >Nom </label>
      <br>
        <input  class="form-control" type="text" name= "uti_nom"  maxlength="10">
      <br>
      <label for="uti_prenom" >Prenom </label>
      <br>
        <input  class="form-control" type="text" name= "uti_prenom" size="10" maxlength="10">
      <br>
      <label for="uti_mail" class="text_center">Adresse email </label>
      <br>
        <input  class="form-control" type="text" name= "uti_mail" >
      <br>
            
      <button type="submit" class="btn btn-dark" value="Envoyer"  name='valider' id="bouton_envoi">valider </button>