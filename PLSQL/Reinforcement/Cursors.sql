cursor:
1)implicit
2)explicit

1) implicit cursor:

inbuilt attributes:

->%ISOPEN
->%FOUND
->%ROWCOUNT


declare
begin

insert into employeetable(empno,ename, gender,salary, job) values(1056,'Rose','M',56000 ,'developer');

if(SQL%Found) then
dbms_output.put_line('True');
else
dbms_output.put_line('false');
end if;

end;
/

select * from Employeetable;



set serveroutput on;
declare 
p_name employeetable.ename%type;

cursor c_list is
select ename from employeetable;

begin
open c_list;

fetch c_list into p_name;
dbms_output.put_line(C_list%ROWCOUNT|| '-' || p_name);
fetch c_list into p_name;
dbms_output.put_line(C_list%ROWCOUNT|| '-' || p_name);
fetch c_list into p_name;
dbms_output.put_line(C_list%ROWCOUNT|| '-' || p_name);
fetch c_list into p_name;
dbms_output.put_line(C_list%ROWCOUNT|| '-' || p_name);
fetch c_list into p_name;
dbms_output.put_line(C_list%ROWCOUNT|| '-' || p_name);
fetch c_list into p_name;
dbms_output.put_line(C_list%ROWCOUNT|| '-' || p_name);
fetch c_list into p_name;
dbms_output.put_line(C_list%ROWCOUNT|| '-' || p_name);
fetch c_list into p_name;
dbms_output.put_line(C_list%ROWCOUNT|| '-' || p_name);
fetch c_list into p_name;
dbms_output.put_line(C_list%ROWCOUNT|| '-' || p_name);
fetch c_list into p_name;
dbms_output.put_line(C_list%ROWCOUNT|| '-' || p_name);
fetch c_list into p_name;
dbms_output.put_line(C_list%ROWCOUNT|| '-' || p_name);
fetch c_list into p_name;
dbms_output.put_line(C_list%ROWCOUNT|| '-' || p_name);
fetch c_list into p_name;
dbms_output.put_line(C_list%ROWCOUNT|| '-' || p_name);
fetch c_list into p_name;
dbms_output.put_line(C_list%ROWCOUNT|| '-' || p_name);
fetch c_list into p_name;
dbms_output.put_line(C_list%ROWCOUNT|| '-' || p_name);

close c_list;
end;
/


set serveroutput on;
declare 
p_name employeetable.ename%type;

cursor c_list is
select ename from employeetable;

begin
open c_list;
loop
fetch c_list into p_name;
exit when c_list%NOTFOUND;
dbms_output.put_line(C_list%ROWCOUNT|| '-' || p_name);

end loop;
close c_list;
end;
/


set serveroutput on;
declare 
p_name employeetable.ename%type;

cursor c_list is
select ename from employeetable;

begin
open c_list;
for i in c_list
loop
fetch c_list into p_name;
dbms_output.put_line(C_list%ROWCOUNT|| '-' || p_name);

end loop;
close c_list;
end;
/


declare
p_name employeetable.ename%type;
cursor C1 is

select ename from Employeetable;

begin
for i in C1
loop
fetch C1 into p_name;
dbms_output.put_line(C1%ROWCOUNT|| '-' || p_name);
end loop;
close C1;
end;
/

