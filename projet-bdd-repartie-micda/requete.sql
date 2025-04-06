SELECT e.ine, e.nom, e.prenom, f.nom_filiere AS filiere, en.nom_eno, i.annee_academique
FROM inscriptions i
JOIN etudiants e ON i.ine_fk = e.ine
JOIN filieres f ON i.filiere_fk = f.filiere_id
JOIN enos en ON e.eno_fk = en.eno_id
WHERE f.nom_filiere = 'MIC'
  AND en.nom_eno = 'ENO Dakar'
  AND i.annee_academique = '2021/2022';


-- Requête 2 : Filières ayant plus de 1000 préinscriptions en 2021/2022
SELECT f.nom_filiere, COUNT(*) AS nombre_preinscriptions
FROM preinscriptions p
JOIN filieres f ON p.filiere_fk = f.filiere_id
WHERE p.annee_academique = '2021/2022'
GROUP BY f.nom_filiere
HAVING COUNT(*) > 1000;

-- Requête 3 :
SELECT e.ine, e.nom, e.prenom, f.nom_filiere, i.annee_academique, i.statut
FROM inscriptions i
JOIN etudiants e ON i.ine_fk = e.ine
JOIN filieres f ON i.filiere_fk = f.filiere_id
WHERE i.annee_academique = '2024/2025';

-- Requête 4 :
SELECT e.ine, e.nom, e.prenom, p.annee_academique, en.zone
FROM preinscriptions p
JOIN etudiants e ON p.ine_fk = e.ine
JOIN enos en ON e.eno_fk = en.eno_id
WHERE p.annee_academique = '2022/2023';

-- Requête 5 :

SELECT e.ine, e.nom, e.prenom
FROM etudiants e
JOIN inscriptions i ON e.ine = i.ine_fk
JOIN preinscriptions p ON e.ine = p.ine_fk
WHERE p.statut = 'VALIDE'
GROUP BY e.ine, e.nom, e.prenom
HAVING COUNT(DISTINCT i.inscription_id) = COUNT(DISTINCT CASE WHEN p.statut = 'VALIDE' THEN p.preinscription_id END);

-- Requête 6 :

SELECT 
    en.nom_eno,
    COUNT(*) AS total_inscriptions,
    SUM(CASE 
            WHEN i.statut IN ('DIPLOME', 'VALIDE') THEN 1 
            ELSE 0 
        END) AS reussites,
    ROUND(
        (SUM(CASE 
                WHEN i.statut IN ('DIPLOME', 'VALIDE') THEN 1 
                ELSE 0 
            END) * 100.0) / COUNT(*), 
        2
    ) AS taux_reussite
FROM inscriptions i
JOIN etudiants e ON i.ine_fk = e.ine
JOIN enos en ON e.eno_fk = en.eno_id
WHERE i.annee_academique = '2021/2022'
GROUP BY en.nom_eno
ORDER BY taux_reussite DESC
FETCH FIRST 3 ROWS ONLY;


-- Requête 7 :

SELECT f.nom_filiere, COUNT(*) AS total_bien
FROM inscriptions i
JOIN filieres f ON i.filiere_fk = f.filiere_id
WHERE f.nom_filiere LIKE '%L3%'
  AND i.mention = 'BIEN'
  AND i.annee_academique = '2021/2022'
GROUP BY f.nom_filiere;


