1)Assuming that you have a table named "employees" with columns "emp_id", "emp_name", "salary", and "dept_id" to store employee data, you can create a stored function in PL/SQL to calculate the percentage of employees who have a salary above the average for their department as follows:

CREATE TABLE employeesdatatable (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    department_id NUMBER,
    hire_date DATE,
    salary NUMBER(10,2)
);
drop table department_stats
create table department_stats(department_id Number, Dept_Name varchar2(50),above_avg_pct Number)
insert into department_stats(department_id,Dept_Name,above_avg_pct)Values(2,'marketing',4)

select * from employeesdatatable
select * from department_stats

CREATE OR REPLACE FUNCTION calculate_above_avg_pct
  RETURN NUMBER
IS
  v_total_emp_count  NUMBER;
  v_above_avg_count  NUMBER;
  v_dept_id          NUMBER;
  v_dept_avg_salary  NUMBER;
BEGIN
  v_total_emp_count := 0;
  v_above_avg_count := 0;

  FOR dept_rec IN (SELECT DISTINCT department_id FROM employeesdatatable)
  LOOP
    v_dept_id := dept_rec.department_id;

    SELECT AVG(salary)
    INTO   v_dept_avg_salary
    FROM   employeesdatatable
    WHERE  department_id = v_dept_id;

    SELECT COUNT(*)
    INTO   v_total_emp_count
    FROM   employeesdatatable
    WHERE  department_id = v_dept_id;

    SELECT COUNT(*)
    INTO   v_above_avg_count
    FROM   employeesdatatable
    WHERE  department_id = v_dept_id
           AND salary > v_dept_avg_salary;

    UPDATE department_stats
    SET    above_avg_pct = v_above_avg_count / v_total_emp_count
    WHERE  department_id = v_dept_id;
  END LOOP;

  RETURN 1;
END;
/


SET serveroutput on;
DECLARE
  result NUMBER;
BEGIN
  result := calculate_above_avg_pct();
  DBMS_OUTPUT.PUT_LINE('Result: ' || result);
END;
