SET SERVEROUTPUT ON;
DECLARE
v_roll_no NUMBER := 51;
v_name VARCHAR2(30) := 'Jatin';
v_gross NUMBER := 1000000;
v_taxable NUMBER;
v_tax NUMBER := 0;
v_tds NUMBER;
v_monthly_takehome NUMBER;
BEGIN
v_taxable := GREATEST(v_gross - 75000, 0);
SELECT CASE
WHEN v_taxable <= 300000 THEN 0
WHEN v_taxable <= 700000 THEN (v_taxable-300000)*0.05
WHEN v_taxable <= 1000000 THEN 20000 + (v_taxable-700000)*0.10
WHEN v_taxable <= 1200000 THEN 50000 + (v_taxable-1000000)*0.15
WHEN v_taxable <= 1500000 THEN 80000 + (v_taxable-1200000)*0.20
ELSE 140000 + (v_taxable-1500000)*0.30
END
INTO v_tax

FROM dual;
v_tds := v_tax / 12;
v_monthly_takehome := (v_gross - v_tax) / 12;
DBMS_OUTPUT.PUT_LINE('Roll No: ' || v_roll_no);
DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
DBMS_OUTPUT.PUT_LINE('Gross Salary: Rs.' || v_gross);
DBMS_OUTPUT.PUT_LINE('Standard Deduction: Rs.75000');
DBMS_OUTPUT.PUT_LINE('Taxable Income: Rs.' || v_taxable);
DBMS_OUTPUT.PUT_LINE('Total Tax: Rs.' || v_tax);
DBMS_OUTPUT.PUT_LINE('Monthly TDS: Rs.' || ROUND(v_tds));
DBMS_OUTPUT.PUT_LINE('Monthly Take-home: Rs.' || ROUND(v_monthly_takehome));
IF v_tax = 0 THEN
DBMS_OUTPUT.PUT_LINE('No tax this year - save more with PPF/ELSS!');
END IF;
END;
/