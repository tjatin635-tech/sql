SET SERVEROUTPUT ON;
DECLARE
v_roll_no NUMBER := 51;
v_n NUMBER := 5 + MOD(v_roll_no,8);
v_a NUMBER := 0;
v_b NUMBER := 1;
v_c NUMBER;
v_i NUMBER := 1;
v_last NUMBER := 0;
v_num NUMBER;
v_div NUMBER;
v_prime BOOLEAN;
v_count NUMBER := 0;
v_x NUMBER := 84;
v_y NUMBER := 36;
v_r NUMBER;
v_gcd NUMBER;
v_perfect_num NUMBER := 28;
v_sum NUMBER := 0;
v_d NUMBER := 1;
BEGIN
DBMS_OUTPUT.PUT_LINE('Part A - First ' || v_n || ' Fibonacci numbers');
WHILE v_i <= v_n LOOP
DBMS_OUTPUT.PUT_LINE(v_a);
v_last := v_a;
v_c := v_a + v_b;
v_a := v_b;
v_b := v_c;
v_i := v_i + 1;
END LOOP;
DBMS_OUTPUT.PUT_LINE('Part B - Is Nth Fibonacci prime?');
v_prime := TRUE;
IF v_last < 2 THEN
v_prime := FALSE;
ELSE
v_div := 2;
WHILE v_div <= FLOOR(SQRT(v_last)) LOOP
IF MOD(v_last,v_div)=0 THEN
v_prime := FALSE;
EXIT;
END IF;
v_div := v_div + 1;
END LOOP;
END IF;
IF v_prime THEN DBMS_OUTPUT.PUT_LINE(v_last || ' is PRIME');
ELSE DBMS_OUTPUT.PUT_LINE(v_last || ' is NOT PRIME');
END IF;
DBMS_OUTPUT.PUT_LINE('Part C - Primes from 1 to 100');
v_num := 2;
WHILE v_num <= 100 LOOP
v_prime := TRUE;

v_div := 2;
WHILE v_div <= FLOOR(SQRT(v_num)) LOOP
IF MOD(v_num,v_div)=0 THEN v_prime := FALSE; EXIT; END IF;
v_div := v_div + 1;
END LOOP;
IF v_prime THEN
DBMS_OUTPUT.PUT(v_num || ' ');
v_count := v_count + 1;
END IF;
v_num := v_num + 1;
END LOOP;
DBMS_OUTPUT.NEW_LINE;
DBMS_OUTPUT.PUT_LINE('Prime count: ' || v_count);
DBMS_OUTPUT.PUT_LINE('Part D - GCD');
WHILE v_y <> 0 LOOP
v_r := MOD(v_x,v_y);
v_x := v_y;
v_y := v_r;
END LOOP;
v_gcd := v_x;
DBMS_OUTPUT.PUT_LINE('GCD = ' || v_gcd);
DBMS_OUTPUT.PUT_LINE('Part E - Perfect Number Check');
WHILE v_d <= v_perfect_num/2 LOOP
IF MOD(v_perfect_num,v_d)=0 THEN
v_sum := v_sum + v_d;
END IF;
v_d := v_d + 1;
END LOOP;
IF v_sum = v_perfect_num THEN
DBMS_OUTPUT.PUT_LINE(v_perfect_num || ' is a PERFECT NUMBER');
ELSE
DBMS_OUTPUT.PUT_LINE(v_perfect_num || ' is NOT a perfect number');
END IF;
END;
/