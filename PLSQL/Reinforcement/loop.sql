Loop statements:

1) loop with exit statement:
set serveroutput on;
declare
x number:=0;

begin
loop
dbms_output.put_line('inside loop: x '|| to_char(x));
x:= x+1;
if x>3 then
exit;
end if;
end loop;
dbms_output.put_line('outside loop: x '|| to_char(x));
end;
/

2) loop with exit when:

set serveroutput on;
declare
x number:=0;

begin
loop
dbms_output.put_line('inside loop: x '|| to_char(x));
x:= x+1;
exit when x>3; 
end loop;
dbms_output.put_line('outside loop: x '|| to_char(x));
end;
/


3)for loop:

set serveroutput on;
begin

for i in 1..5 loop

dbms_output.put_line('inside loop: i '|| to_char(i));
end loop;

end;
/

3)a)for loop with step clause:


set serveroutput on;
declare
i number:=10;
begin
for i in 1..5 loop

dbms_output.put_line('local:  '|| to_char(i) ||', global:' || to_char(main.i));
end loop;

end;
/

set serveroutput on;
DECLARE
  i NUMBER := 5;
BEGIN
  FOR i IN 1..3 LOOP
    DBMS_OUTPUT.PUT_LINE ('Inside loop, i is ' || TO_CHAR(i));
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE ('Outside loop, i is ' || TO_CHAR(i));
END;
/

4)while:
set serveroutput on;

declare
a number:=10;
begin
while a<20 loop

dbms_output.put_line('value of a:  '|| a);

a:=a+1;
end loop;

end;
/

