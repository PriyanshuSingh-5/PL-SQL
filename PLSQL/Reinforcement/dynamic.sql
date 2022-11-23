dynamic sql:
1)execute immediate (native dynamic sql)
2)dbms sql


begin
truncate table dept;
end;

begin
execute immediate 'truncate table dept';
end;

create or replace procedure Checksal(v_emp_no number)
as
v_sql varchar2(500);
v_sal number;
begin
v_sql:='select salary from emp where emp_no=: empmo';
execute immediate v_sql into v_sal using v_emp_no;
dbms_output.put_line('salary is: ' || v_sal);
end;


execute Checksal(1000);
