SET SERVEROUTPUT ON;
DECLARE
v_name VARCHAR2(100) := 'Jatin';
v_roll NUMBER := 51;
v_dob DATE := TO_DATE('15-03-2004', 'DD-MM-YYYY');
v_upper VARCHAR2(100);
v_first VARCHAR2(50);
v_id VARCHAR2(50);
v_age NUMBER;
v_card_name VARCHAR2(100);
BEGIN
v_upper := UPPER(v_name);
IF INSTR(v_name, ' ') > 0 THEN
v_first := SUBSTR(
v_name, 1, INSTR(v_name, ' ') - 1
);
ELSE
v_first := v_name;
END IF;
v_id := 'LJICA' ||
TO_CHAR(v_dob, 'YYYY') ||
LPAD(v_roll, 3, '0');

v_age := TRUNC(
MONTHS_BETWEEN(SYSDATE, v_dob) / 12
);
v_card_name := REPLACE(v_upper, ' ', ' ');
DBMS_OUTPUT.PUT_LINE(
'========================================'
);
DBMS_OUTPUT.PUT_LINE(
' LJICA STUDENT ID CARD'
);
DBMS_OUTPUT.PUT_LINE(
'========================================'
);
DBMS_OUTPUT.PUT_LINE(
RPAD('Name', 15, ' ') || ': ' || v_card_name
);
DBMS_OUTPUT.PUT_LINE(
RPAD('First Name', 15, ' ') || ': ' || UPPER(v_first)
);
DBMS_OUTPUT.PUT_LINE(
RPAD('Roll Number', 15, ' ') || ': ' || v_roll
);
DBMS_OUTPUT.PUT_LINE(
RPAD('Student ID', 15, ' ') || ': ' || v_id
);
DBMS_OUTPUT.PUT_LINE(
RPAD('Date of Birth', 15, ' ') || ': ' ||
TO_CHAR(v_dob, 'DD-MON-YYYY')
);
DBMS_OUTPUT.PUT_LINE(
RPAD('Age', 15, ' ') || ': ' || v_age
);
DBMS_OUTPUT.PUT_LINE(
RPAD('Name Length', 15, ' ') || ': ' ||
LENGTH(v_name)
);
DBMS_OUTPUT.PUT_LINE(
'========================================'
);
IF LENGTH(v_name) > 20 THEN
DBMS_OUTPUT.PUT_LINE(
'Long name detected - abbreviation required.'
);
ELSE
DBMS_OUTPUT.PUT_LINE(
'Name length is normal.'
);
END IF;
END;
/