CREATE TABLE Typ (
    TypID SERIAL,
    TypName VARCHAR(20) NOT NULL,
    PRIMARY KEY (TypID)
);

CREATE TABLE Person (
    PersonID SERIAL,
    PersonName VARCHAR(20) NOT NULL,
    Geburtsdatum DATE NOT NULL,
    TypID INT NOT NULL,
    PRIMARY KEY (PersonID),
    FOREIGN KEY (TypID) REFERENCES Typ(TypID)
);

CREATE TABLE Verein (
    VereinID SERIAL,
    VereinName VARCHAR(50) NOT NULL,
    Kürzel VARCHAR(10) NOT NULL,
    Gründungsjahr INT NOT NULL,
    PRIMARY KEY (VereinID)
);

CREATE TABLE Ort (
    OrtID SERIAL,
    OrtName VARCHAR(20) NOT NULL,
    OrtBeschreibung VARCHAR(1000) NOT NULL,
    PRIMARY KEY (OrtID)
);

CREATE TABLE Veranstaltungsinfo (
    VeranstaltungsinfoID SERIAL,
    VeranstaltungName VARCHAR(250) NOT NULL,
    VereinID INT NOT NULL,
    OrtID INT NOT NULL,
    PRIMARY KEY (VeranstaltungsinfoID),
    FOREIGN KEY (OrtID) REFERENCES Ort(OrtID),
    FOREIGN KEY (VereinID) REFERENCES Verein(VereinID)
);

CREATE TABLE Veranstaltung (
    VeranstaltungID SERIAL,
    VeranstaltungsinfoID INT NOT NULL,
    Datum DATE NOT NULL DEFAULT current_Date,
    PRIMARY KEY (VeranstaltungID),
    FOREIGN KEY (VeranstaltungsinfoID) REFERENCES Veranstaltungsinfo(VeranstaltungsinfoID)
);

CREATE TABLE hatPosition (
    VereinID INT,
    PersonID INT,
    Position VARCHAR(20) NOT NULL,
    PRIMARY KEY (VereinID, PersonID),
    FOREIGN KEY (VereinID) REFERENCES Verein(VereinID),
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);