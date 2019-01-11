CREATE TABLE historia_lekow
(
    id_historii NUMBER(6,0) PRIMARY KEY,
    id_leku NUMBER(6,0) NOT NULL,
    id_zwierze NUMBER(8,2) NOT NULL,
    id_pracownik NUMBER(3,0) NOT NULL,
    data_podania DATE NOT NULL, 
    efekt VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_leku) REFERENCES leki(id_leku),
    FOREIGN KEY (id_zwierze) REFERENCES zwierzeta(id_zwierze),
    FOREIGN KEY (id_pracownik) REFERENCES personel(id_pracownik)
)