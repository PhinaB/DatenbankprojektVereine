INSERT INTO Typ (TypName)
SELECT DISTINCT Typ FROM imporeabelle;

INSERT INTO Person (PersonName, Geburtsdatum, TypID)
SELECT DISTINCT Name, Geburtsdatum, TypID FROM imporeabelle AS i
JOIN Typ ON Typ.TypName = i.Typ;

INSERT INTO Verein (VereinName, Kürzel, Gründungsjahr)
SELECT DISTINCT vereinsname, vereinskürzel, vereinsgründung FROM imporeabelle;

INSERT INTO Ort (OrtName, OrtBeschreibung)
SELECT DISTINCT veranstaltungsort, ortsbeschreibung FROM imporeabelle
WHERE veranstaltungsort IS NOT NULL;

INSERT INTO Veranstaltungsinfo (VeranstaltungName, VereinID, OrtID)
SELECT DISTINCT veranstaltungsname, VereinID, OrtID FROM imporeabelle AS i
JOIN Verein AS v ON v.VereinName = i.Vereinsname
JOIN Ort AS o ON o.OrtName = i.veranstaltungsort;

INSERT INTO Veranstaltung (VeranstaltungsinfoID, Datum)
SELECT DISTINCT VeranstaltungsinfoID, veranstaltungsdatum FROM imporeabelle AS i
JOIN Veranstaltungsinfo AS v ON v.VeranstaltungName = i.veranstaltungsname;

INSERT INTO hatPosition (VereinID, PersonID, Position)
SELECT DISTINCT VereinID, PersonID, Position FROM imporeabelle AS i
JOIN Verein AS v ON v.VereinName = i.vereinsname
JOIN Person AS p ON p.PersonName = i.name;