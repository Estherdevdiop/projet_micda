
-- À exécuter en tant que SYSTEM
-- Donner le privilège de création de DATABASE LINK
GRANT CREATE DATABASE LINK TO c##zone_nord;
GRANT CREATE DATABASE LINK TO c##zone_centre;
GRANT CREATE DATABASE LINK TO c##zone_capvert;
GRANT CREATE DATABASE LINK TO c##zone_sud;

-- Donner les droits SELECT entre les utilisateurs pour les fragments

-- Depuis zone_nord
GRANT SELECT ON c##zone_nord.etudiants_nord TO c##zone_centre;
GRANT SELECT ON c##zone_nord.etudiants_nord TO c##zone_capvert;
GRANT SELECT ON c##zone_nord.etudiants_nord TO c##zone_sud;

-- Depuis zone_centre
GRANT SELECT ON c##zone_centre.etudiants_centre TO c##zone_nord;
GRANT SELECT ON c##zone_centre.etudiants_centre TO c##zone_capvert;
GRANT SELECT ON c##zone_centre.etudiants_centre TO c##zone_sud;

-- Depuis zone_capvert
GRANT SELECT ON c##zone_capvert.etudiants_capvert TO c##zone_nord;
GRANT SELECT ON c##zone_capvert.etudiants_capvert TO c##zone_centre;
GRANT SELECT ON c##zone_capvert.etudiants_capvert TO c##zone_sud;

-- Depuis zone_sud
GRANT SELECT ON c##zone_sud.etudiants_sud TO c##zone_nord;
GRANT SELECT ON c##zone_sud.etudiants_sud TO c##zone_centre;
GRANT SELECT ON c##zone_sud.etudiants_sud TO c##zone_capvert;
