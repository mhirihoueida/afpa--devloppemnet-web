--Création du rôle
CREATE ROLE 'Rmarketing';
-- on accorde tous les droits sur la base gescom_afpa pout table products et table categories
GRANT ALL
ON gescom_afpa.products
TO Rmarketing;

GRANT ALL
ON gescom_afpa.categories
TO Rmarketing;
--les utilisateurs possèdant le rôle r_marketing pourront lire des données (select) dans la table ordrs, orders_details,et customers de la base gescom_afpa.
GRANT SELECT
ON gescom_afpa.orders
TO Rmarketing;

GRANT SELECT
ON gescom_afpa.orders_details
TO Rmarketing;

GRANT SELECT
ON gescom_afpa.customers
TO Rmarketing;
-- la commande pour montrer les privilèges accordés à un rôle :
SHOW GRANTS FOR Rmarketing;

CREATE USER IF NOT EXISTS 'marketing'@'localhost'
IDENTIFIED BY 'abcd';

GRANT Rmarketing
TO 'marketing'@'localhost';

SHOW GRANTS FOR 'marketing'@'localhost';
--Attribuer tous les rôles à un utilisateur

SET DEFAULT ROLE Rmarketing
TO 'marketing'@'localhost';