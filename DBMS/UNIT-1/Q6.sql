SET SERVEROUTPUT ON;
DECLARE
v_roll_no NUMBER := 51;
v_birth_month NUMBER := 6; -- Replace with your actual birth month
v_p NUMBER;
v_r NUMBER;
v_t NUMBER := 3;
v_si NUMBER;
v_ci NUMBER;
v_final_si NUMBER;
v_final_ci NUMBER;
v_diff NUMBER;
v_diff_pct NUMBER;
BEGIN
v_p := v_roll_no * 1000;
v_r := v_birth_month * 0.5 + 4;
v_si := v_p * v_r * v_t / 100;
v_ci := v_p * POWER(1 + v_r / 100, v_t) - v_p;
v_final_si := v_p + v_si;
v_final_ci := v_p + v_ci;
v_diff := v_ci - v_si;
v_diff_pct := (v_diff / v_si) * 100;
DBMS_OUTPUT.PUT_LINE('==============================');
DBMS_OUTPUT.PUT_LINE(' BANK INTEREST CALCULATOR ');

DBMS_OUTPUT.PUT_LINE('==============================');
DBMS_OUTPUT.PUT_LINE('Principal : Rs.' ||
TO_CHAR(v_p, '99,999'));
DBMS_OUTPUT.PUT_LINE('Rate : ' || v_r || '%');
DBMS_OUTPUT.PUT_LINE('Years : ' || v_t);
DBMS_OUTPUT.PUT_LINE('Simple Interest : Rs.' ||
TO_CHAR(v_si, '99,999.99'));
DBMS_OUTPUT.PUT_LINE('Compound Interest : Rs.' ||
TO_CHAR(v_ci, '99,999.99'));
DBMS_OUTPUT.PUT_LINE('Final SI Amount : Rs.' ||
TO_CHAR(v_final_si, '99,999.99'));
DBMS_OUTPUT.PUT_LINE('Final CI Amount : Rs.' ||
TO_CHAR(v_final_ci, '99,999.99'));
DBMS_OUTPUT.PUT_LINE('SI vs CI Difference : Rs.' ||
TO_CHAR(v_diff, '99,999.99'));
DBMS_OUTPUT.PUT_LINE('Difference % : ' ||
ROUND(v_diff_pct, 2) || '%');
IF v_ci > v_si * 1.10 THEN
DBMS_OUTPUT.PUT_LINE(
'Tip: FD is better than savings account for this amount.'
);
ELSE
DBMS_OUTPUT.PUT_LINE(
'Tip: Difference is not more than 10%.'
);
END IF;
END;
/