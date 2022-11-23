Nested block:


{[()]}
declare
begin
---firstblock
begin
---second
end;
end;


<<parent>>
declare 
blockname varchar(25);
name varchar(25);
begin
blockname:='parent';
name:='priya';

<<child>>
declare

blockname varchar(25);
begin
blockname:='child';


dbms_output.put_line(blockname);
dbms_output.put_line(name);
dbms_output.put_line(parent.blockname);

end;
end;
