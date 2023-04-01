1) a) Create a stored procedure to update the salary of all employees on basis of their id and provide a hike according to their experience in three category. First one, If employee has experience of 2 years give a hike of 10%. Second one, If employee has experience of 5 years give a hike of 30%.Third one, If employee has experience of 7 years give a hike of 50%.


CREATE TABLE employeesdatatable (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    department_id NUMBER,
    hire_date DATE,
    salary NUMBER(10,2)
);

select* from employeesdatatable 
insert into employeesdatatable(employee_id,first_name,last_name,department_id,hire_date,salary)values(4, 'Ram', 'Sen', 3, TO_DATE('2019-06-03', 'YYYY-MM-DD'),34000)


CREATE OR REPLACE PROCEDURE update_employee_salary(p_id_list IN VARCHAR2)
IS
  v_id_list SYS.ODCINUMBERLIST;
  v_experience_years NUMBER;
  v_hike_pct NUMBER;
BEGIN
  -- Convert comma-separated string of employee IDs to a collection of numbers
  v_id_list := SYS.ODCINUMBERLIST();
  FOR id IN (SELECT regexp_substr(p_id_list, '[^,]+', 1, LEVEL) AS emp_id
             FROM dual
             CONNECT BY LEVEL <= regexp_count(p_id_list, ',') + 1)
  LOOP
    v_id_list.extend;
    v_id_list(v_id_list.count) := id.emp_id;
  END LOOP;

  -- Iterate through the employee IDs in the collection
  FOR i IN 1..v_id_list.COUNT LOOP
    -- Get the employee's experience
    SELECT (SYSDATE - hire_date)/365 INTO v_experience_years FROM employeesdatatable WHERE employee_id = v_id_list(i);

    -- Calculate the salary hike based on experience
    IF v_experience_years >= 7 THEN
      v_hike_pct := 0.5;
    ELSIF v_experience_years >= 5 THEN
      v_hike_pct := 0.3;
    ELSIF v_experience_years >= 2 THEN
      v_hike_pct := 0.1;
    ELSE
      v_hike_pct := 0;
    END IF;

    -- Update the employee's salary with the calculated hike
    UPDATE employeesdatatable SET salary = salary * (1 + v_hike_pct) WHERE employee_id = v_id_list(i);
  END LOOP;

  COMMIT;
END;
/

BEGIN
  update_employee_salary('1,2,3');
END;
/



1)b)Create a  stored procedure takes four input (p_name, p_address, p_salary, p_department) :
->Validates the input data to ensure that none of the parameters are null.
->Generates a unique employee ID using a sequence.
->Inserts the employee data into the employee table.
->Inserts or updates the department data in the department table. If the department already exists, it updates the total_employees and ->average_salary columns; otherwise, it inserts a new row with the initial values.


CREATE TABLE EmployeeDetails (
   emp_id NUMBER PRIMARY KEY,
   name VARCHAR2(50) NOT NULL,
   address VARCHAR2(100) NOT NULL,
   salary NUMBER NOT NULL,
   department VARCHAR2(50) NOT NULL
);


CREATE TABLE Department (
   dept_id NUMBER PRIMARY KEY,
   department_name VARCHAR2(50) NOT NULL,
   total_employees NUMBER DEFAULT 0,
   average_salary NUMBER DEFAULT 0
);
insert into Department(dept_id,department_name,total_employees,average_salary)values(1,'Marketing',50,50000)
CREATE SEQUENCE employees_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE OR REPLACE PROCEDURE insert_employee (
  p_name      IN EmployeeDetails.name%TYPE,
  p_address   IN EmployeeDetails.address%TYPE,
  p_salary    IN EmployeeDetails.salary%TYPE,
  p_department IN department.department_name%TYPE
  
) IS
  v_employee_id EmployeeDetails.emp_id%TYPE;
  
BEGIN
  -- Check if any of the input parameters are null
  IF p_name IS NULL OR p_address IS NULL OR p_salary IS NULL OR p_department IS NULL THEN
    RAISE_APPLICATION_ERROR(-20001, 'Input parameters cannot be null.');
  END IF;
  
  -- Generate a unique employee ID using a sequence
  SELECT employees_seq.NEXTVAL INTO v_employee_id FROM dual;

  -- Insert the employee data into the employee table
  INSERT INTO EmployeeDetails (emp_id, name, address, salary, department)
  VALUES (v_employee_id, p_name, p_address, p_salary, p_department);

  -- Insert or update the department data in the department table
  BEGIN
    -- Try to update the existing department
    UPDATE department
    SET total_employees = total_employees + 1,
        average_salary = (average_salary * (total_employees - 1) + p_salary) / total_employees
    WHERE department_name = p_department;
    
    -- If the department doesn't exist, insert a new row
    IF SQL%NOTFOUND THEN
      INSERT INTO department (department_name, total_employees, average_salary)
      VALUES (p_department, 1, p_salary);
    END IF;
  END;
  
  COMMIT;
END;
/


BEGIN
   insert_employee('John Doe', '123 Main St', 50000, 'Marketing');
END;
