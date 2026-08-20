SET SERVEROUTPUT ON;
DECLARE
v_roll_no NUMBER := 51;
v_name VARCHAR2(30) := 'Jatin';
v_m1 NUMBER := 43;
v_m2 NUMBER := 53;
v_m3 NUMBER := 63;
v_m4 NUMBER := 73;
v_m5 NUMBER := 83;
v_total NUMBER;
v_pct NUMBER;
v_grade VARCHAR2(10);
v_result VARCHAR2(30);
v_failed VARCHAR2(200) := '';
BEGIN
v_total := v_m1 + v_m2 + v_m3 + v_m4 + v_m5;
v_pct := v_total / 5;
IF v_m1 < 35 OR v_m2 < 35 OR v_m3 < 35 OR v_m4 < 35 OR v_m5 < 35 THEN
v_result := 'DETAINED';
IF v_m1 < 35 THEN v_failed := v_failed || 'Subject 1 '; END IF;
IF v_m2 < 35 THEN v_failed := v_failed || 'Subject 2 '; END IF;
IF v_m3 < 35 THEN v_failed := v_failed || 'Subject 3 '; END IF;
IF v_m4 < 35 THEN v_failed := v_failed || 'Subject 4 '; END IF;
IF v_m5 < 35 THEN v_failed := v_failed || 'Subject 5 '; END IF;
ELSE
v_result := 'PASS';
IF v_pct >= 75 THEN
v_result := 'DISTINCTION';
ELSIF v_pct >= 60 THEN
v_result := 'FIRST CLASS';
ELSIF v_pct >= 50 THEN
v_result := 'SECOND CLASS';
ELSE
v_result := 'PASS';
END IF;
END IF;
IF v_pct >= 90 THEN v_grade := 'A+';
ELSIF v_pct >= 80 THEN v_grade := 'A';
ELSIF v_pct >= 70 THEN v_grade := 'B';
ELSIF v_pct >= 60 THEN v_grade := 'C';
ELSIF v_pct >= 50 THEN v_grade := 'D';
ELSE v_grade := 'FAIL';
END IF;
DBMS_OUTPUT.PUT_LINE('ROLL NO: ' || v_roll_no);
DBMS_OUTPUT.PUT_LINE('NAME : ' || v_name);
DBMS_OUTPUT.PUT_LINE('Subject 1: ' || v_m1);
DBMS_OUTPUT.PUT_LINE('Subject 2: ' || v_m2);
DBMS_OUTPUT.PUT_LINE('Subject 3: ' || v_m3);
DBMS_OUTPUT.PUT_LINE('Subject 4: ' || v_m4);
DBMS_OUTPUT.PUT_LINE('Subject 5: ' || v_m5);
DBMS_OUTPUT.PUT_LINE('Total: ' || v_total);
DBMS_OUTPUT.PUT_LINE('Percentage: ' || v_pct || '%');
DBMS_OUTPUT.PUT_LINE('Grade: ' || v_grade);
DBMS_OUTPUT.PUT_LINE('Result: ' || v_result);
IF v_result = 'DETAINED' THEN
DBMS_OUTPUT.PUT_LINE('Failed subjects: ' || v_failed);
END IF;
END;
/