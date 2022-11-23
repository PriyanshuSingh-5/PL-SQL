Create TABLE Employee( id number(10), Name varchar(25), Department varchar2(25), mobile number(10));


Insert into Employee(id,Name,Department,mobile) Values (7,'joe', 'Tech', 89467);

select * from Employee;


update Employee set Name='Alex' where id= 1;

delete from Employee where id=4;