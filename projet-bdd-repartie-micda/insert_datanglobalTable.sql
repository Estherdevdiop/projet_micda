-- -------------------------------
-- INSERTION DES DONNEES DANS LA BASE GLOBALE
-- -------------------------------

-- ENOS
INSERT INTO enos (nom_eno, zone) VALUES ('ENO SAINT-LOUIS', 'NORD');
INSERT INTO enos (nom_eno, zone) VALUES ('ENO KAOLACK', 'CENTRE');
INSERT INTO enos (nom_eno, zone) VALUES ('ENO DAKAR', 'CAP-VERT');
INSERT INTO enos (nom_eno, zone) VALUES ('ENO KOLDA', 'SUD');

-- ENSEIGNANTS
INSERT INTO enseignants (nom, prenom, grade, eno_fk) VALUES ('DIA', 'Aminata', 'PROFESSEUR', 1);
INSERT INTO enseignants (nom, prenom, grade, eno_fk) VALUES ('NDIAYE', 'Moussa', 'MAITRE_CONFERENCE', 2);
INSERT INTO enseignants (nom, prenom, grade, eno_fk) VALUES ('SOW', 'Fatou', 'ASSISTANT', 3);
INSERT INTO enseignants (nom, prenom, grade, eno_fk) VALUES ('BA', 'Ousmane', 'PROFESSEUR', 4);

-- POLES
INSERT INTO poles (nom_pole, responsable_pole_fk) VALUES ('Sciences', 1);
INSERT INTO poles (nom_pole, responsable_pole_fk) VALUES ('Lettres', 2);

-- FORMATIONS
INSERT INTO formations (nom_formation, pole_fk, responsable_formation_fk) VALUES ('Informatique', 1, 1);
INSERT INTO formations (nom_formation, pole_fk, responsable_formation_fk) VALUES ('Linguistique', 2, 2);

-- FILIERES
INSERT INTO filieres (nom_filiere, formation_fk) VALUES ('SIL', 1);
INSERT INTO filieres (nom_filiere, formation_fk) VALUES ('Anglais', 2);

-- UNITES D'ENSEIGNEMENT
INSERT INTO unites_enseignement (nom_ue, code_ue, filiere_fk) VALUES ('Programmation', 'PRG101', 1);
INSERT INTO unites_enseignement (nom_ue, code_ue, filiere_fk) VALUES ('Grammaire', 'GRM202', 2);

-- ETUDIANTS
INSERT INTO etudiants (ine, nom, prenom, date_naissance, eno_fk) VALUES ('INE001', 'DIOP', 'Saliou', TO_DATE('2000-05-10', 'YYYY-MM-DD'), 1); -- NORD
INSERT INTO etudiants (ine, nom, prenom, date_naissance, eno_fk) VALUES ('INE002', 'FALL', 'Khady', TO_DATE('2001-03-12', 'YYYY-MM-DD'), 2); -- CENTRE
INSERT INTO etudiants (ine, nom, prenom, date_naissance, eno_fk) VALUES ('INE003', 'GUEYE', 'Abdou', TO_DATE('1999-09-20', 'YYYY-MM-DD'), 3); -- CAP-VERT
INSERT INTO etudiants (ine, nom, prenom, date_naissance, eno_fk) VALUES ('INE004', 'SECK', 'Mame', TO_DATE('2002-01-15', 'YYYY-MM-DD'), 4); -- SUD

-- PREINSCRIPTIONS
INSERT INTO preinscriptions (ine_fk, filiere_fk, annee_academique, statut) VALUES ('INE001', 1, '2024/2025', 'EN_ATTENTE');
INSERT INTO preinscriptions (ine_fk, filiere_fk, annee_academique, statut) VALUES ('INE002', 2, '2024/2025', 'VALIDE');
INSERT INTO preinscriptions (ine_fk, filiere_fk, annee_academique, statut) VALUES ('INE003', 1, '2024/2025', 'REJETE');
INSERT INTO preinscriptions (ine_fk, filiere_fk, annee_academique, statut) VALUES ('INE004', 2, '2024/2025', 'VALIDE');

-- INSCRIPTIONS
INSERT INTO inscriptions (ine_fk, filiere_fk, annee_academique, statut) VALUES ('INE001', 1, '2024/2025', 'ACTIF');
INSERT INTO inscriptions (ine_fk, filiere_fk, annee_academique, statut) VALUES ('INE002', 2, '2024/2025', 'DIPLOME');
INSERT INTO inscriptions (ine_fk, filiere_fk, annee_academique, statut) VALUES ('INE003', 1, '2024/2025', 'ABANDON');
INSERT INTO inscriptions (ine_fk, filiere_fk, annee_academique, statut) VALUES ('INE004', 2, '2024/2025', 'ACTIF');

-- Commit
COMMIT;
