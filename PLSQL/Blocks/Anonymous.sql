What is Anonymous block in pl sql ?
--====================================================
Note:-
1. it is a set of lines codes (collection of statements)  which performe some task.  
1. Not saved or stored in Database.
3. always performing those task which we need to perform only once or twice.

--====================================================
Anonymous Block / Anonymous Programs :- any task that having some meaning purpose / logical activity
Types of Anonymous Block. 
1. STATIC Anonymous Block / Programs
2. DYNAMIC Anonymous Block / Programs
--====================================================


--====================================================
--STRUCTURE OF any PLSQL Block or Program
--====================================================

--DECLARE  -- Optional--

BEGIN  --Mandatory

dbms_output.put_line ('Hello Oracle Shooter');
--EXCEPTION  -- Optional--

END;  --Mandatory

-------------------------------------
OUTPUT:-
Hello Oracle Shooter


--====================================================
STATIC Anonymous Block
--====================================================
SET SERVEROUTPUT ON;
DECLARE  
V_Value1 NUMBER;
V_Value2 NUMBER;
V_TOTAL NUMBER;

BEGIN 
V_Value1 := 10;
V_Value2 := 15;

V_TOTAL := V_Value1 + V_Value2 ;

dbms_output.put_line (  'Total : '||V_TOTAL);

END; 
/
-------------------------------------

--====================================================
DYNAMIC Anonymous Block
--====================================================
SET SERVEROUTPUT ON;
DECLARE  -- Optional--
V_Value1 NUMBER;
V_Value2 NUMBER;
V_TOTAL NUMBER;

BEGIN 

V_TOTAL := &V_Value1 + &V_Value2 ;

dbms_output.put_line (  'Total '||V_TOTAL);
--dbms_output.put_line ( V_TOTAL );

END; 
/


