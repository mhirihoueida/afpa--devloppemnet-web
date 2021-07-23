/* v_Details correspondant à la requête : 
_A partir de la table orders_details, afficher par code produit, 
la somme des quantités commandées et le prix total correspondant : 
on nommera la colonne correspondant à la somme des quantités commandées, QteTot et le prix total, PrixTot.*/


CREATE VIEW v_Details
AS
SELECT  pro_id, count(pro_id) AS QteTot ,  Round (count(pro_id)*ode_unit_price) AS PrixTot FROM orders_details,products
WHERE   ode_pro_id = pro_id 



/*v_Ventes_Zoom correspondant à la requête : 
Afficher les ventes dont le code produit est ZOOM 
(affichage de toutes les colonnes de la table orders_details).*/

CREATE VIEW v_Ventes_Zoom 
AS
SELECT  * FROM orders_details, products
WHERE ode_pro_id = pro_id AND  pro_ref = "ZOOM"


--pour la modifier 

CREATE OR REPLACE VIEW v_Ventes_Zoom 
AS
SELECT  ode_id,ode_unit_price,ode_discount,ode_quantity,ode_ord_id,ode_pro_id FROM orders_details, products
WHERE orders_details.ode_pro_id = products.pro_id AND  products.pro_ref = "ZOOM"

  