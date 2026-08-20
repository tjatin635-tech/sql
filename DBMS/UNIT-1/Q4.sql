SET SERVEROUTPUT ON;
DECLARE
v_fname employees.first_name%TYPE;
v_sal employees.salary%TYPE;
v_id NUMBER := 100 + MOD(51, 7);
BEGIN
SELECT first_name, salary
INTO v_fname, v_sal
FROM employees
WHERE employee_id = v_id;
DBMS_OUTPUT.PUT_LINE(
'Employee: ' || v_fname ||
' earns Rs.' || v_sal ||
' per month.'
);
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE(
'Employee not found - check the ID.'
);
END;
/
