SET SERVEROUTPUT ON;
DECLARE
v_name VARCHAR2(50) := 'Jatin';
v_roll_no NUMBER := 51;
v_message VARCHAR2(100) := 'Welcome to PL/SQL!';
v_lucky NUMBER;
BEGIN
v_lucky := MOD(v_roll_no, 7) + 1;
DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
DBMS_OUTPUT.PUT_LINE('Roll Number: ' || v_roll_no);
DBMS_OUTPUT.PUT_LINE(v_message);
DBMS_OUTPUT.PUT_LINE('Lucky Number: ' || v_lucky);
END;
/