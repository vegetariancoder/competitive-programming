use leetcode;

CREATE TABLE Friends (
    user1 INT,
    user2 INT
);

INSERT INTO Friends (user1, user2) VALUES
(2, 1),
(1, 3),
(4, 1),
(1, 5),
(1, 6),
(2, 6),
(7, 2),
(8, 3),
(3, 9);

select * from Friends;


with cte as (
select
    user1 as user,
    count(*) as cnt
from
    Friends
group by user1
union all
select
    user2 as user,
    count(*) as cnt
from
    Friends
group by user2),
distinct_users as (
    select
    user1
from
    Friends
union
select
    user2
from
    Friends
)
select
    user,
    round(sum(cnt)/(select count(*) from distinct_users) * 100,2) as percentage_popularity
from
    cte
group by
    user;



