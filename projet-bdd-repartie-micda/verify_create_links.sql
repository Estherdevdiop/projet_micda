-- Vérifie et crée le lien pour la zone NORD
BEGIN
    EXECUTE IMMEDIATE 'CREATE DATABASE LINK zone_nord_link
                       CONNECT TO c##zone_nord IDENTIFIED BY nord123
                       USING ''XE''';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2011 THEN
            RAISE;
        END IF;
END;
/

-- Vérifie et crée le lien pour la zone CENTRE
BEGIN
    EXECUTE IMMEDIATE 'CREATE DATABASE LINK zone_centre_link
                       CONNECT TO c##zone_centre IDENTIFIED BY centre123
                       USING ''XE''';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2011 THEN
            RAISE;
        END IF;
END;
/

-- Vérifie et crée le lien pour la zone CAP-VERT
BEGIN
    EXECUTE IMMEDIATE 'CREATE DATABASE LINK zone_capvert_link
                       CONNECT TO c##zone_capvert IDENTIFIED BY capvert123
                       USING ''XE''';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2011 THEN
            RAISE;
        END IF;
END;
/

-- Vérifie et crée le lien pour la zone SUD
BEGIN
    EXECUTE IMMEDIATE 'CREATE DATABASE LINK zone_sud_link
                       CONNECT TO c##zone_sud IDENTIFIED BY sud123
                       USING ''XE''';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2011 THEN
            RAISE;
        END IF;
END;
/
