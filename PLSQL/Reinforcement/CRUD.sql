create table CustomerTable( name varchar(25), Gender varchar(7), Address varchar(10))


insert into Customertable values('Radha','female','chennai');

create or replace procedure InsertCust(
p_name in Customertable.name%type,
p_gen in Customertable.Gender%type,
p_address in Customertable.Address%type
)
is
begin
insert into customertable(name,gender, address) values(p_name,p_gen, p_address);
Commit;
end;


create or replace procedure AA_UpdateCust(
p_name in Customertable.name%type,
p_gen in Customertable.Gender%type,
p_address in Customertable.Address%type
)
is
begin
update customertable set name= p_name, gender= p_gen, address= p_address where name=p_name;
Commit;
end;


create or replace procedure AA_DeleteCust(
p_name in Customertable.name%type
)
is
begin
delete from customertable where name=p_name;
Commit;
end;


exec AA_DeleteCust('Radha')

select * from customertable;