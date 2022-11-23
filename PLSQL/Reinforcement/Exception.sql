Exception:
1)inbuilt or system defined or named exceptions
2)user defined

error code  exception name
   ORA-01403 :         no_data_found


declare
p_name customers.name%type;
p_custid customers.customer_id%type := &customer_id;

begin
select name into p_name from customers where customer_id= p_custid;
DBMS_OUTPUT.PUT_LINE (' customers name is ' || p_name);
end;
/

declare
p_name customers.name%type;
p_custid customers.customer_id%type := &customer_id;

begin
select name into p_name from customers where customer_id= p_custid;
DBMS_OUTPUT.PUT_LINE (' customers name is ' || p_name);

exception
when no_data_found then
DBMS_OUTPUT.PUT_LINE (' customer' || p_custid || 'does not exist');
end;
/


user defined:
1) raise through
2)raise application error


1)

declare
marks number:= 85;
not_allowed exception;
begin
if marks<95 then
raise not_allowed;
end if;

exception
when not_allowed then
DBMS_OUTPUT.PUT_LINE (' you are not selected for MBBS');
end;
/


declare
marks number:= 85;
begin
if marks<95 then
raise_application_error(20008, 'you are not selected for MBBS');
end if;


exception when others then
DBMS_OUTPUT.PUT_LINE (SQLERRM);
end;
/


SQLCODE  returns no of encountered error
SQLERRM returns message associated with error number












