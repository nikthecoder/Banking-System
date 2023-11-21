CREATE OR REPLACE FUNCTION logga_in(
p_pnr IN VARCHAR2,
p_passwd IN VARCHAR2
)
RETURN NUMBER
AS
login_result NUMBER(1);
BEGIN
SELECT COUNT(*) INTO login_result
FROM bankkund
WHERE PNR = p_pnr AND PASSWD = p_passwd;
IF login_result = 1 THEN
RETURN 1; -- Login successful
ELSE
RETURN 0; -- Login failed
END IF;
EXCEPTION
WHEN OTHERS THEN
raise_application_error(-20001, 'Error: ' || SQLERRM);
END;
/