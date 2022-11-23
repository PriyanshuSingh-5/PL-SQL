set serveroutput on;

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