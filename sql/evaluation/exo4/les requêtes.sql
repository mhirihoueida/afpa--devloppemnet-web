---Q1 Afficher dans l'ordre alphabétique et sur une seule colonne, les noms et prénoms des employés qui ont des enfants. Présenter d'abord ceux qui en ont le plus.

SELECT  concat (emp_lastname,' ',emp_firstname) AS employé, emp_children AS NB_enfants
FROM employees
ORDER BY  emp_children DESC, emp_lastname ASC

--Q2 Y-a-t-il des clients étrangers ? Afficher leur nom, prénom et pays de résidence.

SELECT cus_lastname, cus_firstname, cus_countries_id 
FROM customers
WHERE cus_countries_id <> 'FR'

--Q3 Afficher par ordre alphabétique les villes de résidence des clients ainsi que le code (ou le nom) du pays.

SELECT cus_city, cus_countries_id,cou_name
FROM customers,countries
WHERE cus_countries_id =cou_id
ORDER BY cus_city ASC 

--Q4 Afficher le nom des clients dont les fiches ont été modifiées

SELECT cus_lastname, cus_update_date 
FROM customers
WHERE cus_update_date IS  NOT NULL

--Q5.(La commerciale Coco Merce veut consulter la fiche d'un client, mais la seule chose dont elle se souvienne est qu'il habite une ville genre 'divos'. Pouvez-vous l'aider ?

SELECT cus_id, CONCAT(cus_lastname,' ',cus_firstname),cus_city
FROM customers
WHERE cus_city  LIKE '%divos%'

--Q6. Quel est le produit dont le prix de vente est le moins cher ? Afficher le prix, l'id et le nom du produit.


SELECT pro_id, pro_name ,pro_price
FROM products
ORDER BY pro_price ASC
LIMIT 1


--Q7. Lister les produits qui n'ont jamais été vendus

SELECT pro_id,pro_ref,pro_name FROM products
where pro_id not in (select ode_pro_id from orders_details);
 

--Q8. Afficher les produits commandés par Madame Pikatchien.
/*select  pro_id, pro_ref ,pro_color , pro_name ,cus_id ,cus_lastname, ord_id , ode_id 
FROM products , customers, orders_details, orders
WHERE ord_cus_id = cus_id and cus_lastname='pikatchien'*/

SELECT pro_id,pro_ref,pro_name,cus_id,ord_id,ode_id FROM products
JOIN orders_details
ON products.pro_id=orders_details.ode_pro_id
JOIN orders
ON orders_details.ode_ord_id=orders.ord_id
JOIN customers
ON orders.ord_cus_id=customers.cus_id
WHERE cus_lastname="Pikatchien";

--Q9. Afficher le catalogue des produits par catégorie, le nom des produits et de la catégorie doivent être affichés.
SELECT cat_id , cat_name , pro_name
from categories,products
WHERE pro_cat_id = cat_id
ORDER BY cat_name ASC

--Q10. Afficher l'organigramme du magasin de Compiègne Afficher le nom et prénom des employés, classés par ordre alphabétique, ainsi que celui de leur supérieur hiérarchique (et éventuellement leurs postes respectifs, si vous y parvenez).


SELECT CONCAT(emp1.emp_lastname,'   ', emp1.emp_firstname) as Employé, pos_libelle as Poste, CONCAT(emp2.emp_lastname,'   ',emp2. emp_firstname) as Supérieur
FROM employees as emp1 
JOIN posts on pos_id = emp1.emp_pos_id
JOIN employees as emp2 on emp2.emp_id =emp1.emp_superior_id
JOIN shops on sho_id = emp1.emp_sho_id
WHERE sho_id=3
ORDER BY emp1.emp_lastname;


--Q11. Quel produit a été vendu avec la remise la plus élevée ? Afficher le montant de la remise, le numéro et le nom du produit, le numéro de commande et de ligne de commande.

SELECT ode_discount , pro_id , pro_name , ord_id , ode_id 
FROM orders
JOIN orders_details on ode_ord_id=ord_id
JOIN products on pro_id=ode_pro_id
WHERE ode_discount = (SELECT max(ode_discount) FROM orders_details);

--Q12. Combien y-a-t-il de clients canadiens ? Afficher dans une colonne intitulée 'Nb clients Canada'
SELECT count(cus_id) as 'Nb clients Canada'FROM customers
WHERE cus_countries_id='CA';

--Q13. Afficher le détail des commandes de 2020.

SELECT ode_id,ode_unit_price,ode_discount,ode_quantity,ode_ord_id,ode_pro_id ,ord_order_date FROM orders_details
JOIN orders
ON orders_details.ode_ord_id=orders.ord_id
where YEAR(ord_order_date)=2020;

--Q14. Afficher les coordonnées des fournisseurs pour lesquels des commandes ont été passées.

SELECT pro_sup_id FROM suppliers, products
WHERE suppliers.sup_id=products.pro_sup_id
GROUP BY pro_sup_id;

--Q15. Quel est le chiffre d'affaires de 2020 ?
select sum((ode_unit_price-(ode_unit_price*ode_discount/100))*ode_quantity) as chiffre_aff FROM orders_details 
JOIN orders on orders_details.ode_ord_id=orders.ord_id 
WHERE YEAR(ord_order_date)=2020;


--Q16. Quel est le panier moyen ?

select (sum((ode_unit_price-(ode_unit_price*ode_discount/100))*ode_quantity))/count(DISTINCT(ord_id)) as prix_panier FROM orders_details 
JOIN orders on orders_details.ode_ord_id=orders.ord_id ;

--Q16. Lister le total de chaque commande par total décroissant (Afficher numéro de commande, date, total et nom du client).
SELECT ord_id as numéro_de_commande,cus_lastname as nom_du_client ,ord_order_date as 'date',sum((ode_unit_price-(ode_unit_price*ode_discount/100))*ode_quantity) as total from orders_details
 JOIN orders
 on orders_details.ode_ord_id = orders.ord_id
 JOIN customers
 ON orders.ord_cus_id = customers.cus_id
 GROUP BY ord_id
 ORDER BY sum((ode_unit_price-(ode_unit_price*ode_discount/100))*ode_quantity) DESC;
 
 --Q17. Quel est le panier moyen ?

select (sum((ode_unit_price-(ode_unit_price*ode_discount/100))*ode_quantity))/count(DISTINCT(ord_id)) as prix_panier FROM orders_details 
JOIN orders on orders_details.ode_ord_id=orders.ord_id ;

--Q18. La version 2020 du produit barb004 s'appelle désormais Camper et, bonne nouvelle, son prix subit une baisse de 10%.

UPDATE products
SET
pro_name = 'Camper',
pro_price = pro_price*0.9,
pro_update_date = CURRENT_TIME()
WHERE pro_ref = 'barb004';

--Q19. L'inflation en France en 2019 a été de 1,1%, appliquer cette augmentation à la gamme de parasols.

UPDATE products
set pro_price = pro_price * 1.011,  pro_update_date = CURRENT_TIME()
where pro_id= 25 or pro_id= 27;

--Q20. Supprimer les produits non vendus de la catégorie "Tondeuses électriques". Vous devez utiliser une sous-requête sans indiquer de valeurs de clés.

DELETE* FROM products
WHERE pro_cat_id = (select `cat_id` from `categories` where `cat_name`="Tondeuses électriques")  and `pro_id` not in (select `ode_pro_id` from `orders_details`);