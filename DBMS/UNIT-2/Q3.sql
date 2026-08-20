SET SERVEROUTPUT ON;
DECLARE
v_roll_no NUMBER := 51;
v_balance NUMBER := v_roll_no * 500 + 5000;
v_choice NUMBER := 1;
v_withdraw NUMBER := 500;
v_txns NUMBER := 0;
v_total_withdrawn NUMBER := 0;
v_iteration NUMBER := 0;
BEGIN
LOOP
v_iteration := v_iteration + 1;
IF v_choice = 1 THEN
IF v_withdraw <= 0 THEN
DBMS_OUTPUT.PUT_LINE('ERROR: Withdrawal must be greater than 0.');
ELSIF MOD(v_withdraw,100) <> 0 THEN
DBMS_OUTPUT.PUT_LINE('ERROR: Withdrawal must be a multiple of 100.');
ELSIF v_withdraw > 10000 THEN
DBMS_OUTPUT.PUT_LINE('ERROR: Maximum Rs.10000 per transaction.');
ELSIF v_withdraw > v_balance THEN
DBMS_OUTPUT.PUT_LINE('ERROR: Insufficient balance.');
ELSE
v_balance := v_balance - v_withdraw;
v_txns := v_txns + 1;
v_total_withdrawn := v_total_withdrawn + v_withdraw;
DBMS_OUTPUT.PUT_LINE('Receipt: Withdrawn Rs.' || v_withdraw ||
', Balance Rs.' || v_balance);
END IF;
ELSE
DBMS_OUTPUT.PUT_LINE('Invalid simulated choice.');
END IF;
-- Four successful simulated iterations are represented by changing
-- the withdrawal amount while keeping the program deterministic.
IF v_iteration = 1 THEN v_withdraw := 1000;
ELSIF v_iteration = 2 THEN v_withdraw := 500;
ELSIF v_iteration = 3 THEN v_withdraw := 1000;
ELSE v_choice := 3;
END IF;
EXIT WHEN v_choice = 3 OR v_balance = 0;
END LOOP;
DBMS_OUTPUT.PUT_LINE('--- FINAL SUMMARY ---');
DBMS_OUTPUT.PUT_LINE('Transactions done: ' || v_txns);
DBMS_OUTPUT.PUT_LINE('Total withdrawn: Rs.' || v_total_withdrawn);
DBMS_OUTPUT.PUT_LINE('Closing balance: Rs.' || v_balance);
END;
/
