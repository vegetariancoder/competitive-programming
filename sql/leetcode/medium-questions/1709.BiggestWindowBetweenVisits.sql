drop database leetcode;
create database leetcode;
use leetcode;
Create table If Not Exists UserVisits (user_id int, visit_date date);
insert into UserVisits (user_id,visit_date) value (1,'2020-11-28');
insert into UserVisits (user_id,visit_date) value (1,'2020-10-20');
insert into UserVisits (user_id,visit_date) value (1,'2020-12-03');
insert into UserVisits (user_id,visit_date) value (2,'2020-10-05');
insert into UserVisits (user_id,visit_date) value (2,'2020-12-09');
insert into UserVisits (user_id,visit_date) value (3,'2020-11-11');

select * from UserVisits;

with answer as (
select
    *,
    datediff(ifnull(lead(visit_date) over (partition by user_id order by visit_date),date_add(last_day(visit_date), INTERVAL 1 day )),visit_date) as diff
from
    UserVisits)
select
    user_id,
    max(diff) as biggest_window
from
    answer
group by user_id ;

