Functions:

syntax:

create or replace function <name> (parameters)
return<type>

is
variables;
begin
statements;
return<expr>
end;
/

Example:

----Declaring, Defining, and Invoking a Simple PL/SQL Function that computes and returns the maximum of two values.
DECLARE 
   a number; 
   b number; 
   c number; 
FUNCTION findMax(x IN number, y IN number)  
RETURN number 
IS 
    z number; 
BEGIN 
   IF x > y THEN 
      z:= x; 
   ELSE 
      Z:= y; 
   END IF;  
   RETURN z; 
END; 
BEGIN 
   a:= 23; 
   b:= 45;  
   c := findMax(a, b); 
   dbms_output.put_line(' Maximum of (23,45): ' || c); 
END; 
/ 


----no of employees


CREATE OR REPLACE FUNCTION totalCustomers 
RETURN number IS 
   total number(2) := 0; 
BEGIN 
   SELECT count(*) into total 
   FROM Employee; 
    
   RETURN total; 
END; 
/ 


--to run function

DECLARE 
   c number(2); 
BEGIN 
   c := totalCustomers(); 
   dbms_output.put_line('Total no. of Customers: ' || c); 
END; 
/

----factorial
DECLARE 
   num number; 
   factorial number;  
   
FUNCTION fact(x number) 
RETURN number  
IS 
   f number; 
BEGIN 
   IF x=0 THEN 
      f := 1; 
   ELSE 
      f := x * fact(x-1); 
   END IF; 
RETURN f; 
END;  

BEGIN 
   num:= 6; 
   factorial := fact(num); 
   dbms_output.put_line(' Factorial '|| num || ' is ' || factorial); 
END; 
/