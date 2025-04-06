CREATE OR REPLACE TRIGGER trg_insert_preinscriptions
AFTER INSERT ON preinscriptions
FOR EACH ROW
DECLARE
    v_zone VARCHAR2(20);
BEGIN
    -- Récupérer la zone à partir du ENO_FK de l'étudiant
    SELECT zone INTO v_zone
    FROM enos
    WHERE eno_id = (
        SELECT eno_fk FROM etudiants WHERE ine = :NEW.ine_fk
    );

    -- Insérer dans la bonne table selon la zone
    IF v_zone = 'NORD' THEN
        INSERT INTO preinscriptions_nord VALUES (:NEW.preinscription_id, :NEW.ine_fk, :NEW.filiere_fk, :NEW.annee_academique, :NEW.statut);
    ELSIF v_zone = 'CENTRE' THEN
        INSERT INTO preinscriptions_centre VALUES (:NEW.preinscription_id, :NEW.ine_fk, :NEW.filiere_fk, :NEW.annee_academique, :NEW.statut);
    ELSIF v_zone = 'CAP-VERT' THEN
        INSERT INTO preinscriptions_capvert VALUES (:NEW.preinscription_id, :NEW.ine_fk, :NEW.filiere_fk, :NEW.annee_academique, :NEW.statut);
    ELSIF v_zone = 'SUD' THEN
        INSERT INTO preinscriptions_sud VALUES (:NEW.preinscription_id, :NEW.ine_fk, :NEW.filiere_fk, :NEW.annee_academique, :NEW.statut);
    END IF;
END;
/
