DROP SCHEMA IF EXISTS bdSchema CASCADE;
CREATE SCHEMA bdSchema;
SET search_path = bdSchema;

CREATE TABLE Sol(
	typeSol VARCHAR(20) NOT NULL,
	PRIMARY KEY(typeSol)
);
CREATE TABLE Jardin(
	identifiantJardin VARCHAR(20) NOT NULL,
    nomJardin VARCHAR(20) NOT NULL,
    surface VARCHAR(20) NOT NULL,
    hauteurMaximale VARCHAR(20),
	potagerJardinFlag BOOLEAN NOT NULL,
	ornementJardinFlag BOOLEAN NOT NULL,
	vergerJardinFlag BOOLEAN NOT NULL,
	typeSol VARCHAR(20),
    PRIMARY KEY(identifiantJardin),
	FOREIGN KEY(typeSol) REFERENCES Sol(typeSol)
);
CREATE TABLE Parcelle(
	identifiantJardin VARCHAR(20) NOT NULL,
	parcelleID VARCHAR(20) NOT NULL,
	coordonneeParcelle VARCHAR(20) NOT NULL,
	dimensionParcelle VARCHAR(20) NOT NULL,
	PRIMARY KEY (parcelleID),
	FOREIGN KEY(identifiantJardin) REFERENCES Jardin(identifiantJardin)
);
CREATE TABLE Rang(
	numeroRang VARCHAR(20) NOT NULL,
	parcelleID VARCHAR(20) NOT NULL,
	coordonneeRang VARCHAR(20) NOT NULL,
	jachere VARCHAR(20),
    PRIMARY KEY(numeroRang),
	FOREIGN KEY(parcelleID) REFERENCES Parcelle(parcelleID)
);
CREATE TABLE Variete(
	nomVariete VARCHAR(20) NOT NULL,
	descriptionSemis VARCHAR(200) NOT NULL,
	descriptionPlantation VARCHAR(200) NOT NULL,
	descriptionEntretien VARCHAR(200) NOT NULL,
	descriptionMiseEnPlace VARCHAR(200) NOT NULL,
	descriptionRecolte VARCHAR(200) NOT NULL,
	commentaireGeneral VARCHAR(200) NOT NULL,
	descriptionPeriodeRecolte VARCHAR(200) NOT NULL,
	anneeMiseEnMarchee VARCHAR(20) NOT NULL,
	PRIMARY KEY(nomVariete)
);
CREATE TABLE Adaptation(
	typeSol VARCHAR(20) NOT NULL,
	adapte VARCHAR(20) NOT NULL,
	nomVariete VARCHAR(20) NOT NULL,
	FOREIGN KEY(typeSol) REFERENCES Sol(typeSol),
	FOREIGN KEY(nomVariete) REFERENCES Variete(nomVariete)
);
CREATE TABLE RangVariete(
	numeroRang VARCHAR(20) NOT NULL,
	nomVariete VARCHAR(20) NOT NULL,
	typeMiseEnPlace VARCHAR(20) NOT NULL,
	FOREIGN KEY(numeroRang) REFERENCES Rang(numeroRang),
	FOREIGN KEY(nomVariete) REFERENCES Variete(nomVariete)
);
CREATE TABLE Plante(
	identifiantJardin VARCHAR(20) NOT NULL,
	nomPlante VARCHAR(50) NOT NULL,
	nomVariete VARCHAR(20) NOT NULL,
	categoriePlante VARCHAR(20) NOT NULL,
	typePlante VARCHAR(20) NOT NULL,
	sousTypePlante VARCHAR(20),
	nomLatinPlante VARCHAR(50) NOT NULL,
    PRIMARY KEY(nomLatinPlante),
	FOREIGN KEY(identifiantJardin) REFERENCES Jardin(identifiantJardin),
	FOREIGN KEY(nomVariete) REFERENCES Variete(nomVariete)
);
CREATE TABLE AssociationPlante(
	beneficeInconvenient VARCHAR (20) NOT NULL,
	nomLatinPlante1 VARCHAR(50) NOT NULL,
	nomLatinPlante2 VARCHAR(50) NOT NULL,
	FOREIGN KEY(nomLatinPlante1) REFERENCES Plante(nomLatinPlante),
	FOREIGN KEY(nomLatinPlante2) REFERENCES Plante(nomLatinPlante)
);
CREATE TABLE Menace(
	descriptionMenace VARCHAR(200) NOT NULL,
	solutionMenace VARCHAR(200) NOT NULL,
	typeMenace VARCHAR(50) NOT NULL,
	nomLatinPlante VARCHAR(50) NOT NULL,
	FOREIGN KEY(nomLatinPlante) REFERENCES Plante(nomLatinPlante)
);
CREATE TABLE Semancier(
	nomSemancier VARCHAR(50) NOT NULL,
	biologique BOOLEAN NOT NULL,
	siteWeb VARCHAR(50) NOT NULL,
	nomVariete VARCHAR(50) NOT NULL,
	PRIMARY KEY(nomSemancier),
	FOREIGN KEY(nomVariete) REFERENCES Variete(nomVariete)
);
