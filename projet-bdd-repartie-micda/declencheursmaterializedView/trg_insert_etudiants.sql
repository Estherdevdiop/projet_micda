CREATE OR REPLACE TRIGGER trg_insert_etudiants
AFTER INSERT ON etudiants
FOR EACH ROW
DECLARE
  v_zone VARCHAR2(20);
BEGIN
  SELECT zone INTO v_zone FROM enos WHERE eno_id = :NEW.eno_fk;

  IF v_zone = 'NORD' THEN
    INSERT INTO etudiants_nord VALUES (:NEW.ine, :NEW.nom, :NEW.prenom, :NEW.date_nai, :NEW.eno_fk);
  ELSIF v_zone = 'CENTRE' THEN
    INSERT INTO etudiants_centre VALUES (:NEW.ine, :NEW.nom, :NEW.prenom, :NEW.date_nai, :NEW.eno_fk);
  ELSIF v_zone = 'CAP-VERT' THEN
    INSERT INTO etudiants_capvert VALUES (:NEW.ine, :NEW.nom, :NEW.prenom, :NEW.date_nai, :NEW.eno_fk);
  ELSIF v_zone = 'SUD' THEN
    INSERT INTO etudiants_sud VALUES (:NEW.ine, :NEW.nom, :NEW.prenom, :NEW.date_nai, :NEW.eno_fk);
  END IF;
END;
