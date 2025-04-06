-- Synonymes pour la zone NORD
CREATE SYNONYM etudiants_nord_syn FOR etudiants_nord@zone_nord_link;
CREATE SYNONYM preinscriptions_nord_syn FOR preinscriptions_nord@zone_nord_link;
CREATE SYNONYM inscriptions_nord_syn FOR inscriptions_nord@zone_nord_link;

-- Synonymes pour la zone CENTRE
CREATE SYNONYM etudiants_centre_syn FOR etudiants_centre@zone_centre_link;
CREATE SYNONYM preinscriptions_centre_syn FOR preinscriptions_centre@zone_centre_link;
CREATE SYNONYM inscriptions_centre_syn FOR inscriptions_centre@zone_centre_link;

-- Synonymes pour la zone CAP-VERT
CREATE SYNONYM etudiants_capvert_syn FOR etudiants_capvert@zone_capvert_link;
CREATE SYNONYM preinscriptions_capvert_syn FOR preinscriptions_capvert@zone_capvert_link;
CREATE SYNONYM inscriptions_capvert_syn FOR inscriptions_capvert@zone_capvert_link;

-- Synonymes pour la zone SUD
CREATE SYNONYM etudiants_sud_syn FOR etudiants_sud@zone_sud_link;
CREATE SYNONYM preinscriptions_sud_syn FOR preinscriptions_sud@zone_sud_link;
CREATE SYNONYM inscriptions_sud_syn FOR inscriptions_sud@zone_sud_link;
