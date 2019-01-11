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

