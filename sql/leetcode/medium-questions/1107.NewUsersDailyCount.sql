use leetcode;
drop table if exists Traffic;
Create table If Not Exists Traffic (user_id int, activity varchar(100), activity_date date);
insert into Traffic (user_id,activity,activity_date) value (1,'login','2019-05-01');
insert into Traffic (user_id,activity,activity_date) value (1,'homepage','2019-05-01');
insert into Traffic (user_id,activity,activity_date) value (1,'logout','2019-05-01');
insert into Traffic (user_id,activity,activity_date) value (2,'login','2019-06-21');
insert into Traffic (user_id,activity,activity_date) value (2,'logout','2019-06-21');
insert into Traffic (user_id,activity,activity_date) value (3,'login','2019-01-01');
insert into Traffic (user_id,activity,activity_date) value (3,'jobs','2019-01-01');
insert into Traffic (user_id,activity,activity_date) value (3,'logout','2019-01-01');
insert into Traffic (user_id,activity,activity_date) value (4,'login','2019-06-21');
insert into Traffic (user_id,activity,activity_date) value (4,'groups','2019-06-21');
insert into Traffic (user_id,activity,activity_date) value (4,'logout','2019-06-21');
insert into Traffic (user_id,activity,activity_date) value (5,'login','2019-03-01');
insert into Traffic (user_id,activity,activity_date) value (5,'logout','2019-03-01');
insert into Traffic (user_id,activity,activity_date) value (5,'login','2019-06-21');
insert into Traffic (user_id,activity,activity_date) value (5,'logout','2019-06-21');

with cte as (
select
    user_id,
    min(activity_date) as first_login_date
from
    Traffic
where
    activity = 'login'
group by
    user_id)
select
    first_login_date,
    count(distinct user_id)
from
    cte
where
    datediff('2019-06-30',first_login_date) <= 90
group by
    first_login_date;