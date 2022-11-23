--Example:- --Implicit cursor
DML events are:-

1. Insert
2. Update
3. Delete

--====================================================

select * from EmployeeTable


-- INSERT --

Insert into EmployeeTable values ( 1009,    'Nitin Kumar',    '11-Sep-1985',    '11-Mar-2020',    'M' ,   '21000',    '20',    sysdate,    'DEVELOPER', ''    )




DECLARE

BEGIN

Insert into EmployeeTable(empno,ename,gender,salary, job) values ( 1009,    'Nitin Kumar',     'M' ,   '21000',    'DEVELOPER' );

END;








-- INSERT --

DECLARE

BEGIN

Insert into EmployeeTable values ( 10019,    'Nitin Kumar',    '11-Sep-1985',    '11-Mar-2020',    'M' ,   '21000',    '20',    sysdate,    'DEVELOPER', ''    );


    IF (SQL%FOUND) THEN
    dbms_output.put_line ('Done');
    ELSE
    dbms_output.put_line ('Not Done');
    END IF;

END;

OUTPUT:- Done

select * from EmployeeTable


-- UPDATE --

update EmployeeTable
set COMM = 100
where DEPTNO=20;


DECLARE

BEGIN

update EmployeeTable set COMM = 100 where DEPTNO=20;


    IF (SQL%FOUND) THEN
    dbms_output.put_line ('Done');
    ELSE
    dbms_output.put_line ('Not Done');
    END IF;

END;



-- DELETE --

delete from EmployeeTable where empno = 1007
