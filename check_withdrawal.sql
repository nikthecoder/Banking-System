CREATE OR REPLACE TRIGGER bifer_uttag
BEFORE INSERT ON uttag
FOR EACH ROW
DECLARE
v_saldo NUMBER(10,2);
BEGIN
-- Retrieve the current balance for the account using the get_saldo function
v_saldo := get_saldo(:NEW.KNR);
-- Check if the withdrawal amount is greater than the available balance
IF :NEW.BELOPP > v_saldo THEN
raise_application_error(-20001, 'Insufficient funds for withdrawal');
END IF;
EXCEPTION
WHEN OTHERS THEN
raise_application_error(-20001, 'Error: ' || SQLERRM);
END;
/