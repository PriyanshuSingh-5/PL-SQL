CASE CONTROL STATEMENTS :- Type:-1. (Simple CASE Statement)

CASE selector
WHEN selector_value_1 THEN statements_1
WHEN selector_value_2 THEN statements_2
.
.
WHEN selector_value_n THEN statements_n
ELSE   else_statements
END CASE;

--====================================================
Example:-
--======
SET SERVEROUTPUT ON;
DECLARE
  V_grade CHAR(1);
BEGIN
  V_grade := &V_grade;

  CASE V_grade
    WHEN 'A' THEN DBMS_OUTPUT.PUT_LINE('Excellent');
    WHEN 'B' THEN DBMS_OUTPUT.PUT_LINE('Very Good');
    WHEN 'C' THEN DBMS_OUTPUT.PUT_LINE('Good');
    WHEN 'D' THEN DBMS_OUTPUT.PUT_LINE('Fair');
    WHEN 'F' THEN DBMS_OUTPUT.PUT_LINE('Poor');
    ELSE DBMS_OUTPUT.PUT_LINE('No such GRADE');
  END CASE;
END;
/

--====================================================
CASE CONTROL STATEMENTS :- Type:-2. (Searched CASE Statement)

CASE
WHEN condition_1 THEN statements_1
WHEN condition_2 THEN statements_2
.
.
WHEN condition_n THEN statements_n
ELSE   else_statements
END CASE;

--====================================================
Example:-
--======
SET SERVEROUTPUT ON;
DECLARE
  V_grade CHAR(1);
BEGIN
  V_grade := &V_grade;
 
  CASE
    WHEN V_grade = 'A' THEN DBMS_OUTPUT.PUT_LINE('Excellent');
    WHEN V_grade = 'B' THEN DBMS_OUTPUT.PUT_LINE('Very Good');
    WHEN V_grade = 'C' THEN DBMS_OUTPUT.PUT_LINE('Good');
    WHEN V_grade = 'D' THEN DBMS_OUTPUT.PUT_LINE('Fair');
    WHEN V_grade = 'F' THEN DBMS_OUTPUT.PUT_LINE('Poor');
    ELSE DBMS_OUTPUT.PUT_LINE('No such V_grade');
  END CASE;
END;
/


--====================================================
Example :-  EXCEPTION Instead of ELSE Clause in CASE Statement
--====================================================

DECLARE
  V_grade CHAR(1);
BEGIN
  V_grade := 'B';
 
  CASE
    WHEN V_grade = 'A' THEN DBMS_OUTPUT.PUT_LINE('Excellent');
    WHEN V_grade = 'B' THEN DBMS_OUTPUT.PUT_LINE('Very Good');
    WHEN V_grade = 'C' THEN DBMS_OUTPUT.PUT_LINE('Good');
    WHEN V_grade = 'D' THEN DBMS_OUTPUT.PUT_LINE('Fair');
    WHEN V_grade = 'F' THEN DBMS_OUTPUT.PUT_LINE('Poor');
  END CASE;
EXCEPTION
  WHEN CASE_NOT_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No such V_grade');
END;
