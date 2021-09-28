

<?php
include "hautpage.php";
?>



<h1>Votre formulaire a bien été envoyer</h1>
    <?php
    // normalement , il affiche la liste des clients , déja saisis à l'avance . 
    //il faut esseyer de trouver comment récolter les coordonnées des autres clients .
    echo"Votre nom : ".$nom."<br/>";
    echo"Votre prénom : ".$prenom."<br/>";
    echo"Genre : ".$_POST["genre"]."<br/>";
    echo"Votre Date de naissance :".$Dnaissance."<br/>";
    echo"Votre Emaile : ".$Email."<br/>";
    echo"Votre question : ".$votre_question."<br/>";
    echo"Le sujet choisi : ".$sujet;
    ?>

<?php require "piedpage.php";
?> 