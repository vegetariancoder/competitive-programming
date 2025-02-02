use leetcode;


create table Friendship (user1_id int, user2_id int);
insert into Friendship values (1,2),
                                   (1,3),
                                   (2,3),
                                   (1,4),
                                   (2,4),
                                   (1,5),
                                   (1,4),
                                   (2,5),
                                   (1,7),
                                   (3,7),
                                   (1,6),
                                   (3,6),
                                   (2,6);

select * from Friendship;

with cte as (
select
    user1_id as user_id,
    user2_id as friend
from
    Friendship
union
select
    user2_id as user_id,
    user1_id as friend
from
    Friendship)
select
    c1.user_id,
    c2.user_id,
    count(c1.friend) as cnt
from
    cte as c1
inner join
    cte as c2
on
    c1.friend = c2.friend
where
    c1.user_id < c2.user_id
group by
    c1.user_id, c2.user_id
having
    cnt >=3;