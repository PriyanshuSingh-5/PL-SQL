IF Control Statements in PLSQL


--====================================================
Control Statements
types of control statements as below
1. IF Control statements
2. CASE Control Statements

--====================================================
IF CONTROL STATEMENTS :- Type:- 1.(IF THEN Statement)
  
    IF  (Condition-1) THEN
        Perform Action-1                
    END IF;
--====================================================
Example:-
--======

SET SERVEROUTPUT ON;
DECLARE
  V_HINDI NUMBER;
  V_ENG NUMBER;
  V_MATHS NUMBER;
 
BEGIN
  V_HINDI := &HINDI;
  V_ENG := &ENGLISH;
  V_MATHS := &MATHS;
 
    IF V_HINDI > 33 THEN
    DBMS_OUTPUT.PUT_LINE('Pass in HINDI Subject');
    END IF;
   
    IF V_ENG > 33 THEN
    DBMS_OUTPUT.PUT_LINE('Pass in ENGLISH Subject');
    END IF;

    IF V_MATHS > 33 THEN
    DBMS_OUTPUT.PUT_LINE('Pass in MATHS Subject');
    END IF;

END;
/


--====================================================
IF CONTROL STATEMENTS :- Type:- 2.0 (IF THEN ELSE Statement)

    IF  (Condition-1) THEN
        Perform Action-1
        ELSE
        Perform Action-2                
    END IF;
--====================================================
Example:-
--======
SET SERVEROUTPUT ON;
DECLARE
  V_HINDI NUMBER;
  V_ENG NUMBER;
  V_MATHS NUMBER;
 
BEGIN
  V_HINDI := &HINDI;
  V_ENG := &ENGLISH;
  V_MATHS := &MATHS;
 
    IF V_HINDI > 33 THEN
    DBMS_OUTPUT.PUT_LINE('Pass in HINDI Subject');
    ELSE
    DBMS_OUTPUT.PUT_LINE('Fail in HINDI Subject');
    END IF;
   
    IF V_ENG > 33 THEN
    DBMS_OUTPUT.PUT_LINE('Pass in ENGLISH Subject');
    ELSE
    DBMS_OUTPUT.PUT_LINE('Fail in ENGLISH Subject');
    END IF;

    IF V_MATHS > 33 THEN
    DBMS_OUTPUT.PUT_LINE('Pass in MATHS Subject');
    ELSE
    DBMS_OUTPUT.PUT_LINE('Fail in MATHS Subject');
    END IF;

END;
/

--====================================================
IF CONTROL STATEMENTS :- Type:- 2.1  (Nested IF THEN ELSE Statements)

    IF  (Condition-1) THEN      
            IF  (Condition-2) THEN
                   IF  (Condition-3) THEN
                    Perform Action-1                            
                   END IF;     
           END IF;    
    END IF;
--====================================================
Example:-
--======

DECLARE
  V_HINDI NUMBER;
  V_ENG NUMBER;
  V_MATHS NUMBER;
  V_TOTAL NUMBER;
  V_PERCENT NUMBER;
 
BEGIN
  V_HINDI := &HINDI;
  V_ENG := &ENGLISH;
  V_MATHS := &MATHS;
 
    IF V_HINDI IS NOT NULL THEN
       {[( )]}
        IF V_ENG IS NOT NULL THEN
           
            IF V_MATHS IS NOT NULL THEN
               
                V_TOTAL := V_HINDI+ V_ENG + V_MATHS;
                V_PERCENT:= V_TOTAL/3;
                DBMS_OUTPUT.PUT_LINE('Total : '||  V_TOTAL  ||'  Your Percent  : '||V_PERCENT||'%');
                ELSE
                dbms_output.put_line ('MATHS marks is blank');
            END IF;               
            ELSE
            dbms_output.put_line ('ENGLISH marks is blank');
        END IF; 
    ELSE
    dbms_output.put_line ('hindi marks is blank');             
    END IF;       
END;




--====================================================   
IF CONTROL STATEMENTS :- Type:- 3. (IF THEN ELSIF Statement)

    IF  (Condition-1) THEN             
     Perform Action-1
    ELSIF  (Condition-2) THEN         
    Perform Action-2
    ELSIF  (Condition-3) THEN    
    Perform Action-3
    END IF;

--====================================================
Example:-
--======

DECLARE
  V_HINDI NUMBER;
  V_ENG NUMBER;
  V_MATHS NUMBER;
  V_TOTAL NUMBER;
  V_PERCENT NUMBER;
 
BEGIN
  V_HINDI := &HINDI;
  V_ENG := &ENGLISH;
  V_MATHS := &MATHS;
 
  V_TOTAL := V_HINDI+ V_ENG + V_MATHS;
  V_PERCENT:= V_TOTAL/3;
               
    IF V_PERCENT >= 90 THEN
    DBMS_OUTPUT.PUT_LINE('Excellent : '||V_PERCENT||'%');

    ELSIF V_PERCENT >= 70 AND V_PERCENT < 90 THEN
    DBMS_OUTPUT.PUT_LINE('Very Good : '||V_PERCENT||'%');

    ELSIF V_PERCENT >= 60 AND V_PERCENT < 70 THEN
    DBMS_OUTPUT.PUT_LINE('Good : '||V_PERCENT||'%');

    ELSIF V_PERCENT >= 50 AND V_PERCENT < 60 THEN
    DBMS_OUTPUT. PUT_LINE('Fair : '||V_PERCENT||'%');

    ELSIF V_PERCENT >= 40 AND V_PERCENT < 50 THEN
    DBMS_OUTPUT.PUT_LINE('Poor : '||V_PERCENT||'%');

    ELSE
    DBMS_OUTPUT.PUT_LINE('FAIL : '||V_PERCENT||'%');
    END IF;
      
END;
