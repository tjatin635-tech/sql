SET SERVEROUTPUT ON;
DECLARE
c_gst_rate CONSTANT NUMBER := 18;
v_base_price NUMBER;
v_cgst NUMBER;
v_sgst NUMBER;
v_total NUMBER;
v_city VARCHAR2(50) := NULL;
BEGIN
v_base_price := 51 * 500 + 1000;
v_cgst := v_base_price * 9 / 100;
v_sgst := v_base_price * 9 / 100;
v_total := v_base_price + v_cgst + v_sgst;

DBMS_OUTPUT.PUT_LINE('Base Price: Rs.' || v_base_price);
DBMS_OUTPUT.PUT_LINE('GST Rate: ' || c_gst_rate || '%');
DBMS_OUTPUT.PUT_LINE('CGST: Rs.' || v_cgst);
DBMS_OUTPUT.PUT_LINE('SGST: Rs.' || v_sgst);
DBMS_OUTPUT.PUT_LINE('Total Price: Rs.' || v_total);
DBMS_OUTPUT.PUT_LINE('Using NVL:');
DBMS_OUTPUT.PUT_LINE('City: ' || NVL(v_city, 'Ahmedabad'));
DBMS_OUTPUT.PUT_LINE('Using NVL2:');
IF v_city IS NOT NULL THEN
DBMS_OUTPUT.PUT_LINE('City Known: ' || v_city);
ELSE
DBMS_OUTPUT.PUT_LINE('City Unknown');
END IF;
END;
/
