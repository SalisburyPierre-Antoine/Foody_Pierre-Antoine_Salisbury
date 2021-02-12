DROP DATABASE IF EXISTS FOODY;
CREATE DATABASE FOODY ;
USE FOODY ;

CREATE TABLE Client(
Codecli CHAR (5) PRIMARY KEY , Societe VARCHAR(50), Contact VARCHAR(50), Fonction VARCHAR(50),
Adresse VARCHAR (50), Ville VARCHAR (50), Region VARCHAR (50), CodePostal VARCHAR(50),
Pays VARCHAR (50), Tel VARCHAR(50), Fax VARCHAR(50));

CREATE TABLE Messager(
NoMess INT PRIMARY KEY, NomMess VARCHAR(50),Tel VARCHAR(50)); 

CREATE TABLE Employe (
    NoEmp INT PRIMARY KEY,
    Nom VARCHAR(50),
    Prenom VARCHAR(50),
    Fonction VARCHAR(50),
    TitreCourtoisie VARCHAR(10),
    DateNaissance DATETIME,
    DateEmbauche DATETIME,
    Adresse VARCHAR(50),
    Ville VARCHAR(50),
    Region VARCHAR(50),
    Codepostal VARCHAR(50),
    Pays VARCHAR(50),
    TelDom VARCHAR(50),
    Extension VARCHAR(4),
    RendCompteA INT);
    


CREATE TABLE Commande( 
NoCom INT PRIMARY KEY, CodeCli CHAR (5), NoEmp INT, DateCom DATETIME,  AlivAvant DATETIME,
DateEnv DATETIME, NoMess INT, Portt FLOAT ,Destinataire VARCHAR(50),AdrLiv VARCHAR(50),
VilleLiv VARCHAR(50),RegionLiv VARCHAR(50),CodePostalLiv VARCHAR(50),PaysLiv VARCHAR(50),
FOREIGN KEY (Codecli) REFERENCES Client (CodeCli),
FOREIGN KEY (NoMess) REFERENCES Messager (NoMess),
FOREIGN KEY (NoEmp) REFERENCES Employe (NoEmp));

CREATE TABLE Fournisseur(
NoFour INT PRIMARY KEY,Societe VARCHAR(50), Contact VARCHAR(50), Fonction VARCHAR(50), Adresse VARCHAR(50),
Ville VARCHAR(50), Region VARCHAR(50), CodePostal VARCHAR(50),Pays VARCHAR(50),Tel VARCHAR(50),
Fax VARCHAR(50) ,PageAccueil VARCHAR(100));

CREATE TABLE Categorie(
CodeCateg INT PRIMARY KEY, NomCateg VARCHAR(50),Descriptionn TEXT);

CREATE TABLE Produit(
RefProd INT PRIMARY KEY, NomProd VARCHAR(50),NoFour INT,CodeCateg INT,QteParUnit VARCHAR(50),
PrixUnit FLOAT, UnitesStock INT, UnitesCom INT, NiveauReap INT, Indisponible INT,
FOREIGN KEY (NoFour) REFERENCES Fournisseur (NoFour),
FOREIGN KEY (CodeCateg) REFERENCES Categorie (CodeCateg));

CREATE TABLE DetailsCommande(
Nocom INT , RefProd INT,PrixUnit FLOAT,Qte INT,Remise FLOAT, PRIMARY KEY (Nocom, RefProd),
FOREIGN KEY (NoCom) REFERENCES Commande (NoCom),
FOREIGN KEY (RefProd) REFERENCES Produit (RefProd));

set global local_infile=true;
SHOW GLOBAL VARIABLES LIKE 'local_infile';


LOAD DATA LOCAL INFILE  '/Users/p-asalisbury/Desktop/data_foody/client.csv'
INTO TABLE Client
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE  '/Users/p-asalisbury/Desktop/data_foody/messager.csv'
INTO TABLE Messager
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE  '/Users/p-asalisbury/Desktop/data_foody/employe.csv'
INTO TABLE Employe
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE  '/Users/p-asalisbury/Desktop/data_foody/commande.csv'
INTO TABLE Commande
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE  '/Users/p-asalisbury/Desktop/data_foody/fournisseur.csv'
INTO TABLE Fournisseur
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE  '/Users/p-asalisbury/Desktop/data_foody/categorie.csv'
INTO TABLE Categorie
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE  '/Users/p-asalisbury/Desktop/data_foody/produit.csv'
INTO TABLE Produit
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE  '/Users/p-asalisbury/Desktop/data_foody/detailsCommande.csv'
INTO TABLE DetailsCommande
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

ALTER TABLE Employe ADD CONSTRAINT fk_RendCompte_A FOREIGN KEY (RendCompteA) REFERENCES Employe (NoEmp);



