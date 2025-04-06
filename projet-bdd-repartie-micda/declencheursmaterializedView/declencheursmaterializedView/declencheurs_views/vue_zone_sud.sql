-- Connexion en tant que C##ZONE_SUD

CREATE DATABASE LINK zone_nord_link
CONNECT TO c##zone_nord IDENTIFIED BY nord123
USING 'XE';

CREATE DATABASE LINK zone_centre_link
CONNECT TO c##zone_centre IDENTIFIED BY centre123
USING 'XE';

CREATE DATABASE LINK zone_capvert_link
CONNECT TO c##zone_capvert IDENTIFIED BY capvert123
USING 'XE';

CREATE MATERIALIZED VIEW etudiants_nord_mv
BUILD IMMEDIATE
REFRESH COMPLETE
AS SELECT * FROM etudiants_nord@zone_nord_link;

CREATE MATERIALIZED VIEW etudiants_centre_mv
BUILD IMMEDIATE
REFRESH COMPLETE
AS SELECT * FROM etudiants_centre@zone_centre_link;

CREATE MATERIALIZED VIEW etudiants_capvert_mv
BUILD IMMEDIATE
REFRESH COMPLETE
AS SELECT * FROM etudiants_capvert@zone_capvert_link;