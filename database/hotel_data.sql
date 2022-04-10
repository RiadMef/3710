SET search_path = bdSchema;

INSERT INTO BDSCHEMA.Sol (typeSol)
VALUES ('Sableux'),
	   ('Sol limoneux') ON CONFLICT DO NOTHING;

INSERT INTO BDSCHEMA.Jardin (identifiantJardin, nomJardin, surface, hauteurMaximale, potagerJardinFlag, ornementJardinFlag, vergerJardinFlag, typeSol)
VALUES ('J1', 'Jardin Divers', '100m2', NULL, TRUE, TRUE, TRUE, 'Sableux'),
       ('J2', 'Jardin Bleu', '50m2', '5m', TRUE, TRUE, FALSE, 'Sol limoneux'),
       ('J3', 'Jardin Sage', '150m2', NULL, FALSE, TRUE, FALSE, NULL),
	   ('J4', 'Jardin Sage', '150m2', '8m', TRUE, FALSE, TRUE, 'Sableux'),
	   ('J5', 'Jardin Sage', '150m2', NULL, FALSE, TRUE, TRUE, NULL) ON CONFLICT DO NOTHING;
	   
INSERT INTO BDSCHEMA.Parcelle (identifiantJardin, parcelleID, coordonneeParcelle, dimensionParcelle)
VALUES ('J1', 'P1', '(0,0)', '10m2'),
       ('J1', 'P2', '(10,10)', '20m2'),
       ('J3', 'P3', '(100,100)', '15m2'),
	   ('J2', 'P4', '(50,50)', '10m2'),
	   ('J1', 'P5', '(25,25)', '5m2'),
       ('J4', 'P6', '(100,0)', '10m2'),
	   ('J3', 'P7', '(20,15)', '13m2') ON CONFLICT DO NOTHING;
	   
INSERT INTO BDSCHEMA.Rang (numeroRang, parcelleID, coordonneeRang, jachere)
VALUES ('1', 'P1', '(10,0)', NULL),
       ('2', 'P7', '(15,10)', NULL),
       ('3', 'P5', '(40,43)', '1 mois'),
	   ('4', 'P4', '(35,19)', NULL),
	   ('5', 'P3', '(25,25)', '5 mois'),
       ('6', 'P1', '(39,0)', NULL),
	   ('7', 'P2', '(20,15)', NULL),
	   ('8', 'P6', '(50,10)', '2 mois'),
	   ('9', 'P2', '(20,100)', '3 mois') ON CONFLICT DO NOTHING;
	   
INSERT INTO BDSCHEMA.Variete (nomVariete, descriptionSemis, descriptionPlantation, descriptionEntretien, descriptionMiseEnPlace, descriptionRecolte, commentaireGeneral, descriptionPeriodeRecolte, anneeMiseEnMarchee)
VALUES ('Rosa', 'Le semis est incontournable pour la production de nouvelles variétés par hybridation.', 'La plantation seffectue en automne et hiver (de novembre à mars dans lhémisphère nord), dans un sol bien défoncé puis reposé.',
		'Pour entretenir des roses coupées, il faut veiller à deux éléments particulièrement essentiel : leur exposition et leur hydratation abondante.', 'Au soleil.', 'Mettre des gants, ca pique', 'Sens bon', 'Entre le 20 mars et le 5 aout', '1953'),
       ('Tulipa', 'Le semis doit bien être hydrater', 'La plantation doit se faire a lautomne', 'Pas dentretien necessaire', 'Les tulipes doivent être espacé de minimalement 20cm une des autres', 'Faire attention a ne pas briser la tige lors de la récolte', 
	   'Plusieurs espèces sont largement cultivées comme plantes ornementales et ont donné lieu à la création de plusieurs milliers de variétés.', 'La tulipe peut être récolté au début du printemps', '1987'),
       ('Cucurbita', 'Les fleurs femelles apparaissent souvent après les mâles. Il vaut donc mieux étaler les semis afin de favoriser des périodes de croisement entre les différents plants.', 'La plantation se fait au printemps',
		'Besoin important deau dans les 3 premieres semaines de plantation', 'Doit être entreposé dans un coin ayant beaucoup de soleil', 'Peut être récolté lorsque quelle atteint une taille de 20cm', 'Le terme courge, ou plus rarement cougourde, désigne plusieurs espèces de plantes de la famille des cucurbitacées.', 
	   'Peut être récolté vers le début de lété', '1976'),
	   ('Vitis', 'Les racines issues de semis (avec même en condition humide de possibles racines aériennes apparaissant à la base de troncs issus de semis', 'La plantation peut se faire à partir de novembre lorsque la vigne est en repos végétatif (chute des feuilles).',
		'Aucun besoin darrosage', 'La mise en place est prête au printemps', 'Peut faire plusieurs types de fruits comme raisin', 'La plupart des vignes sont des plantes grimpantes des régions au climat tempéré ou de type méditerranéen.', 
	   'Peut être récolté vers la fin de lété', '2001'),
	   ('Tuberosum', 'Il faut sassurer un espacement de 15 cm minimum entre les semis', 'La plantation seffectue au printemps', 'Les plants ont besoin detre arroser minimum aux deux jours', 'Mettre les plants dans un endroit ensoleillé', 'À faire attention de ne pas abimer la chaire lors de la récolte et être minutieux',
		'La tuberosum est traditionnellement cultivée pour son tubercule comestible, principale source de nourriture dans la région montagneuse des Andes', 'La récolte se fait vers la derniere semaine de juillet', '1975') ON CONFLICT DO NOTHING;

INSERT INTO BDSCHEMA.RangVariete (numeroRang, nomVariete, typeMiseEnPlace)
VALUES ('1', 'Rosa', 'Semis/Graines'),
       ('2', 'Vitis', 'Graine'),
       ('3', 'Cucurbita', 'Graine'),
	   ('9', 'Tulipa', 'Bulbe'),
	   ('3', 'Vitis', 'Graine'),
       ('6', 'Rosa', 'Semis/Graines'),
	   ('7', 'Vitis', 'Graine'),
       ('7', 'Tuberosum', 'Graines'),
	   ('4', 'Tuberosum', 'Graines') ON CONFLICT DO NOTHING;
	   
INSERT INTO BDSCHEMA.Plante (identifiantJardin, nomPlante, nomVariete, categoriePlante, typePlante, sousTypePlante, nomLatinPlante)
VALUES ('J1', 'Rosiers Pimprenelle', 'Rosa', 'Magnoliophyta', 'Rosaceae', 'Rosoideae', 'Rosa Pimpinellifolia'),
       ('J2', 'Rosiers de Provins', 'Rosa', 'Magnoliophyta', 'Rosaceae', 'Rosoideae', 'Rosa gallica'),
       ('J3', 'Vigne caméléon', 'Vitis', 'Ranunculales', 'Lardizabalaceae', 'Lardizabaloideae', 'Boquila trifoliolata'),
	   ('J3', 'Airelle rouge', 'Vitis', 'Magnoliopsida', 'Ericaceae', NULL, 'Vaccinium vitis-idaea'),
	   ('J4', 'Tulipe Agen', 'Tulipa', 'Liliales', 'Liliaceae', 'Alliaceae', 'Tulipa agenensis'),
       ('J1', 'Tulipe des jardins', 'Tulipa', 'Liliales', 'Liliaceae', 'Alliaceae', 'Tulipa gesneriana'),
	   ('J5', 'Tulipe des jardins', 'Tulipa', 'Liliales', 'Liliaceae', NULL, 'Tulipa gesneriana'),
	   ('J2', 'Courge de Siam', 'Cucurbita', 'Magnoliopsida', 'Cucurbitaceae', NULL, 'Cucurbita ficifolia'),
	   ('J4', 'Courge du Mexique', 'Cucurbita', 'Magnoliopsida', 'Cucurbitaceae', 'Cucurbitoideae', 'Cucurbita argyrosperma'),
	   ('J5', 'Grande Capucine', 'Tuberosum', 'Brassicales', 'Tropaeolaceae', NULL, 'Tropaeolum tuberosum'),
	   ('J1', 'Capucine tubéreuse', 'Tuberosum', 'Magnoliopsida', 'Tropaeolaceae', NULL, 'Tropaeolum majus'),
	   ('J2', 'Fougère', 'Vitis', 'Filicopsida', 'Dennstaedtiaceae', NULL, 'Pteridium aquilinum') ON CONFLICT DO NOTHING;
	   
INSERT INTO BDSCHEMA.AssociationPlante (beneficeInconvenient, nomLatinPlante1, nomLatinPlante2)
VALUES ('Protection', 'Tulipa agenensis', 'Tulipa gesneriana'),
       ('Protection', 'Tropaeolum tuberosum', 'Cucurbita argyrosperma'),
       ('Épuissement minéraux', 'Rosa Pimpinellifolia', 'Tropaeolum majus'),
	   ('Protection', 'Vaccinium vitis-idaea', 'Boquila trifoliolata'),
	   ('Épuissement minéraux', 'Rosa gallica', 'Rosa Pimpinellifolia'),
       ('Protection', 'Cucurbita argyrosperma', 'Rosa gallica') ON CONFLICT DO NOTHING;
	   
INSERT INTO BDSCHEMA.Menace (descriptionMenace, solutionMenace, typeMenace, nomLatinPlante)
VALUES ('Qui est sec et qui manque dhumidité au niveau du sol', 'Arrosage quotidien', 'Sécheresse', 'Tulipa gesneriana'),
	   ('Les pucerons peuvent notamment nuire à la circulation de la sève et ainsi entraîner un affaiblissement et une perturbation de la croissance de la plante affectée', 'Taillez et jetez les tiges et les feuilles trop infestées', 'Attaque de puceron', 'Cucurbita argyrosperma'),
       ('Là où elle est déjà établie, la punaise marbrée cause d’importants dommages à une grande diversité de cultures', 'Application dinsecticide', 'Attaque de punaise marbrée', 'Pteridium aquilinum'),
       ('L’alliaire officinale (Alliaria petiolata) est une espèce envahissante d’origine européenne.', 'Arrachez les plants dallaire avant quils ne produisent des graines', 'L’alliaire officinale', 'Pteridium aquilinum') ON CONFLICT DO NOTHING;

INSERT INTO BDSCHEMA.Semancier (nomSemancier, biologique, siteWeb, nomVariete)
VALUES ('Pepper Seedz', TRUE, 'https://www.pepperseedz.com/', 'Rosa'),
	   ('Potager ornemental de Catherine', FALSE, 'http://www.potagerornemental.com/', 'Tulipa'),
       ('Récolte Sauvage', TRUE, 'http://recoltesauvage.com/', 'Cucurbita'),
	   ('Le jardin des vie-la-joie', FALSE, 'http://vielajoie.com/', 'Vitis'),
       ('Les semences Nouveau Paysan', FALSE, 'https://nouveaupaysan.com/', 'Tuberosum') ON CONFLICT DO NOTHING;
	   
INSERT INTO BDSCHEMA.Adaptation (typeSol, adapte, nomVariete)
VALUES ('Sol limoneux', 'Très adapté', 'Rosa'),
	   ('Sableux', 'Peu adapté','Tulipa'),
       ('Sol limoneux', 'Un peu adapté','Cucurbita'),
	   ('Sableux', 'Non adapté', 'Vitis'),
       ('Sol limoneux', 'Non adapté', 'Tuberosum') ON CONFLICT DO NOTHING;

SET search_path = bdSchema;

INSERT INTO BDSCHEMA.Sol (typeSol)
VALUES ('Sableux'),
	   ('Sol limoneux') ON CONFLICT DO NOTHING;

INSERT INTO BDSCHEMA.Jardin (identifiantJardin, nomJardin, surface, hauteurMaximale, potagerJardinFlag, ornementJardinFlag, vergerJardinFlag, typeSol)
VALUES ('J1', 'Jardin Divers', '100m2', NULL, TRUE, TRUE, TRUE, 'Sableux'),
       ('J2', 'Jardin Bleu', '50m2', '5m', TRUE, TRUE, FALSE, 'Sol limoneux'),
       ('J3', 'Jardin Sage', '150m2', NULL, FALSE, TRUE, FALSE, NULL),
	   ('J4', 'Jardin Sage', '150m2', '8m', TRUE, FALSE, TRUE, 'Sableux'),
	   ('J5', 'Jardin Sage', '150m2', NULL, FALSE, TRUE, TRUE, NULL) ON CONFLICT DO NOTHING;
	   
INSERT INTO BDSCHEMA.Parcelle (identifiantJardin, parcelleID, coordonneeParcelle, dimensionParcelle)
VALUES ('J1', 'P1', '(0,0)', '10m2'),
       ('J1', 'P2', '(10,10)', '20m2'),
       ('J3', 'P3', '(100,100)', '15m2'),
	   ('J2', 'P4', '(50,50)', '10m2'),
	   ('J1', 'P5', '(25,25)', '5m2'),
       ('J4', 'P6', '(100,0)', '10m2'),
	   ('J3', 'P7', '(20,15)', '13m2') ON CONFLICT DO NOTHING;
	   
INSERT INTO BDSCHEMA.Rang (numeroRang, parcelleID, coordonneeRang, jachere)
VALUES ('1', 'P1', '(10,0)', NULL),
       ('2', 'P7', '(15,10)', NULL),
       ('3', 'P5', '(40,43)', '1 mois'),
	   ('4', 'P4', '(35,19)', NULL),
	   ('5', 'P3', '(25,25)', '5 mois'),
       ('6', 'P1', '(39,0)', NULL),
	   ('7', 'P2', '(20,15)', NULL),
	   ('8', 'P6', '(50,10)', '2 mois'),
	   ('9', 'P2', '(20,100)', '3 mois') ON CONFLICT DO NOTHING;
	   
INSERT INTO BDSCHEMA.Variete (nomVariete, descriptionSemis, descriptionPlantation, descriptionEntretien, descriptionMiseEnPlace, descriptionRecolte, commentaireGeneral, descriptionPeriodeRecolte, anneeMiseEnMarchee)
VALUES ('Rosa', 'Le semis est incontournable pour la production de nouvelles variétés par hybridation.', 'La plantation seffectue en automne et hiver (de novembre à mars dans lhémisphère nord), dans un sol bien défoncé puis reposé.',
		'Pour entretenir des roses coupées, il faut veiller à deux éléments particulièrement essentiel : leur exposition et leur hydratation abondante.', 'Au soleil.', 'Mettre des gants, ca pique', 'Sens bon', 'Entre le 20 mars et le 5 aout', '1953'),
       ('Tulipa', 'Le semis doit bien être hydrater', 'La plantation doit se faire a lautomne', 'Pas dentretien necessaire', 'Les tulipes doivent être espacé de minimalement 20cm une des autres', 'Faire attention a ne pas briser la tige lors de la récolte', 
	   'Plusieurs espèces sont largement cultivées comme plantes ornementales et ont donné lieu à la création de plusieurs milliers de variétés.', 'La tulipe peut être récolté au début du printemps', '1987'),
       ('Cucurbita', 'Les fleurs femelles apparaissent souvent après les mâles. Il vaut donc mieux étaler les semis afin de favoriser des périodes de croisement entre les différents plants.', 'La plantation se fait au printemps',
		'Besoin important deau dans les 3 premieres semaines de plantation', 'Doit être entreposé dans un coin ayant beaucoup de soleil', 'Peut être récolté lorsque quelle atteint une taille de 20cm', 'Le terme courge, ou plus rarement cougourde, désigne plusieurs espèces de plantes de la famille des cucurbitacées.', 
	   'Peut être récolté vers le début de lété', '1976'),
	   ('Vitis', 'Les racines issues de semis (avec même en condition humide de possibles racines aériennes apparaissant à la base de troncs issus de semis', 'La plantation peut se faire à partir de novembre lorsque la vigne est en repos végétatif (chute des feuilles).',
		'Aucun besoin darrosage', 'La mise en place est prête au printemps', 'Peut faire plusieurs types de fruits comme raisin', 'La plupart des vignes sont des plantes grimpantes des régions au climat tempéré ou de type méditerranéen.', 
	   'Peut être récolté vers la fin de lété', '2001'),
	   ('Tuberosum', 'Il faut sassurer un espacement de 15 cm minimum entre les semis', 'La plantation seffectue au printemps', 'Les plants ont besoin detre arroser minimum aux deux jours', 'Mettre les plants dans un endroit ensoleillé', 'À faire attention de ne pas abimer la chaire lors de la récolte et être minutieux',
		'La tuberosum est traditionnellement cultivée pour son tubercule comestible, principale source de nourriture dans la région montagneuse des Andes', 'La récolte se fait vers la derniere semaine de juillet', '1975') ON CONFLICT DO NOTHING;

INSERT INTO BDSCHEMA.RangVariete (numeroRang, nomVariete, typeMiseEnPlace)
VALUES ('1', 'Rosa', 'Semis/Graines'),
       ('2', 'Vitis', 'Graine'),
       ('3', 'Cucurbita', 'Graine'),
	   ('9', 'Tulipa', 'Bulbe'),
	   ('3', 'Vitis', 'Graine'),
       ('6', 'Rosa', 'Semis/Graines'),
	   ('7', 'Vitis', 'Graine'),
       ('7', 'Tuberosum', 'Graines'),
	   ('4', 'Tuberosum', 'Graines') ON CONFLICT DO NOTHING;
	   
INSERT INTO BDSCHEMA.Plante (identifiantJardin, nomPlante, nomVariete, categoriePlante, typePlante, sousTypePlante, nomLatinPlante)
VALUES ('J1', 'Rosiers Pimprenelle', 'Rosa', 'Magnoliophyta', 'Rosaceae', 'Rosoideae', 'Rosa Pimpinellifolia'),
       ('J2', 'Rosiers de Provins', 'Rosa', 'Magnoliophyta', 'Rosaceae', 'Rosoideae', 'Rosa gallica'),
       ('J3', 'Vigne caméléon', 'Vitis', 'Ranunculales', 'Lardizabalaceae', 'Lardizabaloideae', 'Boquila trifoliolata'),
	   ('J3', 'Airelle rouge', 'Vitis', 'Magnoliopsida', 'Ericaceae', NULL, 'Vaccinium vitis-idaea'),
	   ('J4', 'Tulipe Agen', 'Tulipa', 'Liliales', 'Liliaceae', 'Alliaceae', 'Tulipa agenensis'),
       ('J1', 'Tulipe des jardins', 'Tulipa', 'Liliales', 'Liliaceae', 'Alliaceae', 'Tulipa gesneriana'),
	   ('J5', 'Tulipe des jardins', 'Tulipa', 'Liliales', 'Liliaceae', NULL, 'Tulipa gesneriana'),
	   ('J2', 'Courge de Siam', 'Cucurbita', 'Magnoliopsida', 'Cucurbitaceae', NULL, 'Cucurbita ficifolia'),
	   ('J4', 'Courge du Mexique', 'Cucurbita', 'Magnoliopsida', 'Cucurbitaceae', 'Cucurbitoideae', 'Cucurbita argyrosperma'),
	   ('J5', 'Grande Capucine', 'Tuberosum', 'Brassicales', 'Tropaeolaceae', NULL, 'Tropaeolum tuberosum'),
	   ('J1', 'Capucine tubéreuse', 'Tuberosum', 'Magnoliopsida', 'Tropaeolaceae', NULL, 'Tropaeolum majus'),
	   ('J2', 'Fougère', 'Vitis', 'Filicopsida', 'Dennstaedtiaceae', NULL, 'Pteridium aquilinum') ON CONFLICT DO NOTHING;
	   
INSERT INTO BDSCHEMA.AssociationPlante (beneficeInconvenient, nomLatinPlante1, nomLatinPlante2)
VALUES ('Protection', 'Tulipa agenensis', 'Tulipa gesneriana'),
       ('Protection', 'Tropaeolum tuberosum', 'Cucurbita argyrosperma'),
       ('Épuissement minéraux', 'Rosa Pimpinellifolia', 'Tropaeolum majus'),
	   ('Protection', 'Vaccinium vitis-idaea', 'Boquila trifoliolata'),
	   ('Épuissement minéraux', 'Rosa gallica', 'Rosa Pimpinellifolia'),
       ('Protection', 'Cucurbita argyrosperma', 'Rosa gallica') ON CONFLICT DO NOTHING;
	   
INSERT INTO BDSCHEMA.Menace (descriptionMenace, solutionMenace, typeMenace, nomLatinPlante)
VALUES ('Qui est sec et qui manque dhumidité au niveau du sol', 'Arrosage quotidien', 'Sécheresse', 'Tulipa gesneriana'),
	   ('Les pucerons peuvent notamment nuire à la circulation de la sève et ainsi entraîner un affaiblissement et une perturbation de la croissance de la plante affectée', 'Taillez et jetez les tiges et les feuilles trop infestées', 'Attaque de puceron', 'Cucurbita argyrosperma'),
       ('Là où elle est déjà établie, la punaise marbrée cause d’importants dommages à une grande diversité de cultures', 'Application dinsecticide', 'Attaque de punaise marbrée', 'Pteridium aquilinum'),
       ('L’alliaire officinale (Alliaria petiolata) est une espèce envahissante d’origine européenne.', 'Arrachez les plants dallaire avant quils ne produisent des graines', 'L’alliaire officinale', 'Pteridium aquilinum') ON CONFLICT DO NOTHING;

INSERT INTO BDSCHEMA.Semancier (nomSemancier, biologique, siteWeb, nomVariete)
VALUES ('Pepper Seedz', TRUE, 'https://www.pepperseedz.com/', 'Rosa'),
	   ('Potager ornemental de Catherine', FALSE, 'http://www.potagerornemental.com/', 'Tulipa'),
       ('Récolte Sauvage', TRUE, 'http://recoltesauvage.com/', 'Cucurbita'),
	   ('Le jardin des vie-la-joie', FALSE, 'http://vielajoie.com/', 'Vitis'),
       ('Les semences Nouveau Paysan', FALSE, 'https://nouveaupaysan.com/', 'Tuberosum') ON CONFLICT DO NOTHING;
	   
INSERT INTO BDSCHEMA.Adaptation (typeSol, adapte, nomVariete)
VALUES ('Sol limoneux', 'Très adapté', 'Rosa'),
	   ('Sableux', 'Peu adapté','Tulipa'),
       ('Sol limoneux', 'Un peu adapté','Cucurbita'),
	   ('Sableux', 'Non adapté', 'Vitis'),
       ('Sol limoneux', 'Non adapté', 'Tuberosum') ON CONFLICT DO NOTHING;

