DROP DATABASE IF EXISTS gescom_perso;
CREATE DATABASE gescom_perso;
USE gescom_perso;
CREATE TABLE Categories(
   cat_id INT,
   cat_name VARCHAR(50),
   cat_id_1 INT,
   PRIMARY KEY(cat_id),
   FOREIGN KEY(cat_id_1) REFERENCES Categories(cat_id)
);

CREATE TABLE Suppliers(
   sup_id INT,
   sup_name VARCHAR(50),
   sup_contact VARCHAR(50),
   PRIMARY KEY(sup_id)
);

CREATE TABLE customer(
   cus_id INT,
   cus_name VARCHAR(50),
   cus_rue_ VARCHAR(50),
   cus_cp INT,
   cus_ville VARCHAR(50),
   cus_phone VARCHAR(50),
   cus_mail VARCHAR(50),
   cus_pwd VARCHAR(50),
   cus_add_date DATE NOT NULL,
   cus_update_date DATETIME,
   PRIMARY KEY(cus_id)
);

CREATE TABLE orders(
   ord_id INT,
   ord_add_date DATETIME NOT NULL,
   odr_update_date DATETIME,
   ord_payment_date DATETIME,
   ord_shipped_date DATETIME,
   PRIMARY KEY(ord_id)
);

CREATE TABLE Posts(
   post_id INT,
   post_name VARCHAR(50),
   PRIMARY KEY(post_id)
);

CREATE TABLE Departments(
   dep_id INT,
   dep_name VARCHAR(50),
   PRIMARY KEY(dep_id)
);

CREATE TABLE service(
   service_id INT,
   service_name VARCHAR(50),
   PRIMARY KEY(service_id)
);

CREATE TABLE Products(
   prod_id INT,
   prod_price DECIMAL(15,2),
   prod_reference VARCHAR(50),
   prod_stock INT,
   prod_stock_alert INT,
   prod_color VARCHAR(50),
   prod_title VARCHAR(50),
   prod_description VARCHAR(50),
   prod_add_date DATE NOT NULL,
   prod_update_date DATETIME,
   prod_picture VARCHAR(50),
   prod_sell varchar(50),
   sup_id INT NOT NULL,
   cat_id INT NOT NULL,
   PRIMARY KEY(prod_id),
   FOREIGN KEY(sup_id) REFERENCES Suppliers(sup_id),
   FOREIGN KEY(cat_id) REFERENCES Categories(cat_id)
);

CREATE TABLE orders_details(
   ord_det_id INT,
   ord_det_quantity DECIMAL(15,2),
   ord_det_price DECIMAL(15,2),
   ord_det_discount DECIMAL(15,2),
   ord_id INT NOT NULL,
   prod_id INT NOT NULL,
   PRIMARY KEY(ord_det_id),
   FOREIGN KEY(ord_id) REFERENCES orders(ord_id),
   FOREIGN KEY(prod_id) REFERENCES Products(prod_id)
);

CREATE TABLE Employees(
   emp_id INT,
   emp_name VARCHAR(50),
   emp_salary DECIMAL(15,2),
   emp_join DATE NOT NULL,
   emp_gender BINARY(50) NOT NULL,
   emp_kids INT,
   cus_id INT NOT NULL,
   service_id INT NOT NULL,
   emp_id_1 INT NOT NULL,
   dep_id INT NOT NULL,
   post_id INT NOT NULL,
   PRIMARY KEY(emp_id),
   FOREIGN KEY(cus_id) REFERENCES customer(cus_id),
   FOREIGN KEY(service_id) REFERENCES service(service_id),
   FOREIGN KEY(emp_id_1) REFERENCES Employees(emp_id),
   FOREIGN KEY(dep_id) REFERENCES Departments(dep_id),
   FOREIGN KEY(post_id) REFERENCES Posts(post_id)
);

CREATE TABLE pass(
   ord_id INT,
   emp_id INT,
   PRIMARY KEY(ord_id, emp_id),
   FOREIGN KEY(ord_id) REFERENCES orders(ord_id),
   FOREIGN KEY(emp_id) REFERENCES Employees(emp_id)
);
