drop database leetcode;
create database leetcode;
use leetcode;
Create table If Not Exists Seat (id int,student varchar (100));
insert into Seat (id,student) value (1,'Abbot');
insert into Seat (id,student) value (2,'Doris');
insert into Seat (id,student) value (3,'Emerson');
insert into Seat (id,student) value (4,'Green');
insert into Seat (id,student) value (5,'Jeames');

select
    *
from
    Seat;

with cte as (
select
    *,
    ifnull(lead(student) over (order by id),Seat.student) as next_student,
    ifnull(lag(student) over (order by id),Seat.student) as previous_student
from
    Seat)
select
    id,
    if(mod(id, 2) != 0, next_student, previous_student) as student
from
    cte;