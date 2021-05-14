create user testdb identified by testdb;
grant connect , resource ,dba to testdb;

create table test (
name varchar(10),
age int
);

insert into test values('박천규',25);
insert into test values('윤성미',24);
commit;

select * from test;
