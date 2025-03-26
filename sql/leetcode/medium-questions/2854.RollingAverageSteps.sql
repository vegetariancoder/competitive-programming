drop database leetcode;
create database leetcode;
use leetcode;

-- Create the Steps table
CREATE TABLE Steps (
    user_id INT,
    steps_count INT,
    steps_date DATE
);

-- Insert data into the Steps table
INSERT INTO Steps (user_id, steps_count, steps_date) VALUES
(1, 687, '2021-09-02'),
(1, 395, '2021-09-04'),
(1, 499, '2021-09-05'),
(1, 712, '2021-09-06'),
(1, 576, '2021-09-07'),
(2, 153, '2021-09-06'),
(2, 171, '2021-09-07'),
(2, 530, '2021-09-08'),
(3, 945, '2021-09-04'),
(3, 120, '2021-09-07'),
(3, 557, '2021-09-08'),
(3, 840, '2021-09-09'),
(3, 627, '2021-09-10'),
(5, 382, '2021-09-05'),
(6, 480, '2021-09-01'),
(6, 191, '2021-09-02'),
(6, 303, '2021-09-05');

-- Optional: Verify the data insertion
SELECT * FROM Steps;

with cte as (
select
    *,
    avg(steps_count) over(partition by user_id order by steps_date rows 2 preceding) as rn_avg,
    datediff(steps_date,lag(steps_date,2) over (partition by user_id order by steps_date)) = 2 as st
from
    Steps)
select
    user_id,
    steps_date,
    rn_avg
from
    cte
where
    st = 1;