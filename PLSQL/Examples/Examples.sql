set serveroutput on;

--Basically the use of SET SERVEROUTPUT is to display the query answer in SQL *PLUS interface... When you use the DBMS_OUTPUT. PUT_LINE procedure, the procedure will write the passing string into the Oracle buffer.

declare
 
-- declare variable x, y
-- and z of datatype number
x number(5);            
y number(5);           
z number(7);       
 
begin
 
-- Here we Assigning 10 into x
x:=10;                
 
-- Assigning 20 into x
y:=20;                
 
-- Assigning sum of x and y into z
z:=x+y;                
 
-- Print the Result
dbms_output.put_line('Sum is '||z);
end;
/                        
-- Program End