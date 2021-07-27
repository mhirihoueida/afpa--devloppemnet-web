  
--REMARQUE : ON TRAVAILLE SUR LA BASE DE DONNÉES GESCOM_AFPA



 /*VUES:

Créez une vue qui affiche le catalogue produits. 
L'id,la référence et le nom des produits,
ainsi que l'id et le nom de la catégorie doivent apparaître.*/


CREATE VIEW v_pro_cate
AS
SELECT pro_id,pro_ref,pro_name,cat_id,cat_name FROM products
JOIN categories
ON products.pro_cat_id=categories.cat_id;





/* PROCÉDURES STOCKÉES:
   
Créez la procédure stockée facture qui permet d'afficher les informations nécessaires à une facture en fonction d'un numéro de commande.
Cette procédure doit sortir le montant total de la commande.(en se base sur la table orders_details pour pouvoir calculer le montant total de la commande , 
et puis on joint les autres tables en fonctions de leurs clés étrangéres )*/

DELIMITER ;;

CREATE PROCEDURE facture()
BEGIN
SELECT ord_id,ord_order_date,ord_payment_date,sum((ode_unit_price-(ode_unit_price*ode_discount/100))*ode_quantity) as total_commande,cus_id,CONCAT(cus_lastname,'  ',cus_firstname) FROM orders_details
JOIN orders
ON orders_details.ode_ord_id=orders.ord_id
JOIN customers
ON orders.ord_cus_id=customers.cus_id
group by ord_id;
END ;;

DELIMITER ;





/* TRIGGERS:

Présentez le déclencheur after_products_update demandé dans la phase 2 de la séance sur les déclencheurs.
--Créer une table commander_articles constituées de colonnes dans la base de données gescom_afpa:*/
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
--retour>>> une ligne était rajouté dans la table commander_articles avec codart(8),qte(5-3=2),date(2021-07-23).




/* TRANSACTIONS :

 La base de données ne contient actuellement que des employés en postes. 
 Il nous a demandé de rajoutée à notre base une liste des anciens collaborateurs de l'entreprise partis en retraite. 
 il faut donc ajouter une ligne dans la table posts pour distanguer  les employés à la retraite.*/

INSERT into posts (pos_libelle) VALUES ('retraité(e)');

-- modifier la poste de Madame HANAH et mettre 'retraité(e)' 
update employees set emp_pos_id = (select pos_id FROM posts WHERE pos_libelle='retraité(e)') 
WHERE emp_lastname='HANNAH' AND emp_firstname='Amity';

--Ecrire les requêtes correspondant à ces opéarations.

-- la requette pour selectionner l'employéé qui va remplacer Madame Amity HANAH:

SELECT emp_id,emp_salary,emp_enter_date, CONCAT(emp_lastname,'  ',emp_firstname) as emp_name 
FROM employees
JOIN posts on employees.emp_pos_id=posts.pos_id 
where employees.emp_enter_date =(SELECT min(emp_enter_date)
FROM employees 
JOIN shops on employees.emp_sho_id=shops.sho_id 
where emp_pos_id=14 AND sho_city = 'Arras' );

-- requette pour chamger la poste de de l'employé de pépiniériste a manager:
UPDATE employees
SET emp_pos_id = '2'
WHERE emp_id = 10
-- modifier le salare de l'employé qui va remplaser Madame Amity/
UPDATE employees
SET emp_superior_id = 10
WHERE emp_pos_id = 14 AND emp_sho_id = 2






--Ecrire la transaction

   
START TRANSACTION; 
-- ajouter poste 'retraité(e)' à la table poste et modifier la poste de madame HANNAH :
INSERT INTO posts (pos_libelle) VALUES ('retraité(e)');
update employees set emp_pos_id = (select pos_id FROM posts WHERE pos_libelle='retraité(e)') WHERE emp_lastname='HANNAH' AND emp_firstname='Amity';
--recuperer la poste id de manager:
SET @emp_pos_idd = (select pos_id FROM posts WHERE pos_libelle ='Manager(/geuse)');
--recupere l'identifiant de l'employer qui va remplacer madame HANNAH:
set @emp_idd=(SELECT emp_id FROM employees JOIN posts on employees.emp_pos_id=posts.pos_id where employees.emp_enter_date =(SELECT min(emp_enter_date)FROM employees JOIN shops on employees.emp_sho_id=shops.sho_id where emp_pos_id=14 AND sho_city = 'Arras' )) 
-- modifier le poste de l'employer qui va remplacer madame HANNAH de Pépiniériste à Manager:
UPDATE employees SET emp_pos_id  =@emp_pos_idd where emp_id= @emp_idd;
--(dans notre cas ,UPDATE employees SET emp_pos_id = '2' WHERE emp_id = 10)

--modifier le salaire de cet employé: 
UPDATE employees SET emp_salary=emp_salary*1.05 where emp_id= @emp_idd;

--anciens collègues pépiniéristes passent sous sa direction de cet employé:
update employees SET emp_superior_id=@emp_pos_idd WHERE emp_pos_id =@emp_idd WHERE emp_pos_id = (select pos_id from posts  where pos_libelle = 'Pépiniériste' ) and emp_sho_id=(select sho_id from shops WHERE sho_city='Arras');
--(dans notre cas de base de données gescom , UPDATE employees SET emp_superior_id = 10 WHERE emp_pos_id = 14 AND emp_sho_id = 2)
commit



        
        
        
        
        
        


