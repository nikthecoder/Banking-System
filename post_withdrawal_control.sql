CREATE OR REPLACE TRIGGER aifer_uttag
AFTER INSERT ON uttag
FOR EACH ROW
DECLARE
v_saldo NUMBER(10,2);
BEGIN
-- Retrieve the current balance for the account
SELECT SALDO INTO v_saldo
FROM konto
WHERE KNR = :NEW.KNR;
-- Update the balance after the withdrawalv_saldo := v_saldo - :NEW.BELOPP;
-- Update the konto table with the new balance
UPDATE konto
SET SALDO = v_saldo
WHERE KNR = :NEW.KNR;
END;
/