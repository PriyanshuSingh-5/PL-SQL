Object type:

1)attribute
2)methods


create object type:

create type emp_Obj as object(
emp_no number,
emp_name varchar2(50),
salary number,
manager varchar2(50),
constructor function emp_Obj(p_emp_no number, p_emp_name varchar2, p_salary number)return self as result,
member procedure insert_rec,
member procedure display_rec);
/



create or replace type body emp_obj as

constructor function emp_Obj(p_emp_no number, p_emp_name varchar2, p_salary number)return self as result
is
begin
dbms_output.put_line('constructor started');
self.emp_no:= p_emp_no;
self.emp_name:=p_emp_name;
self.salary:=p_salary;
self.manager:=1001;
return;
end;


member procedure insert_rec
is
begin
insert into emp(emp_no,emp_name,salary,manager)values(emp_no,emp_name,salary,manager);
end;
member procedure display_rec
is
begin
dbms_output.put_line('employee name : '||emp_name);
dbms_output.put_line('employee number : '||emp_no);
dbms_output.put_line('employee salary : '||salary);
dbms_output.put_line('employee manager : '||manager);
end;
end;
/

declare
emp_detail emp_obj;
begin
emp_detail:=emp_obj(1006,'abc',39999, 1000);
emp_detail.display_rec;
emp_detail.insert_rec;
commit;
end;
/

