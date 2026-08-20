SET SERVEROUTPUT ON;
<<outer_block>>
DECLARE
v_city VARCHAR2(30) := 'Gujarat';
v_num NUMBER := 100;
BEGIN
DBMS_OUTPUT.PUT_LINE('--- OUTER BLOCK ---');
DBMS_OUTPUT.PUT_LINE('City: ' || v_city);
DBMS_OUTPUT.PUT_LINE('Number: ' || v_num);
<<middle_block>>
DECLARE
v_city VARCHAR2(30) := 'Ahmedabad';
v_num NUMBER := 200;
BEGIN
DBMS_OUTPUT.PUT_LINE('--- MIDDLE BLOCK ---');
DBMS_OUTPUT.PUT_LINE('City: ' || v_city);
DBMS_OUTPUT.PUT_LINE('Number: ' || v_num);
DECLARE
v_num NUMBER := 300;
BEGIN
DBMS_OUTPUT.PUT_LINE('--- INNER BLOCK ---');
DBMS_OUTPUT.PUT_LINE('City: ' || middle_block.v_city);
DBMS_OUTPUT.PUT_LINE('Middle Number: ' ||
middle_block.v_num);
DBMS_OUTPUT.PUT_LINE('Inner Number: ' || v_num);
DBMS_OUTPUT.PUT_LINE('Outer City: ' ||
outer_block.v_city);
END;
DBMS_OUTPUT.PUT_LINE('--- AFTER INNER BLOCK ---');
DBMS_OUTPUT.PUT_LINE('Middle City: ' || v_city);
DBMS_OUTPUT.PUT_LINE('Middle Number: ' || v_num);
END middle_block;
DBMS_OUTPUT.PUT_LINE('--- AFTER MIDDLE BLOCK ---');
DBMS_OUTPUT.PUT_LINE('Outer City: ' || v_city);
DBMS_OUTPUT.PUT_LINE('Outer Number: ' || v_num);
END outer_block;
/
