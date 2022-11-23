record type:
name, dept, gender, sal,acctype, address

type <type name> is record
(
columns datatype
)


example of record type: database object

create type Account_type Is Object
(
accountno number,
name varchar2(25),
acctype varchar(25),
balance number
);
/


SET SERVEROUTPUT ON;
Declare
type Account_type is record(
accountno number,
name varchar2(25),
acctype varchar(25),
balance number
);
account_list Account_type;
begin
account_list.accountno:= 1022;
account_list.name:= 'Jessica';
account_list.acctype:='current';
account_list.balance:= 35000;
dbms_output.put_line('Acc number:' ||account_list.accountno);
dbms_output.put_line('Acc Name:' ||account_list.name);
dbms_output.put_line('Acc Type:' ||account_list.acctype);
dbms_output.put_line('Acc balance:' ||account_list.balance);
end;
/




row level access:

SET SERVEROUTPUT ON;
Declare
type Account_type is record(
accountno number,
name varchar2(25),
acctype varchar(25),
balance number
);
account_list Account_type;
begin
insert into bankaccount(accountno,name,acctype, balance) values (1015,'ray','saving', 38000);
commit;
select accountno,name,acctype, balance into account_list from bankaccount where accountno= 1015;
dbms_output.put_line('Acc number:' ||account_list.accountno);
dbms_output.put_line('Acc Name:' ||account_list.name);
dbms_output.put_line('Acc Type:' ||account_list.acctype);
dbms_output.put_line('Acc balance:' ||account_list.balance);
end;
/