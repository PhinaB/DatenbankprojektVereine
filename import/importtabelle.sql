CREATE TABLE imporeabelle (
    Vereinsname VARCHAR(50),
    Vereinskürzel VARCHAR(10),
    Vereinsgründung INT,
    Name VARCHAR(20),
    Geburtsdatum DATE,
    Typ VARCHAR(20),
    Position VARCHAR(20),
    Veranstaltungsname VARCHAR(250) DEFAULT NULL,
    Veranstaltungsdatum DATE DEFAULT NULL,
    Veranstaltungsort VARCHAR(250) DEFAULT NULL,
    Ortsbeschreibung VARCHAR(1000) DEFAULT NULL
);

COPY imporeabelle (
    Vereinsname,
    Vereinskürzel,
    Vereinsgründung,
    Name,
    Geburtsdatum,
    Typ,
    Position,
    Veranstaltungsname,
    Veranstaltungsdatum,
    Veranstaltungsort,
    Ortsbeschreibung
)
FROM 'vereine.csv'
DELIMITER ','
CSV HEADER
NULL '';