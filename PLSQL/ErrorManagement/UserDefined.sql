User-Defined Exceptions


SQLCODE returns the number of the last encountered error.
SQLERRM returns the  message associated with its error-number argument.


--====================================================
User Defined Exceptions :-
You can declare your own exceptions in the declarative part of any PL/SQL anonymous block, subprogram, or package.

Syntax:-

DECLARE
<exception_name> EXCEPTION;

BEGIN

<Raise Execution block>

EXCEPTION
WHEN <exception_name> THEN
<Handler>
END;

--====================================================
--1 EXCEPTION Raise thru (RAISE STATEMENT)
--====================================================

DECLARE
  V_Your_age   NUMBER:=16;
  NOT_VALID_AGE EXCEPTION;
BEGIN
 
  IF V_Your_age < 18 THEN
    RAISE NOT_VALID_AGE;
  END IF;
  
EXCEPTION
WHEN NOT_VALID_AGE THEN
    DBMS_OUTPUT.PUT_LINE ('You are not authorized for vote you are below 18 years');   
END;


OUTPUT:-  You are not authrized for vote you are below 18 years

--====================================================
--2 EXCEPTION Raise thru ( RAISE_APPLICATION_ERROR )
--====================================================

DECLARE
  V_Your_age   NUMBER:=16;
BEGIN
 
  IF V_Your_age < 18 THEN
     RAISE_APPLICATION_ERROR (-20008, 'You are not authorized for vote you are below 18 years');
  END IF;
  
  EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE (SQLERRM);
END;


--OUTPUT:-  You are not authrized for vote you are below 18 years


--==================================
ZERO_DIVIDE                          -1476
ORA-01476: divisor is equal to zero
--==================================

DECLARE
V_Total_Qty   NUMBER := 100;
V_Count_Of_Person  NUMBER := 0;
V_Per_distrib_Qty      NUMBER;

ZERO_DIVISER EXCEPTION;

BEGIN

If  V_Count_Of_Person = 0 THEN
RAISE ZERO_DIVISER;
ELSE
  V_Per_distrib_Qty := V_Total_Qty / V_Count_Of_Person; 
END IF;

EXCEPTION

WHEN ZERO_DIVISER THEN
DBMS_OUTPUT.PUT_LINE('You can not distribute any thing to zero person so please check your no_of_person value ');

END;

OUTPUT:-
You can not distribute any thing to zero person so please check your no_of_person value