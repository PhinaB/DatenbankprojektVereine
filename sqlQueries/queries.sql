--In welchem Jahr wurde der Verein ”Kulinarische Koordinierung” gegründet?
SELECT Gründungsjahr
FROM Verein
WHERE VereinName = 'Kulinarische Koordinierung';

--Welcher Verein (Vereinsname, Anzahl) hat die meisten Mitglieder?
SELECT VereinName, COUNT(p.PersonID) AS Anzahl
FROM Verein AS v
JOIN hatPosition AS h ON h.VereinID = v.VereinID
JOIN Person AS p ON p.PersonID = h.PersonID
GROUP BY VereinName
ORDER BY Anzahl DESC
LIMIT 1;

--Welche Person (Name, Anzahl) ist in den meisten Vereinen gleichzei5g ak5v?
SELECT PersonName, COUNT(v.VereinID) AS Anzahl
FROM Person AS p
JOIN hatPosition AS h ON h.PersonID = p.PersonID
JOIN Verein AS v ON v.VereinID = h.VereinID
GROUP BY PersonName
ORDER BY Anzahl DESC
LIMIT 1;

/*Erstellen Sie eine Sta5s5k bestehend aus Typ und Anzahl, wie viele Studenten,
Mitarbeiter und Externe in Vereinen ak5v sind.*/
SELECT VereinName, TypName, COUNT(p.PersonID) AS Anzahl
FROM Typ AS t
JOIN Person AS p ON p.TypID = t.TypID
JOIN hatPosition AS h ON h.PersonID = p.PersonID
JOIN Verein AS v ON v.VereinID = h.VereinID
GROUP BY VereinName, TypName
ORDER BY VereinName, TypName;

--Welcher Verein (Name, Anzahl) organisiert die meisten Veranstaltungen?
SELECT VereinName, COUNT(ve.VeranstaltungID) AS Anzahl
FROM Verein AS v
JOIN Veranstaltungsinfo AS vei ON vei.VereinID = v.VereinID
JOIN Veranstaltung AS ve ON ve.VeranstaltungsinfoID = vei.VeranstaltungsinfoID
GROUP BY VereinName
ORDER BY Anzahl DESC
LIMIT 1;

/*An welchem Ort (Name, Anzahl) dnden die meisten verschiedenen Veranstaltungen
stae?*/
SELECT OrtName, COUNT(VeranstaltungsinfoID) AS Anzahl
FROM Ort AS o
JOIN Veranstaltungsinfo AS v ON v.OrtID = o.OrtID
GROUP BY OrtName
ORDER BY Anzahl DESC
LIMIT 1;

--Welcher Verein (Name, Anzahl) hat die meisten studen5schen Mitglieder?
SELECT VereinName, COUNT(p.PersonID) AS Anzahl
FROM Verein AS v
JOIN hatPosition AS h ON h.VereinID = v.VereinID
JOIN Person AS p ON p.PersonID = h.PersonID
JOIN Typ AS t ON t.TypID = p.TypID
WHERE t.TypName = 'Student'
GROUP BY VereinName
ORDER BY Anzahl DESC
LIMIT 1;

/*Ermieeln Sie den Verein (Name, Verhältnis), der im Verhätnis zu der Anzahl seiner
Mitglieder die meisten Veranstaltungen organisiert.*/

WITH Veranstaltungsanzahl AS (
SELECT VereinName, COUNT (va.VeranstaltungID) AS AnzahlVeranstaltungen
FROM Verein AS v
JOIN Veranstaltungsinfo AS vai ON v.VereinID = vai.VereinID
JOIN Veranstaltung AS va ON va.VeranstaltungsinfoID = vai.VeranstaltungsinfoID
GROUP BY VereinName
),
Mitgliederanzahl AS (
SELECT VereinName, COUNT (p.PersonID) AS AnzahlMitglieder
FROM hatPosition AS h
JOIN Person AS p ON h.PersonID = p.PersonID
JOIN Verein AS v ON h.VereinID = v.VereinID
GROUP BY VereinName
)
SELECT a.VereinName,
CAST(a.AnzahlVeranstaltungen as decimal)/CAST(m.AnzahlMitglieder as decimal) AS Verhältnis
FROM Veranstaltungsanzahl AS a, Mitgliederanzahl AS m
WHERE a.VereinName = m.VereinName
ORDER BY Verhältnis DESC
LIMIT 1;