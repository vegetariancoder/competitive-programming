drop database online;
create database online;
use online;

create table clocked_hours(

empd_id int,

swipe time,

flag char

);

insert into clocked_hours values

(11114,'08:30','I'),

(11114,'10:30','O'),

(11114,'11:30','I'),

(11114,'15:30','O'),

(11115,'09:30','I'),

(11115,'17:30','O');



select * from clocked_hours;

with answer as (
select
    empd_id,
    sec_to_time(sum(case
        when flag = 'I' then time_to_sec(swipe)
    end)) as punch_in,
    sec_to_time(sum(case
        when flag = 'O' then time_to_sec(swipe)
    end)) as punch_out
from
    clocked_hours
group by
    empd_id)
select
    empd_id,
    timestampdiff(hour,punch_in,punch_out) as clocked_hours
from
    answer;
