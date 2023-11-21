CREATE OR REPLACE PROCEDURE do_bankkund(
pnr IN VARCHAR2,
fname IN VARCHAR2,
ename IN VARCHAR2,
passwd IN VARCHAR2
)AS
BEGIN
INSERT INTO bankkund (PNR, FNAMN, ENAMN, PASSWD)
VALUES (pnr, fname, ename, passwd);
COMMIT;
EXCEPTION
WHEN OTHERS THEN
ROLLBACK;
raise_application_error(-20001, 'Error: ' || SQLERRM);
END;
/