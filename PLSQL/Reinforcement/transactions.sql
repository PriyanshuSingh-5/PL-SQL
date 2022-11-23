transaction:
1)commit
2)rollback
3)rollback with savepoint

select * from employeetable;
1)commit:

insert into employeetable(empno,ename,gender,salary) values(1021, 'jena', 'F', 36000);
commit;

2)insert into employeetable(empno,ename,gender,salary) values(1022, 'priya', 'F', 36000);
rollback;

3)rollback with savepoint

insert into employeetable(empno,ename,gender,salary) values(1022, 'priya', 'F', 36000);
savepoint sav1;

update employeetable set salary=salary+1000;
rollback to sav1;

update employeetable set salary=salary+1500 where empno=1056;

commit;



autonomous transaction:
set serveroutput on;
declare
I_salary number;
procedure nested_block is
pragma autonomous_transaction;
begin
update employeetable set salary=salary+1500 where empno=1001;
commit;
end;
begin

select salary into I_salary from employeetable where empno=1000;
dbms_output.put_line('before salary of 1000 is'|| I_salary);
select salary into I_salary from employeetable where empno=1002;
dbms_output.put_line('before salary of 1002 is'|| I_salary);

update employeetable set salary=salary+1500 where empno=1056;

nested_block;
rollback;

select salary into I_salary from employeetable where empno=1000;
dbms_output.put_line('after salary of 1000 is'|| I_salary);
select salary into I_salary from employeetable where empno=1002;
dbms_output.put_line('after salary of 1002 is'|| I_salary);

end;
/


