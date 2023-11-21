CREATE OR REPLACE PROCEDURE do_uttag(
p_pnr IN VARCHAR2,
p_knr IN NUMBER,
p_belopp IN NUMBER
)
IS
v_saldo NUMBER(10,2);
v_authorization NUMBER;
obehörig EXCEPTION;
BEGIN
-- Check if the person is authorized to make the withdrawal
v_authorization := get_behörighet(p_pnr, p_knr);
-- If unauthorized, raise the 'unauthorized' exception and print an error message
IF v_authorization = 0 THEN
RAISE obehörig;
ELSE
-- Insert the withdrawal into the uttag table
INSERT INTO uttag (RADNR, PNR, KNR, BELOPP, DATUM)
VALUES (radnr_seq.NEXTVAL, p_pnr, p_knr, p_belopp, SYSDATE);
-- Print a message about the current balance after the withdrawal
v_saldo := get_saldo(p_knr);
DBMS_OUTPUT.PUT_LINE('Withdrawal successful. Current balance for account ' || p_knr || ': ' || v_saldo);
END IF;
EXCEPTION
WHEN obehörig THEN
DBMS_OUTPUT.PUT_LINE('Unauthorized withdrawal attempt. You are not the owner of the account.')WHEN OTHERS THEN
raise_application_error(-20001, 'Error: ' || SQLERRM);
END;
/