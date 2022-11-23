--Explicit Cursor
/*
An explicit cursor is a session cursor that you           construct and manage.
You must declare and define an explicit cursor, giving it a name and associating it with a query (typically, the query returns multiple rows).

we can process  Explicit cursor  data by using two ways as below

1. Open the explicit cursor (with the OPEN statement), fetch rows from the result set (with the FETCH statement), and close the explicit cursor (with the CLOSE statement).
2. Use the explicit cursor in a cursor FOR LOOP statement
*/

Example:- --============================================
--- DECLARE / OPEN  / FETCH / CLOSE ----     without loop fetch statement ----

SET SERVEROUTPUT ON;
DECLARE
  v_name EmployeeTable.ENAME%TYPE;
 
  CURSOR C1 IS 
  SELECT ename FROM EmployeeTable ;

    BEGIN
     
        OPEN C1;
          
            FETCH C1 INTO v_name;   DBMS_OUTPUT.PUT_LINE (C1%ROWCOUNT||' - '||v_name);
            FETCH C1 INTO v_name;   DBMS_OUTPUT.PUT_LINE (C1%ROWCOUNT||' - '||v_name);
            FETCH C1 INTO v_name;   DBMS_OUTPUT.PUT_LINE (C1%ROWCOUNT||' - '||v_name);
            FETCH C1 INTO v_name;   DBMS_OUTPUT.PUT_LINE (C1%ROWCOUNT||' - '||v_name);
            FETCH C1 INTO v_name;   DBMS_OUTPUT.PUT_LINE (C1%ROWCOUNT||' - '||v_name);
            FETCH C1 INTO v_name;   DBMS_OUTPUT.PUT_LINE (C1%ROWCOUNT||' - '||v_name);
            FETCH C1 INTO v_name;   DBMS_OUTPUT.PUT_LINE (C1%ROWCOUNT||' - '||v_name);
            FETCH C1 INTO v_name;   DBMS_OUTPUT.PUT_LINE (C1%ROWCOUNT||' - '||v_name);
            FETCH C1 INTO v_name;   DBMS_OUTPUT.PUT_LINE (C1%ROWCOUNT||' - '||v_name);
            FETCH C1 INTO v_name;   DBMS_OUTPUT.PUT_LINE (C1%ROWCOUNT||' - '||v_name);
            
            FETCH C1 INTO v_name;   DBMS_OUTPUT.PUT_LINE (C1%ROWCOUNT||' - '||v_name);
            FETCH C1 INTO v_name;   DBMS_OUTPUT.PUT_LINE (C1%ROWCOUNT||' - '||v_name);
            FETCH C1 INTO v_name;   DBMS_OUTPUT.PUT_LINE (C1%ROWCOUNT||' - '||v_name);
             FETCH C1 INTO v_name;   DBMS_OUTPUT.PUT_LINE (C1%ROWCOUNT||' - '||v_name);
              FETCH C1 INTO v_name;   DBMS_OUTPUT.PUT_LINE (C1%ROWCOUNT||' - '||v_name);
               FETCH C1 INTO v_name;   DBMS_OUTPUT.PUT_LINE (C1%ROWCOUNT||' - '||v_name);
                FETCH C1 INTO v_name;   DBMS_OUTPUT.PUT_LINE (C1%ROWCOUNT||' - '||v_name);
               
             
        CLOSE C1;
     
    END;
    /

select * from employeetable;

--========================== Single Column =================
set serveroutput on;
DECLARE
  v_name EmployeeTable.ENAME%TYPE;

  CURSOR C1 IS 
  SELECT ename FROM EmployeeTable;

    BEGIN     
        OPEN C1;
            LOOP               
                FETCH C1 INTO v_name; 
                 EXIT WHEN C1%NOTFOUND;
                 DBMS_OUTPUT.PUT_LINE (C1%ROWCOUNT||' - '||v_name);
                   
            END LOOP;
           
        CLOSE C1;     
    END;



--========================== Duble Column =================
set serveroutput on;
DECLARE
  v_name EmployeeTable.ENAME%TYPE;
  V_Sal EmployeeTable.Salary%TYPE;

  CURSOR C1 IS 
  SELECT ename, salary FROM EmployeeTable ;

    BEGIN     
        OPEN C1;
            LOOP               
                FETCH C1 INTO v_name, V_Sal;
                EXIT WHEN C1%NOTFOUND;                                 
                 DBMS_OUTPUT.PUT_LINE (C1%ROWCOUNT||' - '||v_name||' | salary is :- '||V_Sal);
                   
            END LOOP;
           
        CLOSE C1;     
    END;



--==================Full Table Column  Used ========================   
 SET SERVEROUTPUT ON:  
DECLARE
  V_EMP EmployeeTable%ROWTYPE;

  CURSOR C1 IS 
  SELECT * FROM EmployeeTable ;

    BEGIN     
        OPEN C1;
            LOOP               
                FETCH C1 INTO V_EMP;                    
            EXIT WHEN C1%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE (C1%ROWCOUNT||' - '||V_EMP.ename||' | '||V_EMP.gender||' | '||V_EMP.salary);
            END LOOP;
        CLOSE C1;     
    END;
   /


--====================================================   
--- CURSOR FOR LOOP ----
--====================================================
set serveroutput on;
DECLARE

  CURSOR C1 IS 
  SELECT * FROM EmployeeTable ;

    BEGIN     
        FOR I IN C1 
            LOOP               
                DBMS_OUTPUT.PUT_LINE (C1%ROWCOUNT||' - '||I.Gender );                            
            END LOOP;     
    END;



