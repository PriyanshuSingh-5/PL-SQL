-- Variables :-

1. Valid Name  2. Valid datatype 3. Valid Width

How to Initialize ?
assining of valid value to our variable is called initialization

Where we can Initialize ?
1. Declare section 2. Begin Section 3. Exception Section


Structure of PLSQL Block 
========================================

DECLARE
BEGIN
EXCEPTION
END;

  
--=================  DECLARE ================

DECLARE

V_NAME VARCHAR2(100) := 'Oracle Shooter' ;
na_me 
BEGIN

dbms_output.put_line ('I am In DECLARE Section  | '||V_NAME);

EXCEPTION WHEN OTHERS THEN dbms_output.put_line (  'We are in Exception so Please check your Program' );

END; 

--=================  BEGIN ======================

DECLARE

V_NAME VARCHAR2(100) ;

BEGIN

V_NAME := 'Oracle Shooter' ;
dbms_output.put_line ('I am in BIGIN Section   | '||V_NAME);

EXCEPTION WHEN OTHERS THEN dbms_output.put_line (  'We are in Exception so Please check your Program' );

END; 

--=================  EXCEPTION  ======================

DECLARE

V_NAME VARCHAR2(100) ;

BEGIN

V_NAME := 'ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ' ;

EXCEPTION WHEN OTHERS THEN

V_NAME := 'Oracle Shooter' ;
dbms_output.put_line ('I am in EXCEPTION Section   | '||V_NAME);

END;

