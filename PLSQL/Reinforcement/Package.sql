package:


1)package specification:
2)package body
3)use of package


package specification:

create or replace package c_Cust as

---add customer
procedure addcustomers(
c_id customers.customer_id%type,
c_name customers.name%type,
c_addr customers.address%type,
c_web customers.website%type
);

--remove a customer
procedure Delcustomers(
c_id customers.customer_id%type
);


---listing all customers
procedure ListCustomers;

end c_cust;
/



package body:

create or replace package body c_Cust as

---add customer
procedure addcustomers(
c_id customers.customer_id%type,
c_name customers.name%type,
c_addr customers.address%type,
c_web customers.website%type
)

is 
begin
insert into customers(customer_id,name, address,website) values(c_id,c_name,c_addr,c_web);
end addcustomers;

--remove a customer
procedure Delcustomers(
c_id customers.customer_id%type
)
is
begin
delete from customers where customer_id=c_id;
end Delcustomers;


---listing all customers
procedure ListCustomers is
cursor c_customers is
select name from customers;
type c_list is table of customers.name%type;
nameList c_list:=c_list();
counter integer:=0;
begin
for n in c_customers loop
counter:=counter+1;
nameList.extend;
nameList(counter):=n.name;
dbms_output.put_line('customer('||counter||')'||nameList(counter));
end loop;
end ListCustomers;

end c_cust;
/


select * from customers;


use this package:

declare
code customers.customer_id%type:=2;
begin
c_cust.addcustomers(1020,'ram','Mumbai','abc.com');
c_cust.ListCustomers;
c_cust.Delcustomers(code);

end;
/

begin

c_cust.addcustomers(1023,'ram','Mumbai','abc.com');

end;
/

