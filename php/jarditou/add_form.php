<?php 
include "hautpage.php";

        $requete = "SELECT * FROM categories";

        $result = $db->query($requete);

        // Renvoi de l'enregistrement sous forme d'un objet
        $categorie = $result->fetch(PDO::FETCH_OBJ);
       ?>
   
        <div class="container-fluid col-lg-8">
            <h1>Ajout d'un produit</h1>  
            <!--formulaire en post , qui est mis  sous controle par add_script-->

    <form class="container-fluid col-lg-12" name="ajoutProduit" id="ajout produit" method="post" action="add_script.php" enctype="multipart/form-data">
        <label for="cat_id">Nom catégorie</label>
        <select class="form-control col_8" name="cat_nom" id="cat_nom">
            <!--boucle while pour faire dérouler les nom des catégories qu 'on est partie les chercher avec pdo , dand notre base des données (on utilisant la fonction fetch (pdo : objet),à travers la varible $row .--> 
             <?php
                 while ($row = $result->fetch(PDO::FETCH_OBJ)){
                     if ($row->cat_parent != NULL){
                        echo"<option value=".$row->cat_id.">".$row->cat_nom."</option>";
                     }
                 }
            ?>
        </select>
        <div class="form-group">
            <label for="pro_ref" >Réference produit</label><input type="text" class="form-control" name="pro_ref" id="pro_ref">
            <label for="pro_libelle">Libéllé produit</label><input type="text" class="form-control" name="pro_libelle" id="pro_libelle">
            <label for="pro_description">Description produit</label><input type="text" class="form-control" name="pro_description" id="pro_description">
            <label for="pro_prix">Prix</label><input type="text" class="form-control" name="pro_prix" id="pro_prix">
            <label for="pro_stock">Quantité en stock</label><input type="number" class="form-control" name="pro_stock" id="pro_stock">
            <label for="pro_couleur">Couleur Produit</label><input type="text" class="form-control" name="pro_couleur" id="pro_couleur">
            <label for="pro_photo">Extension de la photo :</label>
                                <select class="form-control" name="pro_photo" id="pro_photo">
                                     <option>jpg</option>
                                     <option>png</option>
                                     <option>gif</option>
                                </select>
        </div>      
        Produit bloqué&nbsp&nbsp
        <div class="form-check form-check-inline">
             <label class="form-check-label" for="pro_bloque"><input class="form-check-input" type="radio" name="pro_bloque" id="pro_bloque1" value=1>bloque</label>
        </div>
        <div class="form-check form-check-inline">
            <label class="form-check-label" for="pro_bloque"><input class="form-check-input" type="radio" name="pro_bloque" id="pro_bloque2" value=0>Non bloque</label>
        </div>
        
        <br>
        <br>
        <label for="fichier">Photo :&nbsp&nbsp</label>
        <br>
        
        <input type="file" name="fichier"> 
        <br>
        <br>

        <div class="d-flex justify-content-center" name = actionProduit>
            <button class="btn btn-primary" href="tableau.php"  type="submit" name="submit" value="1" >Envoyer</button>
            <a href="tableau.php" class="btn btn-success ml-1" type="button" id="efface">Annuler</a>
        </div>
    </form>

    <br>
  <!-- La fonction isset() vérifie si une variable est définie, ce qui signifie qu'elle doit être déclarée et n'est pas NULL.

Cette fonction renvoie true si la variable existe et n'est pas NULL, sinon elle renvoie false.-->  
<!-- ici l'identification de toutes les erreurs possibles -->

<?php 
    if (isset ($_GET["erreur_ref"])){
        if (($_GET["erreur_ref"]) == 1){
            echo "Insertion qui comporte un champs qui ne doit pas etre non null";
        }
        if  (($_GET["erreur_ref"]) == 5){
            echo "Fichier non supporté";
        }
        if (($_GET["erreur_ref"]) == 3){
            echo "Valeur Numérique positive  pour le prix du produit, positive ou null pour le stock du produit";
        }
        if (($_GET["erreur_ref"]) == 4){
            echo "La référence du produit existe déjà";
        }
    }
?>
       
<br>
<?php
require "piedpage.php";
?>
    </body>