SET SERVEROUTPUT ON;

DECLARE
v_monthly_salary NUMBER := 25000;
v_existing_emi NUMBER := 1000;
v_loan_amount NUMBER := 250000;
v_annual_rate NUMBER := 10;
v_tenure_months NUMBER := 120;
v_r NUMBER;
v_emi NUMBER;
v_foir_limit NUMBER;
v_max_loan NUMBER;
v_approved NUMBER;
v_decision VARCHAR2(20);
v_total_emi NUMBER;
v_monthly_cost NUMBER;
BEGIN
v_r := v_annual_rate / 12 / 100;
v_foir_limit := v_monthly_salary * 0.40;
v_max_loan := v_monthly_salary * 60;
IF v_r = 0 THEN
v_emi := v_loan_amount / v_tenure_months;
ELSE
v_emi := v_loan_amount * v_r * POWER(1+v_r,v_tenure_months) /
(POWER(1+v_r,v_tenure_months)-1);
END IF;
v_total_emi := v_existing_emi + v_emi;
v_approved := LEAST(v_loan_amount, v_max_loan);
IF v_monthly_salary < 25000 THEN
v_decision := 'REJECTED';
v_approved := 0;
ELSIF v_total_emi <= v_foir_limit THEN
v_decision := 'APPROVED';
ELSE
v_approved := v_loan_amount;
WHILE v_approved > 0 LOOP
IF v_r = 0 THEN
v_emi := v_approved / v_tenure_months;
ELSE
v_emi := v_approved * v_r * POWER(1+v_r,v_tenure_months) /
(POWER(1+v_r,v_tenure_months)-1);
END IF;
EXIT WHEN v_existing_emi + v_emi <= v_foir_limit;
v_approved := v_approved - 10000;
END LOOP;
IF v_approved <= 0 THEN
v_decision := 'REJECTED';
v_approved := 0;
ELSE
v_decision := 'CONDITIONAL';
END IF;
END IF;
v_monthly_cost := v_existing_emi + v_emi;
SELECT CASE v_decision
WHEN 'APPROVED' THEN 'APPROVED'
WHEN 'CONDITIONAL' THEN 'CONDITIONAL'
ELSE 'REJECTED'
END INTO v_decision FROM dual;
DBMS_OUTPUT.PUT_LINE('Monthly Salary: Rs.' || v_monthly_salary);
DBMS_OUTPUT.PUT_LINE('Existing EMI: Rs.' || v_existing_emi);
DBMS_OUTPUT.PUT_LINE('Requested Loan: Rs.' || v_loan_amount);
DBMS_OUTPUT.PUT_LINE('Calculated EMI: Rs.' || ROUND(v_emi));
DBMS_OUTPUT.PUT_LINE('FOIR Limit: Rs.' || ROUND(v_foir_limit));
DBMS_OUTPUT.PUT_LINE('Maximum Loan Limit: Rs.' || v_max_loan);
DBMS_OUTPUT.PUT_LINE('Approved Amount: Rs.' || v_approved);
DBMS_OUTPUT.PUT_LINE('Decision: ' || v_decision);
DBMS_OUTPUT.PUT_LINE('Monthly Cost: Rs.' || ROUND(v_monthly_cost));
END;
/