--FOR LOOP Statement

  FOR i IN START_INTEGER_VALUE..END_INTEGER_VALUE LOOP
        Action perform
  END LOOP;


 
--====================================================
Example  FOR LOOP Statements

SET SERVEROUTPUT ON;
BEGIN
  

  FOR i IN 1..3 LOOP
    DBMS_OUTPUT.PUT_LINE (i);
  END LOOP;

 

  FOR i IN 2..5 LOOP
    DBMS_OUTPUT.PUT_LINE (i);
  END LOOP;

  

  FOR i IN 3..1 LOOP
    DBMS_OUTPUT.PUT_LINE (i);
  END LOOP;

END;
/

--OUTPUT
lower_bound < upper_bound
1
2
3
lower_bound = upper_bound
2
lower_bound > upper_bound

--====================================================
Example :- Reverse FOR LOOP Statements

  FOR i IN REVERSE START_INTEGER_VALUE..END_INTEGER_VALUE LOOP
        Action perform
  END LOOP;
 
--====================================================
SET SERVEROUTPUT ON;
BEGIN
  DBMS_OUTPUT.PUT_LINE ('upper_bound > lower_bound');

  FOR i IN REVERSE 1..3 LOOP
    DBMS_OUTPUT.PUT_LINE (i);
  END LOOP;

  DBMS_OUTPUT.PUT_LINE ('upper_bound = lower_bound');

  FOR i IN REVERSE 2..2 LOOP
    DBMS_OUTPUT.PUT_LINE (i);
  END LOOP;

  DBMS_OUTPUT.PUT_LINE ('upper_bound < lower_bound');

  FOR i IN REVERSE 3..1 LOOP
    DBMS_OUTPUT.PUT_LINE (i);
  END LOOP;
 
END;
/
--OUTPUT
upper_bound > lower_bound
3
2
1
upper_bound = lower_bound
2
upper_bound < lower_bound