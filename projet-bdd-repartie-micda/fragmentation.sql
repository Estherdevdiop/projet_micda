-- Connexion en tant que SYSTEM
-- Fragmentation horizontale des données par zone

-- Fragmentation pour la zone NORD
CREATE TABLE etudiants_nord AS
SELECT * FROM etudiants
WHERE eno_fk IN (SELECT eno_id FROM enos WHERE zone = 'NORD');

CREATE TABLE preinscriptions_nord AS
SELECT * FROM preinscriptions
WHERE ine_fk IN (SELECT ine FROM etudiants_nord);

CREATE TABLE inscriptions_nord AS
SELECT * FROM inscriptions
WHERE ine_fk IN (SELECT ine FROM etudiants_nord);

-- Fragmentation pour la zone CENTRE
CREATE TABLE etudiants_centre AS
SELECT * FROM etudiants
WHERE eno_fk IN (SELECT eno_id FROM enos WHERE zone = 'CENTRE');

CREATE TABLE preinscriptions_centre AS
SELECT * FROM preinscriptions
WHERE ine_fk IN (SELECT ine FROM etudiants_centre);

CREATE TABLE inscriptions_centre AS
SELECT * FROM inscriptions
WHERE ine_fk IN (SELECT ine FROM etudiants_centre);

-- Fragmentation pour la zone CAP-VERT
CREATE TABLE etudiants_capvert AS
SELECT * FROM etudiants
WHERE eno_fk IN (SELECT eno_id FROM enos WHERE zone = 'CAP-VERT');

CREATE TABLE preinscriptions_capvert AS
SELECT * FROM preinscriptions
WHERE ine_fk IN (SELECT ine FROM etudiants_capvert);

CREATE TABLE inscriptions_capvert AS
SELECT * FROM inscriptions
WHERE ine_fk IN (SELECT ine FROM etudiants_capvert);

-- Fragmentation pour la zone SUD
CREATE TABLE etudiants_sud AS
SELECT * FROM etudiants
WHERE eno_fk IN (SELECT eno_id FROM enos WHERE zone = 'SUD');

CREATE TABLE preinscriptions_sud AS
SELECT * FROM preinscriptions
WHERE ine_fk IN (SELECT ine FROM etudiants_sud);

CREATE TABLE inscriptions_sud AS
SELECT * FROM inscriptions
WHERE ine_fk IN (SELECT ine FROM etudiants_sud);
