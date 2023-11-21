CREATE OR REPLACE FUNCTION get_saldo(
p_knr IN NUMBER
)
RETURN NUMBER
AS
v_saldo NUMBER(10,2);
BEGIN
SELECT SALDO INTO v_saldo
FROM konto
WHERE KNR = p_knr;
RETURN v_saldo;
EXCEPTION
WHEN NO_DATA_FOUND THEN
RETURN NULL; -- Account number not found
WHEN OTHERS THEN
raise_application_error(-20001, 'Error: ' || SQLERRM);
END;
/