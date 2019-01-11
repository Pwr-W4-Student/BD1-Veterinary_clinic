CREATE TABLE osoba
(
    id_osoba NUMBER(6,0) PRIMARY KEY,
    imie VARCHAR(32) NOT NULL,
    nazwisko VARCHAR(32) NOT NULL,
    miejscowosc VARCHAR(32) NOT NULL,
    ulica VARCHAR(32) NOT NULL,
    nr_domu NUMBER(3,0) NOT NULL,
    nr_mieszkania NUMBER(3,0),
)