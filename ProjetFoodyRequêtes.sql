USE FOODY ;

#I/
# 1. Lister le contenu de la table Produit
SELECT * FROM Produit;
# 2. N'affichez que les 10 premiers produits
SELECT * FROM Produit LIMIT 10 ;
# 3. Trier tous les produits par leur prix unitaire
SELECT * FROM Produit ORDER BY PrixUnit;
# 4. Lister les trois produits les plus chers
SELECT NomProd, PrixUnit FROM Produit ORDER BY PrixUnit DESC LIMIT 3;

#II/
#1. Lister les clients français installés à Paris

SELECT * FROM Client WHERE Ville = "Paris" AND Pays = "France" ;

#2Lister les clients français, allemands et canadiens

SELECT * FROM Client WHERE Pays IN ("France", "Germany", "Canada");

#3Lister les clients dont le numéro de fax n'est pas renseigné

SELECT * FROM Client WHERE Fax IS NULL ;

#4Lister les clients dont le nom contient"restaurant (nom présent dans la colonne Societe/CompanyNams)

Select * FROM Client WHERE Societe LiKE "%restaurant%";

#III/ 

#1 Lister uniquement la description des catégories de produits (table Categorie)

SELECT Descriptionn FROM Categorie;

#2 Lister les différents pays des clients

SELECT DISTINCT Pays FROM client;

#3 Idem en ajoutant les villes, le tout trié par ordre alphabétique du pays et de la ville 

SELECT DISTINCT Pays FROM Client GROUP BY Pays, Ville  ;

#4 Lister tous les produits vendus en bouteille (bottle) ou en canettes (can)

SELECT * FROM Produit WHERE QteParUnit LIKE '%bottles' OR QteParUnit LIKE '%bottle' OR QteParUnit LIKE '%cans' ;

#5 Lister les fournisseurs français, en afficant uniquement le nom, le contact et la ville, triés par ville 

SELECT Societe, Contact, Ville FROM fournisseur ORDER BY Ville;

#6 Lister les produits (nom en majuscule et référence) du fournisseur n°8 dont le prix unitaire est entre 10 et 100 euros,
# en renommant les attributs pour que ce soit explicite

SELECT RefProd as Référence, UPPER(NomProd) as Nom, NoFour as Fournisseur, PrixUnit FROM Produit WHERE NoFour = "8" AND PrixUnit BETWEEN 10 AND 100 ;

#7 Lister les numéros d'employés ayant réalisé une commande (cf table Commande) à livrer en France, 
# à Lille, Lyon ou Nantes

SELECT DISTINCT NoEmp, PaysLiv, VilleLiv FROM Commande WHERE VilleLiv = 'Lille' OR VilleLiv = 'Lyon' OR VilleLiv = 'Nantes' ORDER BY NoEmp ;

#8 Lister les produits dont le nom contient le terme "tofu" ou le terme "choco", dont le prix est inferieur 
# à 100 euros (attention à la condition à écrire) 

SELECT * FROM Produit WHERE NomProd LIKE '%tofu' AND PrixUnit < 100;
# Ou pour plus de sécurité même si le résultat est le même
SELECT * FROM Produit WHERE NomProd LIKE '%tofu' OR 'tofu%' AND PrixUnit < 100; 

#IV/

# La table DetailsCommande contient l'ensemble des lignes d'achat de chaque commande. Calculer, pour la commande numéro 10251, 
# pour chaque produit acheté dans celle-ci, le montant de la ligne d'achat en incluant la remise (stockée en proportion dans la table).
# Afficher donc (dans une même requête) : 
#- le prix unitaire,
# - la remise, 
# - la quantité, 
# - le montant à payer pour ce produit, 

SELECT * FROM DetailsCommande ; 
# Il n'y a jamais de remise donc on l'établit par défaut à 10%
SELECT Nocom, RefProd, ROUND(PrixUnit * 1.1 , 2) AS 'Nouveau Prix', Qte, Remise FROM DetailsCommande WHERE Nocom = '10251';

# V/
# 1. A partir de la table Produit, afficher "Produit non disponible" lorsque l'attribut indisponible vaut 1, et "Produit disponible sinon.

SELECT * FROM Produit ;
SELECT RefProd, NomProd, Indisponible, 
     CASE Indisponible 
      WHEN '1' THEN "Produit non disponible" 
      ELSE "Produit disponible" 
	END Disponibilité 
FROM Produit;

# 2. Dans la table DetailsCommande, Indiquer les infos suivantes en fonction de la remise 
      # . si elle vaut 0 : "aucune remise"
      # . si elle vaut entre 1 et 5% (inclus) : "petite remise"
      # . si elle vaut entre 6 et 15% (inclus) : "remise modérée"
      # . sinon "remise importante"
      
SELECT * FROM DetailsCommande ;


SELECT Nocom, RefProd, PrixUnit, Qte, Remise, 
     CASE Remise
     WHEN
     WHEN
     WHEN
     ELSE
      
# 3. Indiquer pour les commandes envoyées si elles ont été envoyées en retard (date d'envoie DateEnv supérieure (ou égale) à la date 
#    butoir ALivAvant) ou à temps. 