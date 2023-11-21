CREATE OR REPLACE FUNCTION get_behörighet(
p_pnr IN VARCHAR2,
p_knr IN NUMBER
)
RETURN NUMBER
AS
v_count NUMBER(1);
BEGIN
SELECT COUNT(*) INTO v_count
FROM kontoägare
WHERE PNR = p_pnr AND KNR = p_knr;
IF v_count = 1 THEN
RETURN 1; -- Person is the owner of the debit account
ELSE
RETURN 0; -- Person is not the owner of the debit account
END IF;
EXCEPTION
WHEN OTHERS THEN
raise_application_error(-20001, 'Error: ' || SQLERRM);
END;
/