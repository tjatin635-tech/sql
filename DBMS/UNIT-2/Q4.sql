SET SERVEROUTPUT ON;
DECLARE
v_roll_no NUMBER := 51;
v_table NUMBER := MOD(v_roll_no,9) + 2;
v_height NUMBER := 5 + MOD(v_roll_no,5);
BEGIN
DBMS_OUTPUT.PUT_LINE('Part A - Table of ' || v_table);
FOR i IN 1..20 LOOP
DBMS_OUTPUT.PUT_LINE(v_table || ' x ' || i || ' = ' || v_table*i);
END LOOP;

DBMS_OUTPUT.PUT_LINE('Part B - Tables 2 to 5');
FOR t IN 2..5 LOOP
FOR i IN 1..10 LOOP
DBMS_OUTPUT.PUT_LINE(LPAD(t || ' x ' || i || ' = ' || t*i, 16));
END LOOP;
DBMS_OUTPUT.PUT_LINE('');
END LOOP;
DBMS_OUTPUT.PUT_LINE('Part C - Right Angled Star Triangle');
FOR i IN 1..v_height LOOP
FOR j IN 1..i LOOP
DBMS_OUTPUT.PUT('*');
END LOOP;
DBMS_OUTPUT.NEW_LINE;
END LOOP;
DBMS_OUTPUT.PUT_LINE('Part D - Number Pyramid');
FOR i IN 1..6 LOOP
FOR j IN 1..i LOOP
DBMS_OUTPUT.PUT(j);
END LOOP;
DBMS_OUTPUT.NEW_LINE;
END LOOP;
DBMS_OUTPUT.PUT_LINE('Part E - Reverse Triangle');
FOR i IN REVERSE 1..v_height LOOP
FOR j IN 1..i LOOP
DBMS_OUTPUT.PUT('*');
END LOOP;
DBMS_OUTPUT.NEW_LINE;
END LOOP;
END;
/
