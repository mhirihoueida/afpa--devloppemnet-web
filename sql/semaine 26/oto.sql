DROP DATABASE IF EXISTS OTO;
CREATE DATABASE OTO;
USE OTO;
CREATE TABLE marque(GIT
   mar_id INT,
   libelle VARCHAR(50) NOT NULL,
   PRIMARY KEY(mar_id)
);

CREATE TABLE modele(
   mod_id INT,
   mod_libelle VARCHAR(50) NOT NULL,
   mar_id INT NOT NULL,
   PRIMARY KEY(mod_id),
   FOREIGN KEY(mar_id) REFERENCES marque(mar_id)
);

CREATE TABLE piece(
   pie_id COUNTER,
   pie_libelle VARCHAR(50) NOT NULL,
   pie_type LOGICAL NOT NULL,
   pie_prix DECIMAL(7,2) NOT NULL,
   PRIMARY KEY(pie_id)
);

CREATE TABLE prestation(
   pre_id INT,
   pre_libelle VARCHAR(50) NOT NULL,
   pre_prix DECIMAL(7,2) NOT NULL,
   pre_type VARCHAR(50) NOT NULL,
   pre_date_arrivee DATETIME NOT NULL,
   pre_date_sortie DATETIME NOT NULL,
   pie_id INT NOT NULL,
   PRIMARY KEY(pre_id),
   FOREIGN KEY(pie_id) REFERENCES piece(pie_id)
);

CREATE TABLE poste(
   pos_id INT,
   pos_libelle VARCHAR(50) NOT NULL,
   PRIMARY KEY(pos_id)
);

CREATE TABLE employe(
   emp_id INT,
   emp_nom VARCHAR(50) NOT NULL,
   emp_prenom VARCHAR(50) NOT NULL,
   emp_tel CHAR(10) NOT NULL,
   coordonnees VARCHAR(255) NOT NULL,
   pos_id INT NOT NULL,
   PRIMARY KEY(emp_id),
   FOREIGN KEY(pos_id) REFERENCES poste(pos_id)
);

CREATE TABLE client(
   cli_id INT,
   cli_nom VARCHAR(50) NOT NULL,
   cli_prenom VARCHAR(50) NOT NULL,
   cli_coordonnees VARCHAR(50) NOT NULL,
   cli_type VARCHAR(50) NOT NULL,
   cli_mail VARCHAR(50) NOT NULL,
   cli_tel CHAR(10) NOT NULL,
   emp_id INT NOT NULL,
   PRIMARY KEY(cli_id),
   FOREIGN KEY(emp_id) REFERENCES employe(emp_id)
);

CREATE TABLE commande(
   ven_id INT,
   ven_date_achat DATE NOT NULL,
   ven_date_livraison DATE NOT NULL,
   ven_mode_paiement LOGICAL NOT NULL,
   ven_adresse_facturation VARCHAR(255) NOT NULL,
   cli_id INT NOT NULL,
   PRIMARY KEY(ven_id),
   FOREIGN KEY(cli_id) REFERENCES client(cli_id)
);

CREATE TABLE vehicule(
   veh_id INT,
   veh_immat VARCHAR(10) NOT NULL,
   veh_etat VARCHAR(50) NOT NULL,
   veh_type VARCHAR(50) NOT NULL,
   veh_prix DECIMAL(8,2) NOT NULL,
   veh_couleur VARCHAR(50) NOT NULL,
   veh_annee CHAR(4) NOT NULL,
   veh_kilometrage INT NOT NULL,
   pre_id INT,
   ven_id INT,
   pie_id INT,
   mod_id INT NOT NULL,
   PRIMARY KEY(veh_id),
   UNIQUE(pre_id),
   FOREIGN KEY(pre_id) REFERENCES prestation(pre_id),
   FOREIGN KEY(ven_id) REFERENCES commande(ven_id),
   FOREIGN KEY(pie_id) REFERENCES piece(pie_id),
   FOREIGN KEY(mod_id) REFERENCES modele(mod_id)
);