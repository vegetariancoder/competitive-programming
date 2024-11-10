use leetcode;

CREATE TABLE friends (
    user_id INT,
    friend_id INT
);

-- Insert data into friends table
INSERT INTO friends VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(3, 1),
(3, 4),
(4, 1),
(4, 3);

-- Create likes table
CREATE TABLE likes (
    user_id INT,
    page_id CHAR(1)
);

-- Insert data into likes table
INSERT INTO likes VALUES
(1, 'A'),
(1, 'B'),
(1, 'C'),
(2, 'A'),
(3, 'B'),
(3, 'C'),
(4, 'B');

select * from friends;
select * from likes;


select
    distinct
    friends.user_id,
    likes.page_id
from
    friends
left join
    likes
on
    friends.user_id = likes.user_id;

with all_users_likes as (
select
    distinct
    user_id,
    col
from
    likes
cross join
(select
    'A' as col
union
select
    'B' as col
union
select
    'C' as col) as t)
select
    user_id,
    col as page_id
from
    all_users_likes
where
    (user_id,col) not in (select user_id,page_id from likes);