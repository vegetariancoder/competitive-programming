drop database leetcode;
create database leetcode;
use leetcode;
CREATE TABLE IF NOT EXISTS Friends (
    id INT,
    name VARCHAR(19),
    activity VARCHAR(19));


CREATE TABLE IF NOT EXISTS Activities (
    id INT,
    name VARCHAR(19));


insert into Friends (id,name,activity) values (1,"JonathanD","Eating");
insert into Friends (id,name,activity) values (2,"Jade","Singing");
insert into Friends (id,name,activity) values (3,"Victor","Singing");
insert into Friends (id,name,activity) values (4,"Elvis","Eating");
insert into Friends (id,name,activity) values (5,"Daniel","Eating");
insert into Friends (id,name,activity) values (6,"Bob","Horse Riding");

select * from Friends;

with activity_count  as (
select
    activity,
    count(*),
    dense_rank() over (order by count(*) desc ) drnk
from
    Friends
group by activity),
not_use_activity as (
select
    activity
from
    activity_count
where
    drnk = (select min(drnk) from activity_count)
union
select
    activity
from
    activity_count
where
    drnk = (select max(drnk) from activity_count))
select
    distinct activity
from
    Friends where activity not in (select activity from not_use_activity);
