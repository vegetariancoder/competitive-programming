use leetcode;

-- Create the UserActivity table
CREATE TABLE UserActivity (
    username VARCHAR(50),
    activity VARCHAR(50),
    startDate DATE,
    endDate DATE
);

-- Insert data into UserActivity table
INSERT INTO UserActivity (username, activity, startDate, endDate) VALUES
('Alice', 'Travel',  '2020-02-12', '2020-02-20'),
('Alice', 'Dancing', '2020-02-21', '2020-02-23'),
('Alice', 'Travel',  '2020-02-24', '2020-02-28'),
('Bob',   'Travel',  '2020-02-11', '2020-02-18');


with answer as (
select
    *,
    dense_rank() over (partition by username order by startDate) as drnk,
    count(username) over (partition by username) as cnt
from
    UserActivity)
select
    username,
    activity,
    startDate,
    endDate
from
    answer
where
    drnk = 2 or cnt = 1;
