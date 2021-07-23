/* Exercice 2 : création d'une procédure stockée avec un paramètre en entrée

Créer la procédure stockée Lst_Rush_Orders, qui liste les commandes ayant le libelle "commande urgente"*/
DELIMITER $$
CREATE DEFINER=`mhirihoueida`@`localhost` PROCEDURE `Lst_Rush_Orders`()
    NO SQL
SELECT ord_id FROM orders
WHERE orders.ord_status ="commande urgente"$$
DELIMITER ;
