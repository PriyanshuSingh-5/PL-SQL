Predefined Exceptions ( Named Exception):-
Predefined exceptions are internally defined exceptions that have predefined names.
The runtime system raises predefined exceptions implicitly (automatically).
Because predefined exceptions have names, you can write exception handlers specifically for them.

Syntax:-


EXCEPTION

WHEN OTHERS THEN
<Handler>

END;

SQLCODE returns the number of the last encountered error.
SQLERRM returns the  message associated with its error-number argument.

Ex:-

Exception Name                      Error Code (SQLCODE)        ERROR Description (SQLERRM)
INVALID_NUMBER                       -1722                                  ORA-01722: invalid number  
NO_DATA_FOUND                      -1403                                   ORA-01403: no data found
TOO_MANY_ROWS                    -1422                                   ORA-01422: exact fetch returns more than requested number of rows
VALUE_ERROR                          -6502                                    ORA-06502: PL/SQL: numeric or value error: character string buffer too small
VALUE_ERROR                          -6502                                    ORA-06502: PL/SQL: numeric or value error: character to number conversion error
ZERO_DIVIDE                           -1476                                     ORA-01476: divisor is equal to zero



--==================================
NO_DATA_FOUND                          -1403
ORA-01403: no data found
--==================================
SET SERVEROUTPUT ON;
DECLARE
V_NAME EMPLOYEE.NAME%TYPE;

BEGIN

SELECT NAME INTO V_NAME
FROM EMPLOYEE
WHERE ID = 100;

EXCEPTION

WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('for this empid there is no data found in this table ');

WHEN OTHERS THEN
dbms_output.put_line('SQLCODE: '|| SQLCODE);
dbms_output.put_line('SQLERRM: '|| SQLERRM);

END;
/
--------------------------------------------------------------------------------------------------=
OUTPUT:-
SQLCODE: 100
SQLERRM: ORA-01403: no data found

OUTPUT:-
for this empid there is no data found in this table

--==================================
ZERO_DIVIDE                          -1476
ORA-01476: divisor is equal to zero
--==================================

DECLARE
  V_Total_Qty   NUMBER := 100;
  V_Count_Of_Person  NUMBER := 0;
 V_Per_distrib_Qty      NUMBER;

BEGIN
 
  V_Per_distrib_Qty := V_Total_Qty / V_Count_Of_Person; 

EXCEPTION

WHEN ZERO_DIVIDE THEN
DBMS_OUTPUT.PUT_LINE('Per person distributed quantity is zero ');

WHEN OTHERS THEN
dbms_output.put_line('SQLCODE: '|| SQLCODE);
dbms_output.put_line('SQLERRM: '|| SQLERRM);

END;

--------------------------------------------------------------------------------------------------=

OUTPUT:-
SQLCODE: -1476
SQLERRM: ORA-01476: divisor is equal to zero

OUTPUT:-
Per person distributed quantity is zero


--====================================================
--ORA-06502: PL/SQL: numeric or value error: character string buffer too small
--====================================================
SET SERVEROUTPUT ON;
declare
V_name VARCHAR2(3);
 
begin

select name
into V_name
from EMPLOYEE
where rownum = 1;

EXCEPTION

WHEN VALUE_ERROR THEN
DBMS_OUTPUT.PUT_LINE('Buffer size is too small ');

WHEN OTHERS THEN
dbms_output.put_line('SQLCODE: '|| SQLCODE);
dbms_output.put_line('SQLERRM: '|| SQLERRM);

end;
/

--------------------------------------------------------------------------------------------------=

OUTPUT:-
SQLCODE: -6502
SQLERRM: ORA-06502: PL/SQL: numeric or value error: character string buffer too small

OUTPUT:-
Buffer size is too small

--====================================================
--ORA-06502: PL/SQL: numeric or value error: character to number conversion error
--====================================================

declare

V_name NUMBER;
 
begin

select name
into V_name
from EMPLOYEE
where rownum = 1;

EXCEPTION
WHEN VALUE_ERROR THEN
DBMS_OUTPUT.PUT_LINE('your Variable datatype is wrong ');

WHEN OTHERS THEN
dbms_output.put_line('SQLCODE: '|| SQLCODE);
dbms_output.put_line('SQLERRM: '|| SQLERRM);

end;

--------------------------------------------------------------------------------------------------=

OUTPUT:-
SQLCODE: -6502
SQLERRM: ORA-06502: PL/SQL: numeric or value error: character to number conversion error

OUTPUT:-
your Variable datatype is wrong

--====================================================
--TOO_MANY_ROWS                   -1422
ORA-01422: exact fetch returns more than requested number of rows
--====================================================


declare
V_name EMPLOYEE.name%type;
 
begin

select name
into V_name
from EMPLOYEE;


EXCEPTION
WHEN TOO_MANY_ROWS THEN
DBMS_OUTPUT.PUT_LINE('your are tring to assing multiple row value in single variable ');

WHEN OTHERS THEN
dbms_output.put_line('SQLCODE: '|| SQLCODE);
dbms_output.put_line('SQLERRM: '|| SQLERRM);

end;

--------------------------------------------------------------------------------------------------=

OUTPUT:-
SQLCODE: -1422
SQLERRM: ORA-01422: exact fetch returns more than requested number of rows

OUTPUT:-
your are tring to assing multiple row value in single variable


--====================================================
--ORA-01722: "NAME": invalid number
ORA-01722: invalid number
--====================================================

DECLARE
V_NAME SCOTT.EMP.ENAME%TYPE;

BEGIN

insert into scott.emp (empno, sal) values ( 1234, 'manoj');

EXCEPTION
WHEN INVALID_NUMBER THEN
DBMS_OUTPUT.PUT_LINE('your are tring to to insert wrong value ');

WHEN OTHERS THEN
dbms_output.put_line('SQLCODE: '|| SQLCODE);
dbms_output.put_line('SQLERRM: '|| SQLERRM);
END;

--------------------------------------------------------------------------------------------------=

OUTPUT:-
SQLCODE: -1722
SQLERRM: ORA-01722: invalid number

OUTPUT:-
your are tring to to insert wrong value



