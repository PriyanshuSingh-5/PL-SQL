collections:
1)Vaaray
2)nested table
3)index by table or assiciative table


SET SERVEROUTPUT ON;
Declare
N_accnumber number;
begin
select accountno into N_accnumber from bankaccount where accountno=1001;
dbms_output.put_line(N_accnumber);
end;
/

Varray:
type <typename> is varray(size) of <datatype>



SET SERVEROUTPUT ON;
Declare
type accountList is Varray(15) of number;
N_accnumber accountList;
begin
select accountno bulk collect into N_accnumber from bankaccount;
dbms_output.put_line(N_accnumber(3));
end;
/


nested table:

type <Typename> is table of <datatype>

SET SERVEROUTPUT ON;
Declare
type accountList is table of number;
N_accnumber accountList;
begin
select accountno bulk collect into N_accnumber from bankaccount;
dbms_output.put_line(N_accnumber.count);
end;
/

index by table:

type <typename> is table of <datatype> index by <string data type>

SET SERVEROUTPUT ON;
Declare
type accountList is table of number index by varchar2(25);
marks accountList;
begin
marks('John'):= 85;
marks('Zoe'):= 25;
marks('Ron'):= 95;
marks('James'):= 95;
marks('Daniel'):= 45;

dbms_output.put_line(marks('Ron'));
end;
/



SET SERVEROUTPUT ON;
Declare
type accountList is table of number index by varchar2(25);
marks accountList;
indexVal varchar2(25);
begin
marks('John'):= 85;
marks('Zoe'):= 25;
marks('Ron'):= 95;
marks('James'):= 95;
marks('Daniel'):= 45;

indexVal:=marks.first;
for i in 1..marks.count
loop
dbms_output.put_line(indexVal);
dbms_output.put_line(marks(indexVal));
indexVal:= marks.next(indexval);
end loop;
end;
/
