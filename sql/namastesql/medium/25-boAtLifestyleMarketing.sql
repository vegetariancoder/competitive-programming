use leetcode;

-- Table to store creator information and follower counts per platform
CREATE TABLE creators (
    id INT,
    name VARCHAR(100),
    platform VARCHAR(50),
    followers INT
);

-- Table to store individual post statistics
CREATE TABLE posts (
    id INT,
    creator_id INT,
    publish_date DATE,
    views INT
);

INSERT INTO creators (id, name, platform, followers) VALUES
(100, 'Ankit', 'YouTube', 90000),
(100, 'Ankit', 'LinkedIn', 150000),
(101, 'Warikoo', 'YouTube', 500000),
(101, 'Warikoo', 'LinkedIn', 600000),
(101, 'Warikoo', 'Instagram', 800000),
(102, 'Dhruv', 'LinkedIn', 60000),
(102, 'Dhruv', 'YouTube', 900000),
(102, 'Dhruv', 'Instagram', 800000),
(103, 'Ravi', 'YouTube', 100000),
(103, 'Ravi', 'LinkedIn', 120000),
(103, 'Ravi', 'Instagram', 95000),
(104, 'Neha', 'YouTube', 250000),
(104, 'Neha', 'LinkedIn', 300000),
(104, 'Neha', 'Instagram', 350000),
(105, 'Amit', 'YouTube', 450000),
(105, 'Amit', 'LinkedIn', 500000),
(105, 'Amit', 'Instagram', 550000);


INSERT INTO posts (id, creator_id, publish_date, views) VALUES
(1, 100, '2024-01-01', 52000),
(2, 100, '2024-01-06', 62000),
(3, 101, '2024-01-05', 59000),
(4, 101, '2024-01-07', 22000),
(5, 102, '2024-01-05', 70000),
(6, 102, '2024-01-09', 90000),
(7, 103, '2024-01-11', 48000),
(8, 103, '2024-01-12', 53000),
(9, 104, '2024-01-15', 76000),
(10, 104, '2024-01-17', 81000),
(11, 105, '2024-01-20', 95000),
(12, 105, '2024-01-22', 99000);

select * from creators;
select * from posts;


with top_creators as (
select
    id,
    name
from
    creators
where
    followers > 100000
group by
    id,name
having
    count(distinct platform) >= 2),
latest_post as (
select
    creator_id,
    max(publish_date) as latest_post_date
from
    posts
group by
    creator_id),
max_views as (
select
    creator_id,
    views
from
    posts where (creator_id , publish_date) in (select creator_id,latest_post_date from latest_post) and views > 50000)
select
    top_creators.id,
    top_creators.name
from
    top_creators
inner join
    max_views
on
    top_creators.id = max_views.creator_id;
