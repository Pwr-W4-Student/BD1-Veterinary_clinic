CREATE TABLE zabiegi
(
    id_zabieg NUMBER(6,0) PRIMARY KEY,
    id_zwierze NUMBER(6,0) NOT NULL,
    id_pracownika NUMBER(3,0) NOT NULL,
    data_wykonania DATE NOT NULL,
    nazwa_zabiegu VARCHAR(32) NOT NULL,
    efekt VARCHAR(32) NOT NULL,
    FOREIGN KEY (id_zwierze) REFERENCES zwierzeta(id_zwierze),
    FOREIGN KEY (id_pracownika) REFERENCES personel(id_pracownik)
)