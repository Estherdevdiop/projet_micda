CREATE OR REPLACE TRIGGER trg_insert_inscriptions
AFTER INSERT ON inscriptions
FOR EACH ROW
DECLARE
    v_zone VARCHAR2(20);
BEGIN
    -- Récupérer la zone à partir du ENO_FK de l’étudiant
    SELECT zone INTO v_zone
    FROM enos
    WHERE eno_id = (
        SELECT eno_fk FROM etudiants WHERE ine = :NEW.ine_fk
    );

    -- Insérer dans la bonne table selon la zone
    IF v_zone = 'NORD' THEN
        INSERT INTO inscriptions_nord VALUES (:NEW.inscription_id, :NEW.ine_fk, :NEW.filiere_fk, :NEW.annee_academique, :NEW.statut);
    ELSIF v_zone = 'CENTRE' THEN
        INSERT INTO inscriptions_centre VALUES (:NEW.inscription_id, :NEW.ine_fk, :NEW.filiere_fk, :NEW.annee_academique, :NEW.statut);
    ELSIF v_zone = 'CAP-VERT' THEN
        INSERT INTO inscriptions_capvert VALUES (:NEW.inscription_id, :NEW.ine_fk, :NEW.filiere_fk, :NEW.annee_academique, :NEW.statut);
    ELSIF v_zone = 'SUD' THEN
        INSERT INTO inscriptions_sud VALUES (:NEW.inscription_id, :NEW.ine_fk, :NEW.filiere_fk, :NEW.annee_academique, :NEW.statut);
    END IF;
END;
/
