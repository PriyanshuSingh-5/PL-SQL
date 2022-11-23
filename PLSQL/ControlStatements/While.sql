
--WHILE LOOP Statement
 
  WHILE Condition LOOP
    Action perform
    value ++ (Increment)
  END LOOP;
 
=====================================================
Ex:1-
SET SERVEROUTPUT ON;
DECLARE
  i  Number:= 0;
 
BEGIN

  WHILE i<5 LOOP
    DBMS_OUTPUT.PUT_LINE ('Loop running time :- '||i);
    i :=i+1; 
  END LOOP;

END;
/

--OUTPUT

Loop running time :- 0
Loop running time :- 1
Loop running time :- 2
Loop running time :- 3
Loop running time :- 4

--=======
Ex:2-
--=======
SET SERVEROUTPUT ON;
DECLARE
  V_START  BOOLEAN := FALSE;
BEGIN

  WHILE V_START LOOP
    DBMS_OUTPUT.PUT_LINE ('This line does not print.');
    V_START := TRUE;  -- This assignment is not made.
  END LOOP;

  WHILE NOT V_START LOOP
    DBMS_OUTPUT.PUT_LINE ('Hello, Oracle db');
    V_START := TRUE;
  END LOOP;

END;
/

--OUTPUT
Hello, Oracle db

