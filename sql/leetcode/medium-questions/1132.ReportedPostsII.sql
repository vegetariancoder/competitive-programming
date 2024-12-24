drop database leetcode;
create database leetcode;
use leetcode;
Create table If Not Exists Actions (user_id int,post_id int, action_date varchar(100), action varchar(100), extra varchar(100));
insert into Actions value (1,1,'2019-07-01','view',null);
insert into Actions value (1,1,'2019-07-01','like',null);
insert into Actions value (1,1,'2019-07-01','share',null);
insert into Actions value (2,2,'2019-07-04','view',null);
insert into Actions value (2,2,'2019-07-04','report','spam');
insert into Actions value (3,4,'2019-07-04','view',null);
insert into Actions value (3,4,'2019-07-04','report','spam');
insert into Actions value (4,3,'2019-07-02','view',null);
insert into Actions value (4,3,'2019-07-02','report','spam');
insert into Actions value (5,2,'2019-07-03','view',null);
insert into Actions value (5,2,'2019-07-03','report','racism');
insert into Actions value (5,5,'2019-07-03','view',null);
insert into Actions value (5,5,'2019-07-03','report','racism');


Create table If Not Exists Removals (post_id int, remove_date varchar(100));
insert into Removals value (2,'2019-07-20');
insert into Removals value (3,'2019-07-18');


with answer as (
select
    (count(distinct Removals.post_id)/count(distinct Actions.post_id))*100 as total
from
    Actions
left join
    Removals
on
    Actions.post_id = Removals.post_id
where
    Actions.extra ='spam'
group by
    action_date)
select
    round(avg(total),2) as average_daily_percent
from
    answer;
