CREATE OR REPLACE PROCEDURE do_överföring(
p_pnr IN VARCHAR2,
p_från_knr IN NUMBER,
p_till_knr IN NUMBER,
p_belopp IN NUMBER
)IS
v_saldo_från NUMBER(10,2);
v_saldo_till NUMBER(10,2);
v_authorization NUMBER;
obehörig EXCEPTION;
BEGIN
-- Check if the person is authorized to make the transfer
v_authorization := get_behörighet(p_pnr, p_från_knr);
-- If unauthorized, raise the 'obehörig' exception and print an error message
IF v_authorization = 0 THEN
RAISE obehörig;
ELSE
-- Insert the transfer into the överföring table
INSERT INTO överföring (RADNR, PNR, FRÅN_KNR, TILL_KNR, BELOPP, DATUM)
VALUES (radnr_seq.NEXTVAL, p_pnr, p_från_knr, p_till_knr, p_belopp, SYSDATE);
-- Retrieve the current balances for the involved accounts
v_saldo_från := get_saldo(p_från_knr);
v_saldo_till := get_saldo(p_till_knr);
-- Print a message about the current balances after the transfer
DBMS_OUTPUT.PUT_LINE('Transfer successful.');
DBMS_OUTPUT.PUT_LINE('Current balance for account ' || p_från_knr || ': ' || v_saldo_från);
DBMS_OUTPUT.PUT_LINE('Current balance for account ' || p_till_knr || ': ' || v_saldo_till);
END IF;
EXCEPTION
WHEN obehörig THEN
DBMS_OUTPUT.PUT_LINE('Unauthorized transfer attempt. You are not the owner of the debit account.');
WHEN OTHERS THEN
raise_application_error(-20001, 'Error: ' || SQLERRM);
END;
/