CREATE OR REPLACE TRIGGER aifer_insättning
AFTER INSERT ON insättning
FOR EACH ROW
DECLARE
v_saldo NUMBER(10,2);
BEGIN
-- Retrieve the current balance for the accountSELECT SALDO INTO v_saldo
FROM konto
WHERE KNR = :NEW.KNR;
-- Update the balance with the deposited amount
v_saldo := v_saldo + :NEW.BELOPP;
-- Update the balance in the konto table
UPDATE konto
SET SALDO = v_saldo
WHERE KNR = :NEW.KNR;
EXCEPTION
WHEN OTHERS THEN
raise_application_error(-20001, 'Error: ' || SQLERRM);
END;
/