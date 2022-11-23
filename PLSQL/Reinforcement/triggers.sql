Trigger:
clauses:
1)new: updated data
2)old: previous data in table

CREATE OR REPLACE TRIGGER display_salary_changes 
BEFORE DELETE OR INSERT OR UPDATE ON emp 
FOR EACH ROW 
WHEN (NEW.emp_no > 0) 
DECLARE 
   sal_diff number; 
BEGIN 

   sal_diff := :NEW.salary  - :OLD.salary; 
   dbms_output.put_line('Old salary: ' || :OLD.salary); 
   dbms_output.put_line('New salary: ' || :NEW.salary); 
   dbms_output.put_line('Salary difference: ' || sal_diff); 
END; 
/ 

begin
insert into emp(emp_no,emp_name,salary,manager)values(9,'swetha', 45000, 'xyz');
end;
/

begin
update emp set salary= salary+5000 where emp_no=9;
end;
/

begin
delete from emp where emp_no=7;
end;
/



select * from dept;
select * from emp;


create view empl_view(
Employee_name,dept_name,location) as select emp.emp_name, dept.dept_name, dept.location from emp,dept where emp.dept_no=dept.dept_no;
/

select * from empl_view;

begin
update empl_view set location='jaipur' where employee_name='YYY5';
commit;
end;
/


create trigger emp_view_modify
instead of update
on empl_view
for each row
begin
update dept
set location=:new.location
where dept_name=:old.dept_name;
end;
/


