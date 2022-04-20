SET search_path = bdSchema;

INSERT INTO BDSCHEMA.Sol (typeSol)
VALUES ('Sableux'),
       ('Sol limoneux');

INSERT INTO BDSCHEMA.Jardin (identifiantJardin, nomJardin, surface, hauteurMaximale, potagerJardinFlag, ornementJardinFlag, vergerJardinFlag, typeSol)
VALUES ('J1', 'Jardin Divers', '100m2', NULL, TRUE, TRUE, TRUE, 'Sableux'),
       ('J2', 'Jardin Bleu', '50m2', '5m', TRUE, TRUE, FALSE, 'Sol limoneux'),
       ('J3', 'Jardin Sage', '150m2', NULL, FALSE, TRUE, FALSE, NULL);
	   
INSERT INTO BDSCHEMA.Parcelle (identifiantJardin, parcelleID, coordonneeParcelle, dimensionParcelle)
VALUES ('J1', 'P1', '(0,0)', '10m2'),
       ('J2', 'P2', '(10,10)', '20m2'),
       ('J3', 'P3', '(100,100)', '15m2'),
	   ('J2', 'P4', '(50,50)', '10m2'),
	   ('J1', 'P5', '(25,25)', '5m2'),
	   ('J2', 'P6', '(50,25)', '15m2');
	   
INSERT INTO BDSCHEMA.Rang (numeroRang, parcelleID, coordonneeRang, jachere)
VALUES ('1', 'P1', '(10,0)', '1 mois'),
       ('2', 'P1', '(15,10)', NULL),
	   ('1', 'P2', '(35,19)', NULL),
	   ('2', 'P2', '(25,25)', '5 mois'),
       ('1', 'P3', '(39,0)', NULL),
	   ('1', 'P4', '(20,15)', NULL),
	   ('1', 'P5', '(20,50)', NULL);
	   
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
		'La tuberosum est traditionnellement cultivée pour son tubercule comestible, principale source de nourriture dans la région montagneuse des Andes', 'La récolte se fait vers la derniere semaine de juillet', '1975');

INSERT INTO BDSCHEMA.RangVariete (numeroRang, parcelleID, nomVariete, typeMiseEnPlace)
VALUES ('2', 'P1', 'Rosa', 'Semis/Graines'),
       ('2', 'P1', 'Vitis', 'Graine'),
       ('2', 'P1', 'Tulipa', 'Graine'),
	   ('1', 'P2', 'Rosa', 'Bulbe'),
	   ('1', 'P2', 'Vitis', 'Graine'),
       ('1', 'P3', 'Tuberosum', 'Semis/Graines'),
	   ('1', 'P3', 'Vitis', 'Graine'),
       ('1', 'P4', 'Vitis', 'Graines'),
	   ('1', 'P4', 'Rosa', 'Graines'),
	   ('1', 'P5', 'Rosa', 'Graines'),
	   ('1', 'P5', 'Tulipa', 'Graines');
	   
INSERT INTO BDSCHEMA.Plante (identifiantJardin, nomPlante, nomVariete, categoriePlante, typePlante, sousTypePlante, nomLatinPlante)
VALUES ('J1', 'Rosiers Pimprenelle', 'Rosa', 'Magnoliophyta', 'Rosaceae', 'Rosoideae', 'Rosa Pimpinellifolia'),
       ('J2', 'Rosiers de Provins', 'Rosa', 'Magnoliophyta', 'Rosaceae', 'Rosoideae', 'Rosa gallica'),
       ('J3', 'Vigne caméléon', 'Vitis', 'Ranunculales', 'Lardizabalaceae', 'Lardizabaloideae', 'Boquila trifoliolata'),
	   ('J3', 'Airelle rouge', 'Vitis', 'Magnoliopsida', 'Ericaceae', NULL, 'Vaccinium vitis-idaea'),
       ('J2', 'Tulipe Agen', 'Tulipa', 'Liliales', 'Liliaceae', 'Alliaceae', 'Tulipa agenensis'),
	   ('J2', 'Tulipe des jardins', 'Tulipa', 'Liliales', 'Liliaceae', NULL, 'Tulipa gesneriana'),
	   ('J2', 'Courge de Siam', 'Cucurbita', 'Magnoliopsida', 'Cucurbitaceae', NULL, 'Cucurbita ficifolia'),
	   ('J3', 'Courge du Mexique', 'Cucurbita', 'Magnoliopsida', 'Cucurbitaceae', 'Cucurbitoideae', 'Cucurbita argyrosperma'),
	   ('J1', 'Grande Capucine', 'Tuberosum', 'Brassicales', 'Tropaeolaceae', NULL, 'Tropaeolum tuberosum'),
	   ('J1', 'Capucine tubéreuse', 'Tuberosum', 'Magnoliopsida', 'Tropaeolaceae', NULL, 'Tropaeolum majus'),
	   ('J2', 'Fougère', 'Vitis', 'Filicopsida', 'Dennstaedtiaceae', NULL, 'Pteridium aquilinum');
	   
INSERT INTO BDSCHEMA.AssociationPlante (beneficeInconvenient, nomLatinPlante1, nomLatinPlante2)
VALUES ('Protection', 'Tulipa agenensis', 'Tulipa gesneriana'),
       ('Protection', 'Tropaeolum tuberosum', 'Cucurbita argyrosperma'),
       ('Épuissement minéraux', 'Rosa Pimpinellifolia', 'Tropaeolum majus'),
	   ('Protection', 'Vaccinium vitis-idaea', 'Boquila trifoliolata'),
	   ('Épuissement minéraux', 'Rosa gallica', 'Rosa Pimpinellifolia'),
       ('Protection', 'Cucurbita argyrosperma', 'Rosa gallica');
	   
INSERT INTO BDSCHEMA.Menace (descriptionMenace, solutionMenace, typeMenace, nomLatinPlante)
VALUES ('Qui est sec et qui manque dhumidité au niveau du sol', 'Arrosage quotidien', 'Sécheresse', 'Tulipa gesneriana'),
	   ('Les pucerons peuvent notamment nuire à la circulation de la sève et ainsi entraîner un affaiblissement et une perturbation de la croissance de la plante affectée', 'Taillez et jetez les tiges et les feuilles trop infestées', 'Attaque de puceron', 'Cucurbita argyrosperma'),
       ('Là où elle est déjà établie, la punaise marbrée cause d’importants dommages à une grande diversité de cultures', 'Application dinsecticide', 'Attaque de punaise marbrée', 'Pteridium aquilinum'),
       ('L’alliaire officinale (Alliaria petiolata) est une espèce envahissante d’origine européenne.', 'Arrachez les plants dallaire avant quils ne produisent des graines', 'L’alliaire officinale', 'Pteridium aquilinum') ON CONFLICT DO NOTHING;

INSERT INTO BDSCHEMA.Semancier (nomSemancier, siteWeb)
VALUES ('Pepper Seedz', 'https://www.pepperseedz.com/'),
	   ('Potager ornemental de Catherine', 'http://www.potagerornemental.com/'),
       ('Récolte Sauvage', 'http://recoltesauvage.com/'),
	   ('Le jardin des vie-la-joie',  'http://vielajoie.com/'),
       ('Les semences Nouveau Paysan',  'https://nouveaupaysan.com/');
	   
INSERT INTO BDSCHEMA.Adaptation (typeSol, adapte, nomVariete)
VALUES ('Sol limoneux', 'Très adapté', 'Rosa'),
	   ('Sableux', 'Peu adapté','Tulipa'),
       ('Sol limoneux', 'Un peu adapté','Cucurbita'),
	   ('Sableux', 'Non adapté', 'Vitis'),
       ('Sol limoneux', 'Non adapté', 'Tuberosum');

INSERT INTO BDSCHEMA.VarieteSemancier (nomSemancier, biologique, nomVariete)
VALUES ('Pepper Seedz', TRUE, 'Rosa'),
	   ('Potager ornemental de Catherine', TRUE, 'Rosa'),
       ('Récolte Sauvage', FALSE, 'Cucurbita'),
	   ('Potager ornemental de Catherine', FALSE, 'Tuberosum'),
       ('Récolte Sauvage', TRUE, 'Tulipa'),
	   ('Le jardin des vie-la-joie',  FALSE, 'Tuberosum'),
       ('Les semences Nouveau Paysan',  TRUE, 'Vitis');