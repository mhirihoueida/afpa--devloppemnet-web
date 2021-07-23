/* Exercice 3 : création d'une procédure stockée avec plusieurs paramètres
Créer la procédure stockée CA_Supplier, qui pour un code fournisseur et une année entrée en paramètre, calcule et restitue le CA potentiel de ce fournisseur pour l'année souhaitée.

On exécutera la requête que si le code fournisseur est valide, c'est-à-dire dans la table suppliers*/


DELIMITER |

CREATE PROCEDURE CA_Supplier (
    p_code_fournisseurs VARCHAR(50),
    p_année VARCHAR(50),
    OUT CA INT(11)
    )

BEGIN
   SELECT SUM(orders_details.ode_unit_price * orders_details.ode_quantity) INTO CA
   FROM orders_details 
   JOIN products  on products.pro_id = orders_details.ode_pro_id
   JOIN orders  on orders.ord_id = orders_details.ode_ord_id
   WHERE p_code_fournisseurs= products.pro_id 
   AND   p_année= YEAR(orders.ord_order_date);
END |

DELIMITER ;

/*Créer une table commander_articles constituées de colonnes dans la base de données gescom_afpa:*/

CREATE TABLE `commander_articles` (
  `codart` int NOT NULL,
  `qte` int NOT NULL,
  `date` date NOT NULL
) 
ALTER TABLE `commander_articles`
  ADD PRIMARY KEY (`codart`);
COMMIT; 

/* Créer un déclencheur after_products_update sur la table products : 
la condition :lorsque le stock physique devient inférieur au stock d'alerte dans le table products,
une nouvelle ligne est insérée dans la table commander_articles 
pour tester , on prend le produit 8 (barbecue'Athos') , pour valeur de départ pro_stock_alert=5*/
 
 
 DELIMITER ;;

 CREATE TRIGGER after_products_update
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    DECLARE stock_pro int;
    DECLARE alert_stock_pro int;
    DECLARE id_pro    int;
    DECLARE new_qte int;
    DECLARE verification   varchar(50);
    SET stock_pro = NEW.pro_stock;
    SET alert_stock_pro = NEW.pro_stock_alert;
    SET id_pro = NEW.pro_id;
    IF (stock_pro < alert_stock_pro)
    THEN
        SET new_qte = alert_stock_pro - stock_pro;
        SET verification = (
            SELECT codart
            FROM commander_articles
            WHERE codart = id_pro
        );
        IF ISNULL(verification)
        THEN
            INSERT INTO commander_articles
            (codart, qte, date)
            VALUES
            (id_pro, new_qte, CURRENT_DATE());
        ELSE
            UPDATE commander_articles
            SET qte = new_qte,
            date = CURRENT_DATE()
            WHERE codart = id_pro;
        END IF;
  ELSE
  DELETE
        FROM commander_articles
        WHERE codart = id_pro;
       
    END IF;
END;;
DELIMITER ;

