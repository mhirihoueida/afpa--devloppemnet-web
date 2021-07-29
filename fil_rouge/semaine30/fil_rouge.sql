CREATE TABLE fournisseurs(
   Id_fournisseurs INT,
   fou_nom_ VARCHAR(50),
   fou_ville VARCHAR(50),
   fou_pays_ VARCHAR(50),
   fou_adresse VARCHAR(50),
   fou_cp_ INT,
   _fou_mail VARCHAR(255),
   fou_nom_contact VARCHAR(50),
   fou_phone_contact VARCHAR(15),
   fou_type VARCHAR(50),
   PRIMARY KEY(Id_fournisseurs)
);

CREATE TABLE _categories(
   Id__categories INT,
   cat_nom VARCHAR(50),
   cat_desc VARCHAR(250),
   Id_categories_1 INT,
   PRIMARY KEY(Id__categories)
);

CREATE TABLE poste(
   Id_poste INT,
   pos_libelle VARCHAR(50),
   PRIMARY KEY(Id_poste)
);

CREATE TABLE produits(
   Id_produits INT,
   pro_lib_court VARCHAR(50),
   pro_lib_long_ VARCHAR(50),
   pro_fou_ref VARCHAR(50),
   pro_photo VARCHAR(50),
   pro_pri_achat_ DECIMAL(15,2),
   pro_stock INT,
   pro_bloque_ LOGICAL,
   PRIMARY KEY(Id_produits)
);

CREATE TABLE livraison(
   Id_livraison INT,
   liv_num_bon INT,
   liv_date DATE,
   liv_etat VARCHAR(50),
   liv_adresse VARCHAR(250),
   PRIMARY KEY(Id_livraison)
);

CREATE TABLE ligne_de_commande(
   Id_ligne_de_commande INT,
   ligco_qty INT,
   ligco_uni_prix DECIMAL(15,2),
   PRIMARY KEY(Id_ligne_de_commande)
);

CREATE TABLE sous_catégories(
   Id_sous_catégories INT,
   souscat_nom VARCHAR(50),
   souscat_desc VARCHAR(50),
   Id__categories INT NOT NULL,
   PRIMARY KEY(Id_sous_catégories),
   FOREIGN KEY(Id__categories) REFERENCES _categories(Id__categories)
);

CREATE TABLE catalogues_(
   Id_catalogues_ INT,
   cata_nom VARCHAR(50),
   cata_date VARCHAR(50),
   cata_desc VARCHAR(50),
   PRIMARY KEY(Id_catalogues_)
);

CREATE TABLE entreprise(
   Id_entreprise INT,
   entr_nom VARCHAR(50),
   entr_date_activité VARCHAR(50),
   entr_desc VARCHAR(50),
   entr_adress VARCHAR(255),
   entr_phone VARCHAR(50),
   PRIMARY KEY(Id_entreprise)
);

CREATE TABLE employees(
   Id_employees INT,
   emp_nom_ VARCHAR(50),
   emp_prenom_ VARCHAR(50),
   emp_adresse VARCHAR(250),
   emp_cp VARCHAR(50),
   emp_ville_ VARCHAR(50),
   emp_mail_ VARCHAR(250),
   emp_mot_pass_ VARCHAR(50),
   emp_phone_ INT,
   emp_dat_embauche DATE,
   Id_entreprise INT NOT NULL,
   Id_poste INT NOT NULL,
   PRIMARY KEY(Id_employees),
   FOREIGN KEY(Id_entreprise) REFERENCES entreprise(Id_entreprise),
   FOREIGN KEY(Id_poste) REFERENCES poste(Id_poste)
);

CREATE TABLE clients(
   Id_clients INT,
   cli_nom VARCHAR(50),
   cli_prenom VARCHAR(50),
   cli_adresse VARCHAR(250),
   cli_cp VARCHAR(50),
   cli_ville VARCHAR(50),
   cli_mail VARCHAR(250),
   cli_phone INT,
   cli_mot_pass VARCHAR(60),
   cli_ins_date DATE,
   cli_ref VARCHAR(50),
   cli_coefficient DECIMAL(15,0),
   Id_employees INT NOT NULL,
   PRIMARY KEY(Id_clients),
   FOREIGN KEY(Id_employees) REFERENCES employees(Id_employees)
);

CREATE TABLE commandes(
   Id_commandes INT,
   com_com_date_ DATE,
   com_pay_date DATE,
   com_exp_date DATE,
   com_statu VARCHAR(50),
   com_type_paiement VARCHAR(50) NOT NULL,
   com_prix_total DECIMAL(15,2),
   com_discount_ INT,
   com_facture_date DATE,
   com_facture_adresse_ VARCHAR(250),
   Id_ligne_de_commande INT NOT NULL,
   Id_clients INT NOT NULL,
   PRIMARY KEY(Id_commandes),
   UNIQUE(Id_ligne_de_commande),
   FOREIGN KEY(Id_ligne_de_commande) REFERENCES ligne_de_commande(Id_ligne_de_commande),
   FOREIGN KEY(Id_clients) REFERENCES clients(Id_clients)
);

CREATE TABLE gerer(
   Id_fournisseurs INT,
   Id_employees INT,
   PRIMARY KEY(Id_fournisseurs, Id_employees),
   FOREIGN KEY(Id_fournisseurs) REFERENCES fournisseurs(Id_fournisseurs),
   FOREIGN KEY(Id_employees) REFERENCES employees(Id_employees)
);

CREATE TABLE donner(
   Id_livraison INT,
   Id_ligne_de_commande INT,
   PRIMARY KEY(Id_livraison, Id_ligne_de_commande),
   FOREIGN KEY(Id_livraison) REFERENCES livraison(Id_livraison),
   FOREIGN KEY(Id_ligne_de_commande) REFERENCES ligne_de_commande(Id_ligne_de_commande)
);

CREATE TABLE appartenir(
   Id__categories INT,
   Id_produits INT,
   PRIMARY KEY(Id__categories, Id_produits),
   FOREIGN KEY(Id__categories) REFERENCES _categories(Id__categories),
   FOREIGN KEY(Id_produits) REFERENCES produits(Id_produits)
);

CREATE TABLE elaborer(
   Id_employees INT,
   Id_catalogues_ INT,
   PRIMARY KEY(Id_employees, Id_catalogues_),
   FOREIGN KEY(Id_employees) REFERENCES employees(Id_employees),
   FOREIGN KEY(Id_catalogues_) REFERENCES catalogues_(Id_catalogues_)
);

CREATE TABLE contenir(
   Id_produits INT,
   Id_catalogues_ INT,
   PRIMARY KEY(Id_produits, Id_catalogues_),
   FOREIGN KEY(Id_produits) REFERENCES produits(Id_produits),
   FOREIGN KEY(Id_catalogues_) REFERENCES catalogues_(Id_catalogues_)
);

CREATE TABLE executer(
   Id_employees INT,
   Id_commandes INT,
   PRIMARY KEY(Id_employees, Id_commandes),
   FOREIGN KEY(Id_employees) REFERENCES employees(Id_employees),
   FOREIGN KEY(Id_commandes) REFERENCES commandes(Id_commandes)
);
