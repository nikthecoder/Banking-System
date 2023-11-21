CREATE OR REPLACE TRIGGER aifer_överföring
AFTER INSERT ON överföring
FOR EACH ROW
DECLARE
v_från_saldo NUMBER(10,2);
v_till_saldo NUMBER(10,2);
BEGIN
-- Retrieve the current balances for the debit account (från_konto) and credit account (till_konto)
SELECT SALDO INTO v_från_saldo
FROM konto
WHERE KNR = :NEW.FRÅN_KNR;
SELECT SALDO INTO v_till_saldo
FROM konto
WHERE KNR = :NEW.TILL_KNR;
-- Update the balances by subtracting the transfer amount from the debit account and adding it to the credit
account
v_från_saldo := v_från_saldo - :NEW.BELOPP;
v_till_saldo := v_till_saldo + :NEW.BELOPP;-- Update the balances in the konto table
UPDATE konto
SET SALDO = v_från_saldo
WHERE KNR = :NEW.FRÅN_KNR;
UPDATE konto
SET SALDO = v_till_saldo
WHERE KNR = :NEW.TILL_KNR;
EXCEPTION
WHEN OTHERS THEN
raise_application_error(-20001, 'Error: ' || SQLERRM);
END;
/