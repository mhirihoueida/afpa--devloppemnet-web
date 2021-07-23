/*Créer une table commander_articles constituées de colonnes dans la base de données gescom_afpa:*/
CREATE table commander_articles(
    codart INT  NOT NULL AUTOINCRIMENT PRIMARY KEY,
    qte int ,
    date date not null,
    FOREIGN KEY(codart) REFERENCES products(pro_id)
)



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


--LES TESTS 



UPDATE products
SET pro_stock = 6
WHERE pro_id = 8;

SELECT *
FROM commander_articles;
--retour>>>MySQL a retourné un résultat vide (c'est à dire aucune ligne).

UPDATE products
SET pro_stock = 4
WHERE pro_id = 8;

SELECT *
FROM commander_articles;
--retour >>> une ligne était rajouté dans le table commander_articles avec codart(8),qte(5-4=1),date(2021-07-23)

UPDATE products
SET pro_stock = 3
WHERE pro_id = 8;

SELECT *
FROM commander_articles;
--retour>>> une ligne était rajouté dans le table commander_articles avec codart(8),qte(5-3=2),daet(2021-07-23)

        
        
        
        
        
        


