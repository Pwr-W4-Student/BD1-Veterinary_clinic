create view dane_wlascicieli as
select o.id_osoba, o.imie, o.nazwisko, o.miejscowosc, o.ulica, o.nr_domu, o.nr_mieszkania, w.nr_telefonu, w.mail, w.data_dodania
from osoba o, wlasciciel w
