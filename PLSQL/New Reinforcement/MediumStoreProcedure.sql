1)a)Create a stored procedure to update the salary of all employees who have worked for a specific department for a given period of time. alongwith table structure

--In this example, the stored procedure takes three input parameters (p_department_id, p_hire_date, p_salary_increase) and performs the following steps:

---Updates the salary of employees who work in the specified department (p_department_id) and have been hired on or before the specified date (p_hire_date).
--Increases their salary by the specified amount (p_salary_increase).
--Commits the transaction to save the changes.
--Note that this stored procedure assumes that the employees table already exists and has a department_id column to identify the employee's department, a hire_date column to identify the date they were hired, and a salary column to store their salary. You may need to adjust the table structure and stored procedure code to fit your specific requirements.
CREATE TABLE employeesdatatable (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    department_id NUMBER,
    hire_date DATE,
    salary NUMBER(10,2)
);
select* from employeesdatatable 
insert into employeesdatatable(employee_id,first_name,last_name,department_id,hire_date,salary)values(10, 'Ginny', 'Hopper', 2, TO_DATE('2021-01-01', 'YYYY-MM-DD'),34000)
CREATE OR REPLACE PROCEDURE update_salary_for_department(
    p_department_id     IN NUMBER,
    p_hire_date         IN DATE,
    p_salary_increase   IN NUMBER
)
IS
BEGIN
    -- Update salary for employees who match the criteria
    UPDATE employeesdatatable
    SET salary = salary + p_salary_increase
    WHERE department_id = p_department_id
    AND hire_date <= p_hire_date;
    
    -- Commit transaction
    COMMIT;
END;
/

---another one:
--This code uses the UPDATE statement to modify the data in the employees table. The SET clause specifies which column to update and how to update it. In this case, we're updating the salary column of the employees table by adding the p_salary_increase value to the current salary value of each employee.

--The WHERE clause is used to filter the rows that will be updated. In this case, we're only updating the rows where the department_id column matches the value of the p_department_id parameter, and the hire_date column is between the p_start_date and p_end_date parameters. This ensures that we're only updating the salaries of employees who work in the specified department and were hired during the specified time period.

--So, putting it all together, this code snippet updates the salaries of all employees in the specified department who were hired during the specified time period by adding the specified amount to their current salary.

--I hope that clears things up! Let me know if you have any other questions.

CREATE OR REPLACE PROCEDURE UPDATE_SALARY_BY_DEPT_TIME(
    p_department_id IN NUMBER,
    p_start_date IN DATE,
    p_end_date IN DATE,
    p_salary_increase IN NUMBER
) IS
BEGIN
    IF p_salary_increase <= 0 THEN
        DBMS_OUTPUT.PUT_LINE('Salary increase amount must be greater than zero.');
        RETURN;
    ELSIF p_salary_increase >= 10000 THEN
        DBMS_OUTPUT.PUT_LINE('Salary increase amount cannot exceed 10000.');
        RETURN;
    END IF;

    UPDATE employeesdatatable e
    SET e.salary = e.salary + p_salary_increase
    WHERE e.department_id = p_department_id
    AND e.hire_date >= p_start_date
    AND e.hire_date <= p_end_date;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' employees have been given a salary increase of ' || p_salary_increase || ' for the period between ' || p_start_date || ' and ' || p_end_date || ' in department ' || p_department_id);
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error updating salaries: ' || SQLERRM);
END;


DECLARE
    v_department_id     NUMBER := 3;   -- Specify the department ID
    v_hire_date         DATE   := TO_DATE('2022-01-01', 'YYYY-MM-DD');   -- Specify the hire date
    v_salary_increase   NUMBER := 1000;   -- Specify the salary increase
BEGIN
    update_salary_for_department(
        p_department_id     => v_department_id,
        p_hire_date         => v_hire_date,
        p_salary_increase   => v_salary_increase
    );
END;
/

BEGIN
  UPDATE_SALARY_BY_DEPT_TIME(2, TO_DATE('01-JAN-2021','DD-MON-YYYY'), TO_DATE('31-DEC-2022','DD-MON-YYYY'), 1000);
END;


1)b)--Create a stored procedure takes three input parameters (p_customer_id, p_order_date, p_items) do following:
->Generates a unique order ID using a sequence.
->Inserts the order data into the orders table.
->Inserts the order items data into the order_items table using a loop to iterate over the items in the input parameter.
->Calculates the total amount for the order by multiplying the quantity and unit price of each item and summing the results.
->Updates the total_amount column in the orders table with the calculated total.


CREATE TABLE customersdata (
    customer_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(50),
    address VARCHAR2(50),
    city VARCHAR2(50),
    state VARCHAR2(50),
    country VARCHAR2(50),
    postal_code VARCHAR2(50)
);
select * from customersdata
select * from orderDetails
select * from orderItems
insert into customersdata(customer_id,customer_name,address,city,state,country,postal_code )values(5,'Johny', 'Orleans','Africa', 'United', 'Asian',40081)
CREATE TABLE orderDetails (
    order_id NUMBER PRIMARY KEY,
    customer_id NUMBER REFERENCES customers(customer_id),
    order_date DATE,
    total_amount NUMBER(10,2)
);
insert into orderDetails(order_id,customer_id,order_date,total_amount) values(2,1,TO_DATE('2022-05-09', 'YYYY-MM-DD'),8000)
CREATE TABLE orderItems (
    order_id NUMBER REFERENCES orders(order_id),
    item_name VARCHAR2(50),
    quantity NUMBER,
    unit_price NUMBER(10,2)
);
insert into orderItems(order_id,item_name,quantity,unit_price)values(1,'silicon',5, 9000)

CREATE SEQUENCE orders_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE OR REPLACE PROCEDURE create_order(
    p_customer_id NUMBER,
    p_order_date DATE,
    p_items SYS.ODCINUMBERLIST
)
IS
    v_order_id NUMBER;
    v_total_amount NUMBER := 0;
BEGIN
    -- Generate unique order ID using a sequence
   SELECT orders_seq.NEXTVAL INTO v_order_id FROM dual;
   --orders_seq.NEXTVAL is a call to an Oracle sequence named orders_seq that generates a unique order ID.

---The SELECT ... FROM dual statement retrieves the next value from the sequence and stores it in the variable v_order_id.

---In Oracle, the dual table is a special one-row, one-column table that can be used in SQL statements when no other table is available. In this case, the dual table is used to provide a source for the SELECT statement to retrieve the next value from the sequence.

    -- Insert order data into the orders table
    INSERT INTO orderDetails(order_id, customer_id, order_date)
    VALUES(v_order_id, p_customer_id, p_order_date);

    -- Loop through each item in the input parameter and insert it into the order_items table
    FOR i IN 1..p_items.COUNT LOOP
        -- Insert order item data into the order_items table
        INSERT INTO orderItems(order_id, item_name, quantity, unit_price)
        VALUES(v_order_id, 'Item ' || i, p_items(i), 10.00);  -- Assuming each item has a unit price of $10.00
        
        -- Calculate the total amount for the order
        v_total_amount := v_total_amount + (p_items(i) * 10.00); -- Multiply quantity by unit price and sum the results
    END LOOP;

    -- Update the total_amount column in the orders table with the calculated total
    UPDATE orderDetails SET total_amount = v_total_amount WHERE order_id = v_order_id;

    -- Commit transaction
    COMMIT;
END;
/



SET serveroutput on;

DECLARE
    v_customer_id NUMBER := 5;   -- Specify the customer ID
    v_order_date DATE := SYSDATE;   -- Use the current date as the order date
    v_items SYS.ODCINUMBERLIST := SYS.ODCINUMBERLIST(2, 9, 2); --SYS.ODCINUMBERLIST is a collection type in Oracle that can be used to hold a list of numbers.
    -- Specify the list of item quantities
BEGIN
    create_order(
        p_customer_id => v_customer_id,
        p_order_date => v_order_date,
        p_items => v_items
    );
END;
/





