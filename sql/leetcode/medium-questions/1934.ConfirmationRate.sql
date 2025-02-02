drop database leetcode;
create database leetcode;
use leetcode;

CREATE TABLE IF NOT EXISTS Signups (
    user_id INT,
    time_stamp DATE);


CREATE TABLE IF NOT EXISTS Confirmations (
    user_id INT,
    time_stamp DATE,
    action varchar(100));

insert into Signups (user_id,time_stamp) values (3,'2020-03-21');
insert into Signups (user_id,time_stamp) values (7,'2020-01-04');
insert into Signups (user_id,time_stamp) values (2,'2020-07-29');
insert into Signups (user_id,time_stamp) values (6,'2020-12-09');


insert into Confirmations (user_id,time_stamp,action) values (3,'2021-01-06','timeout');
insert into Confirmations (user_id,time_stamp,action) values (3,'2021-07-14','timeout');
insert into Confirmations (user_id,time_stamp,action) values (7,'2021-06-12','confirmed');
insert into Confirmations (user_id,time_stamp,action) values (7,'2021-06-13','confirmed');
insert into Confirmations (user_id,time_stamp,action) values (7,'2021-06-14','confirmed');
insert into Confirmations (user_id,time_stamp,action) values (2,'2021-06-22','confirmed');
insert into Confirmations (user_id,time_stamp,action) values (2,'2021-06-28','timeout');

select * from Confirmations;


with cte as (
select
    *,
    count(user_id) over (partition by user_id order by user_id) as cnt,
    sum(if(action='confirmed',1,0)) over (partition by user_id order by user_id) as confirm_cnt
from
    Confirmations)
select
    distinct Signups.user_id,
    ifnull(round(confirm_cnt/cnt,2),0.00) as confirmation_rate
from
    cte
right join
    Signups
on
    cte.user_id = Signups.user_id;