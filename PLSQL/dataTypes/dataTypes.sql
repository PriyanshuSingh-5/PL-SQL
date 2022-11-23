----Datatypes---
--PL/SQL Number Types

BINARY_DOUBLE, BINARY_FLOAT, BINARY_INTEGER, DEC, DECIMAL, DOUBLE PRECISION, FLOAT, INT, INTEGER, NATURAL, NATURALN, NUMBER, NUMERIC, PLS_INTEGER, POSITIVE, POSITIVEN, REAL, SIGNTYPE, SMALLINT

---PL/SQL Character and String Types and PL/SQL National Character Types

CHAR, CHARACTER, LONG, LONG RAW, NCHAR, NVARCHAR2, RAW, ROWID, STRING, UROWID, VARCHAR, VARCHAR2

--Note that the LONG and LONG RAW datatypes are supported only for backward compatibility; see "LONG and LONG RAW Datatypes" for more information.

--PL/SQL Boolean Types

BOOLEAN

--PL/SQL Date, Time, and Interval Types

DATE, TIMESTAMP, TIMESTAMP WITH TIMEZONE, TIMESTAMP WITH LOCAL TIMEZONE, INTERVAL YEAR TO MONTH, INTERVAL DAY TO SECOND



--Some other data types:
--1) Scalar:
Number
character and string
boolean
date, time

--2)LOB: The LOB (large object) datatypes BFILE, BLOB, CLOB, and NCLOB let you store blocks of unstructured data, such as text, graphic images, video clips, and sound waveforms.
NCLOB
CLOB
BLOB, CLOB, and NCLOB data is stored in the database, in or outside the row
BFILE : use the BFILE datatype to store large binary objects in operating system files outside the database. Every BFILE variable stores a file locator, which points to a large binary file on the server. The locator includes a directory alias, which specifies a full path name


--3)Refrences:
REF Cursors
REFS


---4)Composite:
