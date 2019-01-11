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

