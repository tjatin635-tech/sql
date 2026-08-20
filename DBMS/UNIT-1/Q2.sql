SET SERVEROUTPUT ON;
DECLARE
v_name VARCHAR2(50) := 'Jatin';
v_marks NUMBER(5,2) := 420;
v_percentage NUMBER(5,2);
v_dob DATE := SYSDATE;
v_passed BOOLEAN;
BEGIN
v_percentage := ROUND((v_marks / 500) * 100, 2);
IF v_percentage >= 40 THEN
v_passed := TRUE;
ELSE
v_passed := FALSE;
END IF;
DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
DBMS_OUTPUT.PUT_LINE('Marks: ' || v_marks);
DBMS_OUTPUT.PUT_LINE('Percentage: ' || v_percentage || '%');
DBMS_OUTPUT.PUT_LINE('Today''s Date: ' ||
TO_CHAR(v_dob, 'DD-MON-YYYY'));
IF v_passed THEN
DBMS_OUTPUT.PUT_LINE('Result: PASS');
ELSE
DBMS_OUTPUT.PUT_LINE('Result: FAIL');
END IF;
END;
/