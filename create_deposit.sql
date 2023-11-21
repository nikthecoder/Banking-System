CREATE OR REPLACE PROCEDURE do_insättning(
p_pnr IN VARCHAR2,
p_knr IN NUMBER,
p_belopp IN NUMBER
)
IS
v_saldo NUMBER(10,2);
BEGIN
-- Insert the deposit into the insättning table
INSERT INTO insättning (RADNR, PNR, KNR, BELOPP, DATUM)
VALUES (radnr_seq.NEXTVAL, p_pnr, p_knr, p_belopp, SYSDATE);
-- Update the balance in the konto table
UPDATE konto
SET SALDO = SALDO + p_belopp
WHERE KNR = p_knr;
-- Retrieve the updated balance for the account
SELECT SALDO INTO v_saldo
FROM konto
WHERE KNR = p_knr;
-- Print the message with the updated balance
DBMS_OUTPUT.PUT_LINE('Deposit successful. Current balance for account ' || p_knr || ': ' || v_saldo);
EXCEPTION
WHEN OTHERS THEN
raise_application_error(-20001, 'Error: ' || SQLERRM);
END;
/