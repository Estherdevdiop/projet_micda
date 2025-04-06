-- Connexion en tant que C##ZONE_NORD

CREATE DATABASE LINK zone_centre_link
CONNECT TO c##zone_centre IDENTIFIED BY centre123
USING 'XE';

CREATE DATABASE LINK zone_capvert_link
CONNECT TO c##zone_capvert IDENTIFIED BY capvert123
USING 'XE';

CREATE DATABASE LINK zone_sud_link
CONNECT TO c##zone_sud IDENTIFIED BY sud123
USING 'XE';

CREATE MATERIALIZED VIEW etudiants_centre_mv
BUILD IMMEDIATE
REFRESH COMPLETE
AS SELECT * FROM etudiants_centre@zone_centre_link;

CREATE MATERIALIZED VIEW etudiants_capvert_mv
BUILD IMMEDIATE
REFRESH COMPLETE
AS SELECT * FROM etudiants_capvert@zone_capvert_link;

CREATE MATERIALIZED VIEW etudiants_sud_mv
BUILD IMMEDIATE
REFRESH COMPLETE
AS SELECT * FROM etudiants_sud@zone_sud_link;