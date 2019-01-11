    CREATE TABLE wlasciciel 
    (
        id_wlasciciela NUMBER(6,0) PRIMARY KEY,
        id_osoba NUMBER(6,0) NOT NULL,
        mail VARCHAR(32) NOT NULL,
        nr_telefonu NUMBER(9,0) NOT NULL,
        data_dodania DATE
    )