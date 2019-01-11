CREATE TABLE personel
(
    id_pracownik NUMBER(3,0) PRIMARY KEY,
    id_osoba NUMBER(6,0) UNIQUE NOT NULL,
    stanowisko VARCHAR(32) NOT NULL,
    wynagrodzenie NUMBER(5,0)NOT NULL,
    FOREIGN KEY (id_osoba) REFERENCES osoba(id_osoba)
)