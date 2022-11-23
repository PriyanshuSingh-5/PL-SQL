Control statements:
if statements:

1)if then statement
2)if then else
3)nested if
4)if then elseif

1)if then statement:

set serveroutput on;
declare
num1 number:=10;
num2 number:=5;
begin
if num1> num2 then
dbms_output.put_line('I am in if block');
end if;
dbms_output.put_line('I am outside if block');
end;
/

2)if then else:

set serveroutput on;
declare
num1 number:=10;
num2 number:=5;
begin
if num1> num2 then
dbms_output.put_line('I am in if block');
else
dbms_output.put_line('I am in else block');
end if;
end;
/


3)nested if:

{[()]}


set serveroutput on;
declare
num1 number:=10;
num2 number:=5;
num3 number:=20;
begin
if num1> num2 then
dbms_output.put_line('I am in if block');
if num1< num3 then
dbms_output.put_line('I am in if block');
end if;
end if;
dbms_output.put_line('I am in else block');

end;
/


4)if then elseif then else:

set serveroutput on;
declare
num1 number:=10;
num2 number:=20;
begin
if num1< num2 then
dbms_output.put_line('num 1 is small');
elsif num1=num2 then
dbms_output.put_line('both are equal');
else
dbms_output.put_line('num2 is small');
end if;
end;
/


case statement:

1) simple
2)searched

set serveroutput on;
declare
grade char(1);
begin
grade:='B';
Case grade

when 'A' then dbms_output.put_line('num2 is small');
when 'B' then dbms_output.put_line('num3 is small');
when 'C' then dbms_output.put_line('num1 is small');
when 'D' then dbms_output.put_line('num4 is small');
when 'E' then dbms_output.put_line('num5 is small');
when 'F' then dbms_output.put_line('num6 is small');
else dbms_output.put_line('num7 is small');

end case;
end;
/


set serveroutput on;
declare
grade char(1);
begin
grade:='B';
Case 

when grade='A' then dbms_output.put_line('num2 is small');
when grade='B' then dbms_output.put_line('num3 is small');
when grade='C' then dbms_output.put_line('num1 is small');
when grade='D' then dbms_output.put_line('num4 is small');
when grade='E' then dbms_output.put_line('num5 is small');
when grade='F' then dbms_output.put_line('num6 is small');
else dbms_output.put_line('num7 is small');

end case;
end;
/






