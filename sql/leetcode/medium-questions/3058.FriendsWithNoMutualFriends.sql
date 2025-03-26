use leetcode;

-- Create the Friends table
CREATE TABLE Friends (
    user_id1 INT,
    user_id2 INT
);

-- Insert data into the Friends table
INSERT INTO Friends (user_id1, user_id2) VALUES
(1, 2),
(2, 3),
(2, 4),
(1, 5),
(6, 7),
(3, 4),
(2, 5),
(8, 9);

-- Optional: Verify the data insertion
SELECT * FROM Friends;

select
    *
from
    Friends;


with cte_1 as (
select
    user_id1
from
    Friends
group by
    user_id1
having
    count(*) = 1),
cte_2 as (
select
    user_id2
from
    Friends
group by
    user_id2
having
    count(*) = 1)
select
    user_id1,
    user_id2
from
    Friends
where
    user_id1 in (select user_id1 from cte_1) and user_id2 in (select user_id2 from cte_2);