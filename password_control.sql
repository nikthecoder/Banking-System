CREATE OR REPLACE TRIGGER biufer_bankkund
BEFORE INSERT OR UPDATE OF passwd ON bankkund
FOR EACH ROW
DECLARE
password_length NUMBER(2);
BEGIN
password_length := LENGTH(:NEW.passwd);
IF password_length <> 6 THEN
raise_application_error(-20001, 'Error: Lösenordet måste vara exakt 6 tecken långt.');
END IF;
END;
/