
----structure of Blocks---
DECLARE
Declaration Statements
BEGIN
Executable statements
Exception
Exception handling statements
END;




---Declaration Block---
DECLARE
Var_first_name VARCHAR2(30);
Var_last_name   VARCHAR2(30);
Con_flag        CONSTANT        NUMBER:=0;



-----Execution Block----
BEGIN
SELECT first_name, last_name INTO var_first_name,
var_last_name
FROM employee WHERE id =1;
DBMS_OUTPUT.PUT_LINE
(‘Employee Name ’||var_first_name||’ ‘||var_last_name);
END;


------Exception Handling Block----

EXCEPTION
WHEN NO_DATA_FOUND THEN      DBMS_OUTPUT.PUT_LINE (‘No Employee Found with ’||employee_id);




---Factorial--
SET SERVEROUTPUT ON;
declare
   
-- declare variable num , fact
-- and temp of datatype number
 num number := 6;             
 fact number := 1;            
 temp number;        
   
begin
   
temp :=num;
  
-- here we check condition 
-- with the help of while loop
while( temp>0 )             
loop
fact := fact*temp;
temp := temp-1;
  
end loop;
  
dbms_output.put_line('factorial of '|| num || ' is ' || fact);
  
 end; 
 /





