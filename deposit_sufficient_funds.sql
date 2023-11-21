CREATE OR REPLACE TRIGGER bifer_överföring
BEFORE INSERT ON överföring
FOR EACH ROW
DECLARE
v_saldo NUMBER(10,2);
BEGIN
-- Retrieve the current balance for the debit account using the get_saldo function
v_saldo := get_saldo(:NEW.FRÅN_KNR);
-- Check if the transfer amount is greater than the available balance in the debit account
IF :NEW.BELOPP > v_saldo THEN
raise_application_error(-20001, 'Insufficient funds for transfer');
END IF;
EXCEPTION
WHEN OTHERS THEN
raise_application_error(-20001, 'Error: ' || SQLERRM);
END;
/