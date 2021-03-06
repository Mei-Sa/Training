With Oracle SQL Developer.

• Question 1 

   CREATE TABLE REPRESENTANTS (
     NR INTEGER PRIMARY KEY,
     NOMR VARCHAR(200),
     VILLE VARCHAR(200)
   );

   CREATE TABLE PRODUITS (
     NP INTEGER PRIMARY KEY,
     NOMP VARCHAR(200),
     COUL VARCHAR(200),
     PDS INTEGER
   );

   CREATE TABLE CLIENTS (
     NC INTEGER PRIMARY KEY,
     NOMC VARCHAR(200),
     VILLE VARCHAR(200)
   );

   CREATE TABLE VENTES (
     NR INTEGER REFERENCES REPRESENTANTS(NR),
     NP INTEGER REFERENCES PRODUITS(NP),
     NC INTEGER REFERENCES CLIENTS(NC),
     QT INTEGER,
     PRIMARY KEY (NR, NP, NC)
   );
   
   INSERT INTO REPRESENTANTS (NR, NOMR, VILLE) VALUES (1, 'Stephane', 'Lyon');
   INSERT INTO REPRESENTANTS (NR, NOMR, VILLE) VALUES (2, 'Benjamin', 'Paris');
   INSERT INTO REPRESENTANTS (NR, NOMR, VILLE) VALUES (3, 'Leonard', 'Lyon');
   INSERT INTO REPRESENTANTS (NR, NOMR, VILLE) VALUES (4, 'Antoine', 'Brest');
   INSERT INTO REPRESENTANTS (NR, NOMR, VILLE) VALUES (5, 'Bruno', 'Bayonne');

   INSERT INTO PRODUITS (NP, NOMP, COUL, PDS) VALUES (1, 'Aspirateur', 'Rouge', 3546);
   INSERT INTO PRODUITS (NP, NOMP, COUL, PDS) VALUES (2, 'Trotinette', 'Bleu', 1423);
   INSERT INTO PRODUITS (NP, NOMP, COUL, PDS) VALUES (3, 'Chaise', 'Blanc', 3827);
   INSERT INTO PRODUITS (NP, NOMP, COUL, PDS) VALUES (4, 'Tapis', 'Rouge', 1423);

   INSERT INTO CLIENTS (NC, NOMC, VILLE) VALUES (1, 'Alice', 'Lyon');
   INSERT INTO CLIENTS (NC, NOMC, VILLE) VALUES (2, 'Bruno', 'Lyon');
   INSERT INTO CLIENTS (NC, NOMC, VILLE) VALUES (3, 'Charles', 'Compiegne');
   INSERT INTO CLIENTS (NC, NOMC, VILLE) VALUES (4, 'Denis', 'Montpellier');
   INSERT INTO CLIENTS (NC, NOMC, VILLE) VALUES (5, 'Emile', 'Strasbourg');

   INSERT INTO VENTES (NR, NP, NC, QT) VALUES (1, 1, 1, 1);
   INSERT INTO VENTES (NR, NP, NC, QT) VALUES (1, 1, 2, 1);
   INSERT INTO VENTES (NR, NP, NC, QT) VALUES (2, 2, 3, 1);
   INSERT INTO VENTES (NR, NP, NC, QT) VALUES (4, 3, 3, 200);
   INSERT INTO VENTES (NR, NP, NC, QT) VALUES (3, 4, 2, 190);
   INSERT INTO VENTES (NR, NP, NC, QT) VALUES (1, 3, 2, 300);
   INSERT INTO VENTES (NR, NP, NC, QT) VALUES (3, 1, 2, 120);
   INSERT INTO VENTES (NR, NP, NC, QT) VALUES (3, 1, 4, 120);
   INSERT INTO VENTES (NR, NP, NC, QT) VALUES (3, 4, 4, 2);
   INSERT INTO VENTES (NR, NP, NC, QT) VALUES (3, 1, 1, 3);
   INSERT INTO VENTES (NR, NP, NC, QT) VALUES (3, 4, 1, 5);
   INSERT INTO VENTES (NR, NP, NC, QT) VALUES (3, 1, 3, 1);
   
• Question 2

   SELECT * FROM CLIENTS ;

• Question 3

   SELECT NP, NOMP FROM PRODUITS 
          WHERE COUL = 'Rouge' AND PDS > 2000 ;

• Question 4

   SELECT DISTINCT NOMR FROM REPRESENTANTS 
          INNER JOIN VENTES ON REPRESENTANTS.NR = VENTES.NR WHERE QT >= 1 ; 

• Question 5

   SELECT DISTINCT NOMC FROM CLIENTS 
          INNER JOIN VENTES ON CLIENTS.NC = VENTES.NC WHERE VILLE = 'Lyon' AND QT > 180 ;

• Question 6

   SELECT DISTINCT REPRESENTANTS.NOMR, CLIENTS.NOMC FROM VENTES
          INNER JOIN CLIENTS ON CLIENTS.NC = VENTES.NC
          INNER JOIN REPRESENTANTS ON REPRESENTANTS.NR = VENTES.NR
          INNER JOIN PRODUITS ON PRODUITS.NP = VENTES.NP
          WHERE COUL = 'Rouge' AND QT > 100 ; 
  
   Other solution :
   
   SELECT REPRESENTANTS.NOMR, CLIENTS.NOMC FROM REPRESENTANTS, CLIENTS, PRODUITS, VENTES
          WHERE REPRESENTANTS.NR = VENTES.NR AND CLIENTS.NC = VENTES.NC AND PRODUITS.NP = VENTES.NP AND COUL = 'Rouge' AND QT > 100 ;
