CREATE TABLE leki
(
    id_leku NUMBER(6,0) PRIMARY KEY,
    nazwa_leku VARCHAR(16) NOT NULL,
    koncern VARCHAR(16),
    stan NUMBER(4,0) DEFAULT 0
)