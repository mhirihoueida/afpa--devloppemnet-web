/*Créez la procédure stockée Lst_Suppliers correspondant à la requête afficher le nom des 
fournisseurs pour lesquels une commande a été passée.*/
DELIMITER $$
CREATE DEFINER=`mhirihoueida`@`localhost` PROCEDURE `Lst_Suppliers`()
    NO SQL
SELECT sup_name FROM suppliers,products
WHERE products.pro_sup_id= suppliers.sup_id$$
DELIMITER ;

/*Exécutez la commande SQL suivante pour obtenir des informations sur cette procédure stockée :
SHOW CREATE PROCEDURE Lst_suppliers; */


Procedure
sql_mode
Create Procedure
character_set_client
collation_connection
Database Collation
Lst_Suppliers
ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_...
CREATE DEFINER=`mhirihoueida`@`localhost` PROCEDUR...
utf8mb4
utf8mb4_unicode_ci
utf8mb4_0900_ai_ci