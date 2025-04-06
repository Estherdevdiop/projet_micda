-- Connexion en tant que C##ZONE_CAPVERT

CREATE DATABASE LINK zone_nord_link
CONNECT TO c##zone_nord IDENTIFIED BY nord123
USING 'XE';

CREATE DATABASE LINK zone_centre_link
CONNECT TO c##zone_centre IDENTIFIED BY centre123
USING 'XE';

CREATE DATABASE LINK zone_sud_link
CONNECT TO c##zone_sud IDENTIFIED BY sud123
USING 'XE';

CREATE MATERIALIZED VIEW etudiants_nord_mv
BUILD IMMEDIATE
REFRESH COMPLETE
AS SELECT * FROM etudiants_nord@zone_nord_link;

CREATE MATERIALIZED VIEW etudiants_centre_mv
BUILD IMMEDIATE
REFRESH COMPLETE
AS SELECT * FROM etudiants_centre@zone_centre_link;

CREATE MATERIALIZED VIEW etudiants_sud_mv
BUILD IMMEDIATE
REFRESH COMPLETE
AS SELECT * FROM etudiants_sud@zone_sud_link;