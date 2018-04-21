♦ Exam n°2

1) DML (SELECT, UPDATE, DELETE)
   
   SELECT * FROM Client ;
   
   UPDATE Client SET Nom = 'Sophie' 
          WHERE Numero = '22A323' ;
   
   DELETE FROM Client 
               WHERE Numero = '45f715' ;
   
2) DDL (CREATE TABLE, ALTER TABLE, DROP TABLE)

   CREATE TABLE Produits (
     NP INTEGER PRIMARY KEY,
     NomP VARCHAR(200),
     Coul VARCHAR(200),
     Pds INTEGER
   );
   
   ALTER TABLE Client DROP COLUMN Numero ;
   
   DROP TABLE Client ; 

♦ Exam n°3

1) SELECT Num_Chambre FROM Chambre
          WHERE Equ = 'TV' ; 
          
2) SELECT Num_Chambre, Nbr_Pers FROM Chambre ;

3) SELECT SUM(Nbr_Pers) FROM Chambre ;

4) SELECT Prix/Nbr_Pers FROM Chambre
          FROM Equ = 'TV' ;
          
5) SELECT Num_Chambre, Num_Client FROM Reservation
          WHERE Date_Arr = '09:02:2004' ;
          
6) SELECT Num_Chambre FROM Chambre 
          WHERE Prix <= 80 OR (Confort = 'Bain' AND Prix <= 120) ;
          
7) SELECT Nom, Prenom, Adresse FROM Client
          WHERE Nom LIKE 'D%' ;
          
8) SELECT COUNT(Num_Chambre) FROM Chambre 
          WHERE Prix BETWEEN 85 AND 120 ;
          
9) SELECT Client.Nom FROM Client, Reservation
          WHERE Client.Num_Client = Reservation.Num_Client AND Date_Dep IS NULL ;
          
10) SELECT COUNT(Client.Num_Client), Adresse FROM Client
           INNER JOIN Reservation ON Client.Num_Client = Reservation.Num_Client
           INNER JOIN Chambre ON Reservation.Num_Chambre = Chambre.Num_Chambre
           WHERE Nbr_Pers = 2 AND Date_Arr LIKE '%/04/%'
           GROUP BY Reservation.Num_Client HAVING COUNT(Reservation.Num_Client) >= 2 
           ORDER BY Adresse ;
           
♦ Exam n°4

1) SELECT Client.Nom FROM Agence, Client, Emprunt
          WHERE Client.Num_Client = Emprunt.Num_Client AND Emprunt.Num_Agence = Agence.Num_Agence AND Agence.Nom = 'Paris-Rambuteau'
          ORDER BY Client.Nom ;
          
2) SELECT AVG(Compte.Solde) FROM Compte 
          GROUP BY Num_Agence ;
          
3) SELECT AVG(Solde) FROM Compte
          WHERE AVG(Solde) > 10 000
          GROUP BY Num_Agence ;
          
4) SELECT COUNT(Num_Client) FROM Client
          WHERE Ville = 'Paris' ;
          
5) SELECT COUNT(Client.Num_Client) FROM Client, Compte, Agence
          WHERE Client.Num_Client = Compte.Num_Client AND Compte.Num_Agence = Agence.Num_Agence AND Agence.Nom = 'Paris-Bastille' AND Client.Ville IS NULL ;
