---A package will have two mandatory parts ?

--Package specification
--Package body or definition


CREATE PACKAGE custsalar AS 
   PROCEDURE findsalary(id Employeetable.empno%type); 
END custsalar; 
/


CREATE OR REPLACE PACKAGE BODY custsalar AS  
   
   PROCEDURE findsalary(id EmployeeTable.empno%TYPE) IS 
   c_sal EmployeeTable.salary%TYPE; 
   BEGIN 
      SELECT salary INTO c_sal 
      FROM EmployeeTable
      WHERE empno = id; 
      dbms_output.put_line('Salary: '|| c_sal); 
   END findsalary; 
END custsalar; 
/

select * from EmployeeTable;

DECLARE 
   code EmployeeTable.empno%type := &eid; 
BEGIN 
   custsalar.findsalary(code); 
   
END; 
/



---another example:

CREATE OR REPLACE PACKAGE c_package AS 
   -- Adds a customer 
   PROCEDURE addCustomer(c_id   EmployeeTable.empno%type, 
   c_name EmployeeTable.EName%type, 
   c_age  EmployeeTable.gender%type, 
   c_sal EmployeeTable.salary%type,  
   c_job  EmployeeTable.job%type); 
   
   -- Removes a customer 
   PROCEDURE delCustomer(c_id  EmployeeTable.empno%TYPE); 
   --Lists all customers 
   PROCEDURE listCustomer; 
  
END c_package; 
/


CREATE OR REPLACE PACKAGE BODY c_package AS 
   PROCEDURE addCustomer(c_id  EmployeeTable.empno%TYPE, 
      c_name EmployeeTable.EName%type, 
   c_age  EmployeeTable.gender%type, 
   c_sal EmployeeTable.salary%type,  
   c_job  EmployeeTable.job%type);  
   IS 
   BEGIN 
      INSERT INTO EmployeeTable (empno,ename,gender,salary,job) 
         VALUES(c_id, c_name, c_age, c_sal,c_job); 
   END addCustomer; 
   
   PROCEDURE delCustomer(c_id  EmployeeTable.empno%TYPE) IS 
   BEGIN 
      DELETE FROM EmployeeTable
      WHERE empno = c_id; 
   END delCustomer;  
   
   PROCEDURE listCustomer IS 
   CURSOR c_EmployeeTable is 
      SELECT  name FROM EmployeeTable; 
   TYPE c_list is TABLE OF EmployeeTable.EName%type; 
   name_list c_list := c_list(); 
   counter integer :=0; 
   BEGIN 
      FOR n IN c_EmployeeTable LOOP 
      counter := counter +1; 
      name_list.extend; 
      name_list(counter) := n.name; 
      dbms_output.put_line('Customer(' ||counter|| ')'||name_list(counter)); 
      END LOOP; 
   END listCustomer;
   
END c_package; 
/

--execution:
DECLARE 
   code customers.id%type:= 8; 
BEGIN 
   c_package.addcustomer(7, 'Rajnish', 25, 'Chennai', 3500); 
   c_package.addcustomer(8, 'Subham', 32, 'Delhi', 7500); 
   c_package.listcustomer; 
   c_package.delcustomer(code); 
   c_package.listcustomer; 
END; 
/ 


output:


Customer(1): Ramesh  
Customer(2): Khilan  
Customer(3): kaushik     
Customer(4): Chaitali  
Customer(5): Hardik  
Customer(6): Komal 
Customer(7): Rajnish 
Customer(8): Subham 
Customer(1): Ramesh  
Customer(2): Khilan  
Customer(3): kaushik     
Customer(4): Chaitali  
Customer(5): Hardik  
Customer(6): Komal
Customer(7): Rajnish 

PL/SQL procedure successfully completed 
