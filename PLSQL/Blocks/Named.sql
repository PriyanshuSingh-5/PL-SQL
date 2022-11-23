--Named Block--
--====================================================
--DROP PROCEDURE XX_ADD_PROC
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE XX_ADD_PROC AS

V_ID NUMBER(10);
V_NAME VARCHAR(25);
V_DEPARTMENT VARCHAR(25);
V_MOBILE NUMBER(10);


BEGIN

V_ID := '8888';
V_NAME := 'RAVI';
V_DEPARTMENT := 'SALESMAN';
V_MOBILE := 11000;

dbms_output.put_line ('Empno | '||V_ID);
dbms_output.put_line ('Name | '||V_NAME);
dbms_output.put_line ('Department | '||V_DEPARTMENT);
dbms_output.put_line ('Mobile | '||V_MOBILE);

EXCEPTION 
WHEN OTHERS THEN
dbms_output.put_line (  'We are in Exception so please check your process' );

END; 





--====================================================

BEGIN
XX_ADD_PROC;
END;

select * from all_objects
where object_name = 'XX_ADD_PROC'

