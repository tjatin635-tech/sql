SET SERVEROUTPUT ON;
DECLARE
v_roll_no NUMBER := 51;
v_name VARCHAR2(30) := 'Jatin';
v_attendance NUMBER := 51;
v_theory NUMBER := 31;
v_practical NUMBER := 13;
v_assignment NUMBER := 8;
v_counted_assignment NUMBER;
v_total NUMBER := 0;
v_pct NUMBER := 0;
v_grade VARCHAR2(5);
v_result VARCHAR2(30);
v_remark VARCHAR2(100);
BEGIN
v_counted_assignment := LEAST(v_assignment,10);
IF v_attendance < 40 THEN
v_result := 'DETAINED';
v_remark := 'Attendance below 40%';
ELSIF v_theory < 28 THEN
v_result := 'FAIL IN THEORY';
v_remark := 'Theory marks below passing requirement';
ELSIF v_practical < 12 THEN
v_result := 'FAIL IN PRACTICAL';
v_remark := 'Practical marks below passing requirement';
ELSE
v_total := v_theory + v_practical + v_counted_assignment;
v_pct := (v_total / 120) * 100;
SELECT CASE
WHEN v_pct >= 90 THEN 'A+'
WHEN v_pct >= 80 THEN 'A'
WHEN v_pct >= 70 THEN 'B'
WHEN v_pct >= 60 THEN 'C'
WHEN v_pct >= 50 THEN 'D'
ELSE 'F'
END INTO v_grade FROM dual;
v_result := 'PASS';
IF v_pct >= 75 THEN
v_remark := 'Distinction';
ELSIF v_pct >= 60 THEN
v_remark := 'First Class';
ELSIF v_pct >= 50 THEN
v_remark := 'Second Class';
ELSE
v_remark := 'Pass';
END IF;
END IF;
DBMS_OUTPUT.PUT_LINE('Roll No: ' || v_roll_no);
DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
DBMS_OUTPUT.PUT_LINE('Attendance: ' || v_attendance || '%');
DBMS_OUTPUT.PUT_LINE('Theory: ' || v_theory || '/70');
DBMS_OUTPUT.PUT_LINE('Practical: ' || v_practical || '/30');
DBMS_OUTPUT.PUT_LINE('Assignment Counted: ' || v_counted_assignment || '/10');
DBMS_OUTPUT.PUT_LINE('Total: ' || v_total || '/110');
DBMS_OUTPUT.PUT_LINE('Percentage: ' || ROUND(v_pct,2) || '%');
DBMS_OUTPUT.PUT_LINE('Grade: ' || NVL(v_grade,'-'));
DBMS_OUTPUT.PUT_LINE('Result: ' || v_result);
DBMS_OUTPUT.PUT_LINE('Remark: ' || v_remark);
END;
/
