drop database leetcode;
create database leetcode;
use leetcode;
Create table If Not Exists Student (name varchar(100), continent varchar(100));
insert into Student (name,continent) value ('Jane','America');
insert into Student (name,continent) value ('Pascal','Europe');
insert into Student (name,continent) value ('Xi','Asia');
insert into Student (name,continent) value ('Jack','America');

select * from Student;

with cte as (
select
    *,
    row_number() over (partition by continent order by name) as rno
from
    Student)
select
    max(if(continent='America',name,null)) as America,
    max(if(continent='Asia',name,null)) as Asia,
    max(if(continent='Europe',name,null)) as Europe
from
    cte
group by
    rno
