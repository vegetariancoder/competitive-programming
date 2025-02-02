drop database leetcode;
create database leetcode;
use leetcode;

CREATE TABLE IF NOT EXISTS Relations (
    user_id int,
    follower_id int);


insert into Relations (user_id,follower_id) values (1,3);
insert into Relations (user_id,follower_id) values (2,3);
insert into Relations (user_id,follower_id) values (7,3);
insert into Relations (user_id,follower_id) values (1,4);
insert into Relations (user_id,follower_id) values (2,4);
insert into Relations (user_id,follower_id) values (7,4);
insert into Relations (user_id,follower_id) values (1,5);
insert into Relations (user_id,follower_id) values (2,6);
insert into Relations (user_id,follower_id) values (7,5);

select
    *
from Relations;


with cte as (
select
    user_id as user_id,
    follower_id as follow
from
    Relations
union
select
    follower_id,
    user_id
from
    Relations),
answer as (
select
    ct1.user_id as user1_id,
    ct2.user_id as user2_id,
    rank() over (order by count(ct1.follow) desc ) as rnk
from
    cte as ct1
inner join
    cte as ct2
on
    ct1.follow = ct2.follow
where
    ct1.user_id < ct2.user_id and (ct1.user_id) in (select Relations.user_id from Relations)
group by
    ct1.user_id, ct2.user_id)
select  user1_id, user2_id from answer where rnk = 1

