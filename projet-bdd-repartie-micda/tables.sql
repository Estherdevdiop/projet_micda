-- 1. ENOS
CREATE TABLE enos (
    eno_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_eno VARCHAR2(100) NOT NULL,
    zone VARCHAR2(10) NOT NULL,
    CONSTRAINT contrainte_zone CHECK (zone IN ('NORD', 'CENTRE', 'CAP-VERT', 'SUD'))
);

-- 2. ENSEIGNANTS
CREATE TABLE enseignants (
    enseignant_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom VARCHAR2(50) NOT NULL,
    prenom VARCHAR2(50) NOT NULL,
    grade VARCHAR2(50) NOT NULL,
    eno_fk NUMBER,
    CONSTRAINT contrainte_cle_etrangere_eno FOREIGN KEY (eno_fk) REFERENCES enos(eno_id),
    CONSTRAINT contrainte_grade CHECK (grade IN ('PROFESSEUR', 'MAITRE_CONFERENCE', 'ASSISTANT'))
);

-- 3. POLES
CREATE TABLE poles (
    pole_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_pole VARCHAR2(100) NOT NULL,
    responsable_pole_fk NUMBER NOT NULL,
    CONSTRAINT contrainte_cle_etrangere_responsable_pole FOREIGN KEY (responsable_pole_fk) REFERENCES enseignants(enseignant_id)
);

-- 4. FORMATIONS
CREATE TABLE formations (
    formation_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_formation VARCHAR2(100) NOT NULL,
    pole_fk NUMBER NOT NULL,
    responsable_formation_fk NUMBER NOT NULL,
    CONSTRAINT contrainte_cle_etrangere_pole FOREIGN KEY (pole_fk) REFERENCES poles(pole_id),
    CONSTRAINT contrainte_cle_etrangere_responsable_formation FOREIGN KEY (responsable_formation_fk) REFERENCES enseignants(enseignant_id)
);

-- 5. FILIERES
CREATE TABLE filieres (
    filiere_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_filiere VARCHAR2(100) NOT NULL,
    formation_fk NUMBER NOT NULL,
    CONSTRAINT contrainte_cle_etrangere_formation FOREIGN KEY (formation_fk) REFERENCES formations(formation_id)
);

-- 6. UNITES_ENSEIGNEMENT
CREATE TABLE unites_enseignement (
    ue_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_ue VARCHAR2(100) NOT NULL,
    code_ue VARCHAR2(10) NOT NULL,
    filiere_fk NUMBER NOT NULL,
    CONSTRAINT contrainte_cle_etrangere_filiere_ue FOREIGN KEY (filiere_fk) REFERENCES filieres(filiere_id)
);

-- 7. ETUDIANTS
CREATE TABLE etudiants (
    ine VARCHAR2(20) PRIMARY KEY,
    nom VARCHAR2(50) NOT NULL,
    prenom VARCHAR2(50) NOT NULL,
    date_naissance DATE NOT NULL,
    eno_fk NUMBER NOT NULL,
    CONSTRAINT contrainte_cle_etrangere_eno_etudiant FOREIGN KEY (eno_fk) REFERENCES enos(eno_id)
);

-- 8. PREINSCRIPTIONS
CREATE TABLE preinscriptions (
    preinscription_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ine_fk VARCHAR2(20) NOT NULL,
    filiere_fk NUMBER NOT NULL,
    annee_academique VARCHAR2(9) NOT NULL,
    statut VARCHAR2(20) DEFAULT 'EN_ATTENTE',
    CONSTRAINT contrainte_cle_etrangere_preinscription_etudiant FOREIGN KEY (ine_fk) REFERENCES etudiants(ine),
    CONSTRAINT contrainte_cle_etrangere_preinscription_filiere FOREIGN KEY (filiere_fk) REFERENCES filieres(filiere_id),
    CONSTRAINT contrainte_verification_annee_preinscription CHECK (annee_academique LIKE '____/____'),
    CONSTRAINT contrainte_verification_status_preinscription CHECK (statut IN ('EN_ATTENTE', 'VALIDE', 'REJETE'))
);

-- 9. INSCRIPTIONS
CREATE TABLE inscriptions (
    inscription_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ine_fk VARCHAR2(20) NOT NULL,
    filiere_fk NUMBER NOT NULL,
    annee_academique VARCHAR2(10) NOT NULL,
    statut VARCHAR2(20) DEFAULT 'ACTIF',
    CONSTRAINT fk_inscription_etudiant FOREIGN KEY (ine_fk) REFERENCES etudiants(ine),
    CONSTRAINT fk_inscription_filiere FOREIGN KEY (filiere_fk) REFERENCES filieres(filiere_id),
    CONSTRAINT contrainte_verification_annee_inscription CHECK (annee_academique LIKE '____/____'),
    CONSTRAINT contrainte_verification_status_inscription CHECK (statut IN ('ACTIF', 'ABANDON', 'DIPLOME'))
);
