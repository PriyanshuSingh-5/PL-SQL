PL/SQL offers two other statements to handle out of the ordinary requirements for sequential processing: GOTO and NULL. The GOTO statement allows you to perform unconditional branching to another executable statement in the same execution section of a PL/SQL block. The NULL statement gives you a way to tell the compiler to do...absolutely nothing.


Goto Statement:

DECLARE
  p  VARCHAR2(30);
  n  PLS_INTEGER := 37;
BEGIN
  FOR j in 2..ROUND(SQRT(n)) LOOP
    IF n MOD j = 0 THEN
      p := ' is not a prime number';
      GOTO print_now;
    END IF;
  END LOOP;

  p := ' is a prime number';
 
  <<print_now>>
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(n) || p);
END;
/



DECLARE
  done  BOOLEAN;
BEGIN
  FOR i IN 1..50 LOOP
    IF done THEN
       GOTO end_loop;
    END IF;
    <<end_loop>>
  END LOOP;
END;
/


Null statements:

DECLARE
  v_job_id  VARCHAR2(10);
   v_emp_no  NUMBER(6) := 110;
BEGIN
  SELECT job_id INTO v_job_id
  FROM employees
  WHERE empno = v_emp_no;
  
  IF v_job_id = 'SA_REP' THEN
    UPDATE employees
    SET commission_pct = commission_pct * 1.2;
  ELSE
    NULL;  -- Employee is not a sales rep
  END IF;
END;
/

  