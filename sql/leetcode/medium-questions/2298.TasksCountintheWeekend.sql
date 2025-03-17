drop database leetcode;
create database leetcode;
use leetcode;


Create table If Not Exists Tasks (task_id int, assignee_id int,submit_date date);
insert into Tasks (task_id,assignee_id,submit_date) value (1,1,'2022-06-13');
insert into Tasks (task_id,assignee_id,submit_date) value (2,6,'2022-06-14');
insert into Tasks (task_id,assignee_id,submit_date) value (3,6,'2022-06-15');
insert into Tasks (task_id,assignee_id,submit_date) value (4,3,'2022-06-18');
insert into Tasks (task_id,assignee_id,submit_date) value (5,5,'2022-06-19');
insert into Tasks (task_id,assignee_id,submit_date) value (6,7,'2022-06-19');


select * from Tasks;

select
    sum(if(weekday(submit_date) in (5,6),1,0)) as weekend_cnt,
    sum(if(weekday(submit_date) not in (5,6),1,0)) as working_cnt
from
    Tasks;