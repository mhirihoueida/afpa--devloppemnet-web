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
                <li class="nav-item">
                    <a class="nav-link" href="tableau_c.php">Tableau</a>
                </li>
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
<?php    
        //include "hautpage.php";
        $requete = "SELECT * FROM produits";
        $requete01 = "SELECT * FROM produits ";
        $result = $db->query($requete01);
        
        
    ?>


    <table class="table table-striped table-bordered container-fluid col-lg-8">
        <thead>
            <tr>
                <th scope="col">Photo</th>
                <th scope="col">ID</th>
                <th scope="col">Référence</th>
                <th scope="col">Libell&eacute;</th>
                <th scope="col">Prix</th>
                <th scope="col">Stock</th>
                <th scope="col">Couleur</th>
                <th scope="col">Ajout</th>
                <th scope="col">Modif</th>
                <th scope="col">Bloqué</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $nbLigne = $result->rowCount(); 
            if ($nbLigne >1){
             while ($row = $result->fetch(PDO::FETCH_OBJ)) {?>
              <tr>
                <th scope="row" class="table-warning"><img src="images/<?php echo $row->pro_id.".".$row->pro_photo;?>" width="75"></th>
                <td ><?php echo $row->pro_id;?></td>
                <td ><?php echo $row->pro_ref;?></td>
                <td class="table-warning"><a class="nav-link" href="details_c.php?pro_id=<?php echo $row->pro_id?>"><?php echo $row->pro_libelle;?></a></td>
                <td ><?php echo $row->pro_prix;?></td>
                <td ><?php echo $row->pro_stock;?></td>
                <td ><?php echo $row->pro_couleur;?></td>
                <td ><?php echo $row->pro_d_ajout;?></td>
                <td ><?php echo $row->pro_d_modif;?></td>
                
                <?php
                if ( $row -> pro_bloque > 0 ) {echo  "<th>"."BLOQUE" . "</th>" ;} else { echo "<th>" ."" . "</th>" ;}
             }
                $result->closeCursor();
               ?>
             </tr>
             <?php
             }
            ?>
           
        </tbody>
    </table>
    <?php 
    require "piedpage.php";
    ?>
</body>

</html>