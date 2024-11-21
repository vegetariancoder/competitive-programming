use leetcode;

-- Create Activities table
CREATE TABLE Activities (
    activity_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    activity_type VARCHAR(10) NOT NULL,
    time_spent DECIMAL(5, 2) NOT NULL
);

-- Insert data into Activities table
INSERT INTO Activities (activity_id, user_id, activity_type, time_spent) VALUES
(7274, 123, 'open', 4.50),
(2425, 123, 'send', 3.50),
(1413, 456, 'send', 5.67),
(2536, 456, 'open', 3.00),
(8564, 456, 'send', 8.24),
(5235, 789, 'send', 6.24),
(4251, 123, 'open', 1.25),
(1435, 789, 'open', 5.25);

-- Create Age table
CREATE TABLE Age (
    user_id INT PRIMARY KEY,
    age_bucket VARCHAR(10) NOT NULL
);

-- Insert data into Age table
INSERT INTO Age (user_id, age_bucket) VALUES
(123, '31-35'),
(789, '21-25'),
(456, '26-30');


with cte as (
select
    Activities.user_id,
    sum(case
        when activity_type = 'send' then time_spent
    end) as send_time,
    sum(case
        when activity_type = 'open' then time_spent
    end) as open_time,
    sum(case when activity_type = 'send' then time_spent end) + sum(case when activity_type = 'open' then time_spent end) as total
from
    Activities
inner join
    Age on Activities.user_id = Age.user_id
group by Activities.user_id)
select
    age_bucket,
    round((send_time/total) * 100,2) as send_perc,
    round((open_time/total) * 100,2) as open_perc
from
    cte
inner join
    Age
on
    cte.user_id = Age.user_id;
