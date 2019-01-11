CREATE TABLE zwierzeta
(
    id_zwierze NUMBER(6,0) PRIMARY KEY,
    id_wlasciciel NUMBER(6,0) NOT NULL,
    rodzaj VARCHAR(32) NOT NULL,
    rasa VARCHAR(32) NOT NULL,
    masc VARCHAR(32) NOT NULL,
    znak_specjalny VARCHAR(32),
    diagnoza VARCHAR(32) NOT NULL,
    FOREIGN KEY (id_wlasciciel) REFERENCES wlasciciel(id_wlasciciel)
)