Stored procedure:

create or replace procedure nameofprocedure()
is 
begin
---
end;
/

exec procedure name()

Function:

create or replace function nameofFunction
return datatype
is 
begin
---
end;
/



create or replace function TotalCount
return number is
total number:=0;
begin
select count(*) into total from customers;
return total;
end;
/



declare
c number;
begin
c:=TotalCount();
DBMS_OUTPUT.PUT_LINE ('total number of customers is ' || c);
end;
/
