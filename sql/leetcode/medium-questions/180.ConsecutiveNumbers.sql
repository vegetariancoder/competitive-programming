drop database leetcode;
create database leetcode;
use leetcode;
Create table If Not Exists Logs (id int, num int);
# insert into Logs (id, num) values ('1', '1');
# insert into Logs (id, num) values ('2', '1');
# insert into Logs (id, num) values ('3', '1');
# insert into Logs (id, num) values ('4', '2');
# insert into Logs (id, num) values ('5', '1');
# insert into Logs (id, num) values ('6', '2');
# insert into Logs (id, num) values ('7', '2');

insert into Logs (id, num) values ('1', '1');
insert into Logs (id, num) values ('2', '1');
insert into Logs (id, num) values ('3', '1');
insert into Logs (id, num) values ('4', '0');


with answer as (
select
    *,
    lead(num,1) over (order by id)as second_plc,
    lead(num,2) over (order by id) as thrid_plc
from
    Logs)
select
    distinct num
from
    answer
where
    second_plc = thrid_plc
and
    num = second_plc;
