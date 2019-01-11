/*---------Usuwanie tabel---------*/


drop table wlasciciel cascade constraints;
drop table leki cascade constraints;
drop table osoba cascade constraints;
drop table zwierzeta cascade constraints;
drop table personel cascade constraints;
drop table historia_lekow cascade constraints;
drop table database_log cascade constraints;
drop table zabiegi cascade constraints;
drop sequence leki_primary_key;
drop sequence osoba_primary_key;
drop sequence personel_primary_key;
drop sequence wlasciciel_primary_key;
drop sequence ZWIERZETA_PRIMARY_KEY;
drop sequence HISTORIA_LEKOW_PRIMARY_KEY;
drop sequence ZABIEGI_PRIMARY_KEY;
drop view DANE_WLASCICIELI;


/*---------Tworzenie tabel---------*/


CREATE TABLE leki
    (
        id_leku NUMBER(6,0) PRIMARY KEY,
        nazwa_leku VARCHAR(16) NOT NULL,
        koncern VARCHAR(16),
        stan NUMBER(4,0) DEFAULT 0
    );
    
    CREATE TABLE osoba
    (
        id_osoba NUMBER(6,0) PRIMARY KEY,
        imie VARCHAR(32) NOT NULL,
        nazwisko VARCHAR(32) NOT NULL,
        miejscowosc VARCHAR(32) NOT NULL,
        ulica VARCHAR(32) NOT NULL,
        nr_domu NUMBER(3,0) NOT NULL,
        nr_mieszkania NUMBER(3,0)
    );
    
    CREATE TABLE wlasciciel 
    (
        id_wlasciciel NUMBER(6,0) PRIMARY KEY,
        id_osoba NUMBER(6,0) UNIQUE NOT NULL,
        mail VARCHAR(32) NOT NULL,
        nr_telefonu NUMBER(9,0) NOT NULL,
        data_dodania DATE,
        FOREIGN KEY (id_osoba) REFERENCES osoba(id_osoba)
    );
    
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
    );
    
    CREATE TABLE personel
    (
        id_pracownik NUMBER(3,0) PRIMARY KEY,
        id_osoba NUMBER(6,0) UNIQUE NOT NULL,
        stanowisko VARCHAR(32) NOT NULL,
        wynagrodzenie NUMBER(5,0)NOT NULL,
        FOREIGN KEY (id_osoba) REFERENCES osoba(id_osoba)
    );
    
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
);

    
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
    );


CREATE TABLE database_log
    (
        uzytkownik VARCHAR2(30),
        zdarzenie VARCHAR2(30),
        data_zdarzenia DATE
    );

/*---------Tworzenie sekwencji---------*/

CREATE SEQUENCE  leki_primary_key  
MINVALUE 1
MAXVALUE 9999 
INCREMENT BY 1 
START WITH 1 
NOCYCLE; 
/
CREATE SEQUENCE osoba_primary_key 
MINVALUE 1 
MAXVALUE 9999 
INCREMENT BY 1
START WITH 1
NOCYCLE;
/
CREATE SEQUENCE personel_primary_key
MINVALUE 1 
MAXVALUE 9999 
INCREMENT BY 1
START WITH 1
NOCYCLE;
/
CREATE SEQUENCE wlasciciel_primary_key
MINVALUE 1
MAXVALUE 9999 
INCREMENT BY 1
START WITH 1
NOCYCLE;
/
CREATE SEQUENCE  ZWIERZETA_PRIMARY_KEY
MINVALUE 1 
MAXVALUE 9999 
INCREMENT BY 1 
START WITH 1 
NOCYCLE;
/
CREATE SEQUENCE  HISTORIA_LEKOW_PRIMARY_KEY  
MINVALUE 1
MAXVALUE 9999 
INCREMENT BY 1 
START WITH 1 
NOCYCLE;
/
CREATE SEQUENCE  ZABIEGI_PRIMARY_KEY  
MINVALUE 1 
MAXVALUE 9999
INCREMENT BY 1 
START WITH 1 
NOCYCLE ;

/
/*----------TRIGGERY----------*/
/*1) */
SET SERVEROUTPUT ON;
create or replace TRIGGER CHANGE_OSOBA_DATA_TRIGGER
  AFTER INSERT OR UPDATE OR DELETE
  ON osoba
DECLARE
  action  database_log.zdarzenie%TYPE;
BEGIN
  IF INSERTING THEN
    action := 'Insert to osoba table';
  ELSIF UPDATING THEN
    action := 'Update in osoba table';
  ELSIF DELETING THEN
    action := 'Delete from osoba table';
  END IF;

  INSERT INTO database_log (uzytkownik, zdarzenie, data_zdarzenia )
    VALUES (USER, action,SYSDATE);
END;
/
/*2) */
create or replace TRIGGER CHANGE_HIST_LEKOW_DATA_TRIGGER
  AFTER INSERT OR UPDATE OR DELETE
  ON historia_lekow
DECLARE
  action  database_log.zdarzenie%TYPE;
BEGIN
  IF INSERTING THEN
    action := 'Insert to historia_lekow table';
  ELSIF UPDATING THEN
    action := 'Update in historia_lekow table';
  ELSIF DELETING THEN
    action := 'Delete from historia_lekow table';
  END IF;

  INSERT INTO database_log (uzytkownik, zdarzenie, data_zdarzenia )
    VALUES (USER, action,SYSDATE);
END;
/
/*3) */
create or replace TRIGGER CHANGE_LEKI_DATA_TRIGGER
  AFTER INSERT OR UPDATE OR DELETE
  ON leki
DECLARE
  action  database_log.zdarzenie%TYPE;
BEGIN
  IF INSERTING THEN
    action := 'Insert to leki table';
  ELSIF UPDATING THEN
    action := 'Update in leki table';
  ELSIF DELETING THEN
    action := 'Delete from leki table';
  END IF;

  INSERT INTO database_log (uzytkownik, zdarzenie, data_zdarzenia )
    VALUES (USER, action,SYSDATE);
END;
/
/*4) */
create or replace TRIGGER CHANGE_PERSONEL_DATA_TRIGGER
  AFTER INSERT OR UPDATE OR DELETE
  ON personel
DECLARE
  action  database_log.zdarzenie%TYPE;
BEGIN
  IF INSERTING THEN
    action := 'Insert to personel table';
  ELSIF UPDATING THEN
    action := 'Update in personel table';
  ELSIF DELETING THEN
    action := 'Delete from personel table';
  END IF;

  INSERT INTO database_log (uzytkownik, zdarzenie, data_zdarzenia )
    VALUES (USER, action,SYSDATE);
END;
/
/*5) */
create or replace TRIGGER CHANGE_WLASCICIEL_DATA_TRIGGER
  AFTER INSERT OR UPDATE OR DELETE
  ON wlasciciel
DECLARE
  action  database_log.zdarzenie%TYPE;
BEGIN
  IF INSERTING THEN
    action := 'Insert to wlasciciel table';
  ELSIF UPDATING THEN
    action := 'Update in wlasciciel table';
  ELSIF DELETING THEN
    action := 'Delete from wlasciciel table';
  END IF;

  INSERT INTO database_log (uzytkownik, zdarzenie, data_zdarzenia )
    VALUES (USER, action,SYSDATE);
END;
/
/*6) */
create or replace TRIGGER CHANGE_ZABIEGI_DATA_TRIGGER
  AFTER INSERT OR UPDATE OR DELETE
  ON zabiegi
DECLARE
  action  database_log.zdarzenie%TYPE;
BEGIN
  IF INSERTING THEN
    action := 'Insert to zabiegi table';
  ELSIF UPDATING THEN
    action := 'Update in zabiegi table';
  ELSIF DELETING THEN
    action := 'Delete from zabiegi table';
  END IF;

  INSERT INTO database_log (uzytkownik, zdarzenie, data_zdarzenia )
    VALUES (USER, action,SYSDATE);
END;
/*7) */
/
create or replace TRIGGER CHANGE_ZWIERZETA_DATA_TRIGGER
  AFTER INSERT OR UPDATE OR DELETE
  ON zwierzeta
DECLARE
  action  database_log.zdarzenie%TYPE;
BEGIN
  IF INSERTING THEN
    action := 'Insert to zwierzeta table';
  ELSIF UPDATING THEN
    action := 'Update in zwierzeta table';
  ELSIF DELETING THEN
    action := 'Delete from zwierzeta table';
  END IF;

  INSERT INTO database_log (uzytkownik, zdarzenie, data_zdarzenia )
    VALUES (USER, action,SYSDATE);
END;
/
/*---------Tworzenie widokow---------*/
create view dane_wlascicieli as
select osoba.id_osoba, osoba.imie, osoba.nazwisko, osoba.miejscowosc, osoba.ulica, osoba.nr_domu, osoba.nr_mieszkania, wlasciciel.nr_telefonu, wlasciciel.mail, wlasciciel.data_dodania
from osoba join WLASCICIEL on OSOBA.ID_OSOBA = wlasciciel.id_osoba;


/*1) Rekordy do tabeli Osoba*/
INSERT INTO OSOBA(ID_OSOBA,IMIE,NAZWISKO,MIEJSCOWOSC,ULICA,NR_DOMU,NR_MIESZKANIA) VALUES (OSOBA_PRIMARY_KEY.NEXTVAL,'Tomasz','Wojcik','Wroclaw','Sztabowa',53,22);
INSERT INTO OSOBA(ID_OSOBA,IMIE,NAZWISKO,MIEJSCOWOSC,ULICA,NR_DOMU,NR_MIESZKANIA) VALUES (OSOBA_PRIMARY_KEY.NEXTVAL,'Piotr','Czarnecki','Wroclaw','Agrestowa',23,NULL);
INSERT INTO OSOBA(ID_OSOBA,IMIE,NAZWISKO,MIEJSCOWOSC,ULICA,NR_DOMU,NR_MIESZKANIA) VALUES (OSOBA_PRIMARY_KEY.NEXTVAL,'Krzysztof','Krl','Wroclaw', 'Akacjowa',48,11);
INSERT INTO OSOBA(ID_OSOBA,IMIE,NAZWISKO,MIEJSCOWOSC,ULICA,NR_DOMU,NR_MIESZKANIA) VALUES (OSOBA_PRIMARY_KEY.NEXTVAL,'Dorota','Laskowska','Ostrow', 'Braterska',3,4);
INSERT INTO OSOBA(ID_OSOBA,IMIE,NAZWISKO,MIEJSCOWOSC,ULICA,NR_DOMU,NR_MIESZKANIA) VALUES (OSOBA_PRIMARY_KEY.NEXTVAL,'Adrianna','Lis','Widawa', 'Akacjowa',21,63);
INSERT INTO OSOBA(ID_OSOBA,IMIE,NAZWISKO,MIEJSCOWOSC,ULICA,NR_DOMU,NR_MIESZKANIA) VALUES (OSOBA_PRIMARY_KEY.NEXTVAL,'Magda','Wrotkowska','Sobtka', 'Budryka',16,2);
INSERT INTO OSOBA(ID_OSOBA,IMIE,NAZWISKO,MIEJSCOWOSC,ULICA,NR_DOMU,NR_MIESZKANIA) VALUES (OSOBA_PRIMARY_KEY.NEXTVAL,'Kamil','Nowak','Wroclaw', 'Krucza',53,44);
INSERT INTO OSOBA(ID_OSOBA,IMIE,NAZWISKO,MIEJSCOWOSC,ULICA,NR_DOMU,NR_MIESZKANIA) VALUES (OSOBA_PRIMARY_KEY.NEXTVAL,'Pawel','Twardawa','Wroclaw', 'Hetmanska',1,25);
INSERT INTO OSOBA(ID_OSOBA,IMIE,NAZWISKO,MIEJSCOWOSC,ULICA,NR_DOMU,NR_MIESZKANIA) VALUES (OSOBA_PRIMARY_KEY.NEXTVAL,'Karolina','Madej','Wroclaw', 'Jasna',13,89);
INSERT INTO OSOBA(ID_OSOBA,IMIE,NAZWISKO,MIEJSCOWOSC,ULICA,NR_DOMU,NR_MIESZKANIA) VALUES (OSOBA_PRIMARY_KEY.NEXTVAL,'Kacper','Dymek','Wroclaw', 'Kazimierska',12,NULL);

/*2) Rekordy do tabeli Personel*/
INSERT INTO PERSONEL (ID_PRACOWNIK, ID_OSOBA, STANOWISKO, WYNAGRODZENIE) VALUES(PERSONEL_PRIMARY_KEY.NEXTVAL,2,'Menadzer',3000);
INSERT INTO PERSONEL (ID_PRACOWNIK, ID_OSOBA, STANOWISKO, WYNAGRODZENIE) VALUES(PERSONEL_PRIMARY_KEY.NEXTVAL,1,'Lekarz',2500);
INSERT INTO PERSONEL (ID_PRACOWNIK, ID_OSOBA, STANOWISKO, WYNAGRODZENIE) VALUES(PERSONEL_PRIMARY_KEY.NEXTVAL,3,'Lekarz',2500);
INSERT INTO PERSONEL (ID_PRACOWNIK, ID_OSOBA, STANOWISKO, WYNAGRODZENIE) VALUES(PERSONEL_PRIMARY_KEY.NEXTVAL,6,'Lekarz',2500);
INSERT INTO PERSONEL (ID_PRACOWNIK, ID_OSOBA, STANOWISKO, WYNAGRODZENIE) VALUES(PERSONEL_PRIMARY_KEY.NEXTVAL,5,'Recepcjonistka',1800);
INSERT INTO PERSONEL (ID_PRACOWNIK, ID_OSOBA, STANOWISKO, WYNAGRODZENIE) VALUES(PERSONEL_PRIMARY_KEY.NEXTVAL,4,'Recepcjonistka',1800);

/*3) Rekordy do tabeli Wlasciciel */
INSERT INTO WLASCICIEL(ID_WLASCICIEL,ID_OSOBA,MAIL,NR_TELEFONU,DATA_DODANIA) VALUES(WLASCICIEL_PRIMARY_KEY.NEXTVAL,3,'Krzysztof21@gmail.com',562968206,TO_DATE('2018/05/25', 'yyyy/mm/dd'));
INSERT INTO WLASCICIEL(ID_WLASCICIEL,ID_OSOBA,MAIL,NR_TELEFONU,DATA_DODANIA) VALUES(WLASCICIEL_PRIMARY_KEY.NEXTVAL,7,'Kamil432@gmail.com',586736592,TO_DATE('2018/06/01', 'yyyy/mm/dd'));
INSERT INTO WLASCICIEL(ID_WLASCICIEL,ID_OSOBA,MAIL,NR_TELEFONU,DATA_DODANIA) VALUES(WLASCICIEL_PRIMARY_KEY.NEXTVAL,8,'Pawel12@gmail.com',534726435,TO_DATE('2018/06/09', 'yyyy/mm/dd'));
INSERT INTO WLASCICIEL(ID_WLASCICIEL,ID_OSOBA,MAIL,NR_TELEFONU,DATA_DODANIA) VALUES(WLASCICIEL_PRIMARY_KEY.NEXTVAL,9,'Karolina.Madej@gmail.com',527592753,TO_DATE('2018/06/10', 'yyyy/mm/dd'));
INSERT INTO WLASCICIEL(ID_WLASCICIEL,ID_OSOBA,MAIL,NR_TELEFONU,DATA_DODANIA) VALUES(WLASCICIEL_PRIMARY_KEY.NEXTVAL,10,'Kac13per@gmail.com',532145278,TO_DATE('2018/06/11', 'yyyy/mm/dd'));

/*4) Rekordy do tabeli Leki */
INSERT INTO LEKI(ID_LEKU,NAZWA_LEKU, KONCERN, STAN) VALUES(LEKI_PRIMARY_KEY.NEXTVAL,'Actikor','Ecuphar',350);
INSERT INTO LEKI(ID_LEKU,NAZWA_LEKU, KONCERN, STAN) VALUES(LEKI_PRIMARY_KEY.NEXTVAL,'Loxicom','Norbrook',280);
INSERT INTO LEKI(ID_LEKU,NAZWA_LEKU, KONCERN, STAN) VALUES(LEKI_PRIMARY_KEY.NEXTVAL,'Cefalexim','ScanVet',450);
INSERT INTO LEKI(ID_LEKU,NAZWA_LEKU, KONCERN, STAN) VALUES(LEKI_PRIMARY_KEY.NEXTVAL,'Dexasone','ScanVet',330);
INSERT INTO LEKI(ID_LEKU,NAZWA_LEKU, KONCERN, STAN) VALUES(LEKI_PRIMARY_KEY.NEXTVAL,'Cepetor','CP-Pharma',241);
INSERT INTO LEKI(ID_LEKU,NAZWA_LEKU, KONCERN, STAN) VALUES(LEKI_PRIMARY_KEY.NEXTVAL,'Combivit','ScanVet',348);
INSERT INTO LEKI(ID_LEKU,NAZWA_LEKU, KONCERN, STAN) VALUES(LEKI_PRIMARY_KEY.NEXTVAL,'Synergal','Norbrook',340);
INSERT INTO LEKI(ID_LEKU,NAZWA_LEKU, KONCERN, STAN) VALUES(LEKI_PRIMARY_KEY.NEXTVAL,'Penicillin','ScanVet',450);

/*5) Rekordy do tabeli Zwierzeta */
INSERT INTO ZWIERZETA(ID_ZWIERZE, ID_WLASCICIEL,RODZAJ,RASA,MASC,ZNAK_SPECJALNY,DIAGNOZA) VALUES(ZWIERZETA_PRIMARY_KEY.NEXTVAL,1,'Pies','Shiba Inu','Rudy','Krotka siersc','Kleszcze na ogonie');
INSERT INTO ZWIERZETA(ID_ZWIERZE, ID_WLASCICIEL,RODZAJ,RASA,MASC,ZNAK_SPECJALNY,DIAGNOZA) VALUES(ZWIERZETA_PRIMARY_KEY.NEXTVAL,2,'Pies','Jamnik','Jednolity',null,'Zlamana lapka');
INSERT INTO ZWIERZETA(ID_ZWIERZE, ID_WLASCICIEL,RODZAJ,RASA,MASC,ZNAK_SPECJALNY,DIAGNOZA) VALUES(ZWIERZETA_PRIMARY_KEY.NEXTVAL,3,'Papuga','Kakadu','Bialy','Czarne plamki na skrzydlach','Niezyt jelit.');
INSERT INTO ZWIERZETA(ID_ZWIERZE, ID_WLASCICIEL,RODZAJ,RASA,MASC,ZNAK_SPECJALNY,DIAGNOZA) VALUES(ZWIERZETA_PRIMARY_KEY.NEXTVAL,4,'Krolik','Krolik','Rudy',null,'Swierzb w obu uszach.');
INSERT INTO ZWIERZETA(ID_ZWIERZE, ID_WLASCICIEL,RODZAJ,RASA,MASC,ZNAK_SPECJALNY,DIAGNOZA) VALUES(ZWIERZETA_PRIMARY_KEY.NEXTVAL,5,'Mysz','Mysz domowa','Biala',null,'Ropa pod oczami.');


/*6) Rekordy do tabeli Zabiegi */
INSERT INTO ZABIEGI(ID_ZABIEG,ID_ZWIERZE,ID_PRACOWNIKA,DATA_WYKONANIA,NAZWA_ZABIEGU,EFEKT) VALUES(ZABIEGI_PRIMARY_KEY.NEXTVAL,1,2,TO_DATE('2018/05/25', 'yyyy/mm/dd'),'Usuniecie kleszczy.','Kleszcze zostaly usuniete.');
INSERT INTO ZABIEGI(ID_ZABIEG,ID_ZWIERZE,ID_PRACOWNIKA,DATA_WYKONANIA,NAZWA_ZABIEGU,EFEKT) VALUES(ZABIEGI_PRIMARY_KEY.NEXTVAL,2,3,TO_DATE('2018/06/01', 'yyyy/mm/dd'),'Zlamanie.','Lapka zagipsowana.');
INSERT INTO ZABIEGI(ID_ZABIEG,ID_ZWIERZE,ID_PRACOWNIKA,DATA_WYKONANIA,NAZWA_ZABIEGU,EFEKT) VALUES(ZABIEGI_PRIMARY_KEY.NEXTVAL,3,2,TO_DATE('2018/06/10', 'yyyy/mm/dd'),'Niezyt jelit.','Jelita zaczely funkcjonowac.');
INSERT INTO ZABIEGI(ID_ZABIEG,ID_ZWIERZE,ID_PRACOWNIKA,DATA_WYKONANIA,NAZWA_ZABIEGU,EFEKT) VALUES(ZABIEGI_PRIMARY_KEY.NEXTVAL,4,4,TO_DATE('2018/06/10', 'yyyy/mm/dd'),'Swierzb w uszach.','Uszy oczyszczone.');
INSERT INTO ZABIEGI(ID_ZABIEG,ID_ZWIERZE,ID_PRACOWNIKA,DATA_WYKONANIA,NAZWA_ZABIEGU,EFEKT) VALUES(ZABIEGI_PRIMARY_KEY.NEXTVAL,5,3,TO_DATE('2018/06/11', 'yyyy/mm/dd'),'Usuniecie ropy.','Ropa usunieta.');

/*7) Rekordy do tabeli Historia_lekow */
INSERT INTO HISTORIA_LEKOW(ID_HISTORII,ID_LEKU,ID_ZWIERZE,ID_PRACOWNIK,DATA_PODANIA,EFEKT) VALUES(HISTORIA_LEKOW_PRIMARY_KEY.NEXTVAL,3,1,2,TO_DATE('2018/05/25', 'yyyy/mm/dd'),'Leki sie przyjely.');
INSERT INTO HISTORIA_LEKOW(ID_HISTORII,ID_LEKU,ID_ZWIERZE,ID_PRACOWNIK,DATA_PODANIA,EFEKT) VALUES(HISTORIA_LEKOW_PRIMARY_KEY.NEXTVAL,2,2,3,TO_DATE('2018/06/01', 'yyyy/mm/dd'),'Brak objaw uczulenia.');
INSERT INTO HISTORIA_LEKOW(ID_HISTORII,ID_LEKU,ID_ZWIERZE,ID_PRACOWNIK,DATA_PODANIA,EFEKT) VALUES(HISTORIA_LEKOW_PRIMARY_KEY.NEXTVAL,1,3,2,TO_DATE('2018/06/10', 'yyyy/mm/dd'),'Koniec problemow z wydalaniem.');
INSERT INTO HISTORIA_LEKOW(ID_HISTORII,ID_LEKU,ID_ZWIERZE,ID_PRACOWNIK,DATA_PODANIA,EFEKT) VALUES(HISTORIA_LEKOW_PRIMARY_KEY.NEXTVAL,4,4,4,TO_DATE('2018/06/10', 'yyyy/mm/dd'),'Uszy zostaly zalane.');
INSERT INTO HISTORIA_LEKOW(ID_HISTORII,ID_LEKU,ID_ZWIERZE,ID_PRACOWNIK,DATA_PODANIA,EFEKT) VALUES(HISTORIA_LEKOW_PRIMARY_KEY.NEXTVAL,7,5,3,TO_DATE('2018/06/11', 'yyyy/mm/dd'),'Ropa przestala sie zbierac.');



