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
                           
-- Program End