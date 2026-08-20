SET SERVEROUTPUT ON;
DECLARE
v_food NUMBER := 350;
v_distance NUMBER := 5;
v_rain BOOLEAN := TRUE;
v_late_night BOOLEAN := FALSE;
v_festival BOOLEAN := FALSE;
v_peak BOOLEAN := FALSE;
v_first_order BOOLEAN := TRUE;
v_hour NUMBER := 13;
v_base NUMBER := 0;
v_rain_charge NUMBER := 0;
v_night_charge NUMBER := 0;
v_festival_charge NUMBER := 0;
v_peak_charge NUMBER := 0;
v_delivery NUMBER := 0;
v_grand NUMBER;
BEGIN
IF v_distance < 3 THEN
v_base := 0;
ELSIF v_distance <= 8 THEN
v_base := 29;
ELSIF v_distance <= 15 THEN
v_base := 49;
ELSE
v_base := 79;
END IF;
v_delivery := v_base;
IF v_food > 499 THEN
v_delivery := 0;
ELSE
IF v_rain THEN
v_rain_charge := ROUND(v_base * 0.20);
END IF;
SELECT CASE WHEN v_late_night THEN ROUND(v_base*0.15) ELSE 0 END,
CASE WHEN v_festival THEN ROUND(v_base*0.10) ELSE 0 END,
CASE WHEN v_peak THEN ROUND(v_base*0.10) ELSE 0 END
INTO v_night_charge, v_festival_charge, v_peak_charge
FROM dual;
v_delivery := v_base + v_rain_charge + v_night_charge +
v_festival_charge + v_peak_charge;
IF v_first_order THEN
v_delivery := ROUND(v_delivery * 0.50);

END IF;
END IF;
v_grand := v_food + v_delivery;
DBMS_OUTPUT.PUT_LINE('Food Total: Rs.' || v_food);
DBMS_OUTPUT.PUT_LINE('Base Delivery: Rs.' || v_base);
DBMS_OUTPUT.PUT_LINE('Rain Surcharge: Rs.' || v_rain_charge);
DBMS_OUTPUT.PUT_LINE('Late Night Surcharge: Rs.' || v_night_charge);
DBMS_OUTPUT.PUT_LINE('Festival Surcharge: Rs.' || v_festival_charge);
DBMS_OUTPUT.PUT_LINE('Peak Hour Surcharge: Rs.' || v_peak_charge);
DBMS_OUTPUT.PUT_LINE('Final Delivery: Rs.' || v_delivery);
DBMS_OUTPUT.PUT_LINE('Grand Total: Rs.' || v_grand);
END;
/
