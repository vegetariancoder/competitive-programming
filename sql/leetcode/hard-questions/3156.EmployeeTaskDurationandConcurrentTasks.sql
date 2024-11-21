use leetcode;

CREATE TABLE Tasks (
    task_id INT PRIMARY KEY,
    employee_id INT,
    start_time DATETIME,
    end_time DATETIME
);

INSERT INTO Tasks (task_id, employee_id, start_time, end_time) VALUES
(1, 1001, '2023-05-01 08:00:00', '2023-05-01 09:00:00'),
(2, 1001, '2023-05-01 08:30:00', '2023-05-01 10:30:00'),
(3, 1001, '2023-05-01 11:00:00', '2023-05-01 12:00:00'),
(7, 1001, '2023-05-01 13:00:00', '2023-05-01 15:30:00'),
(4, 1002, '2023-05-01 09:00:00', '2023-05-01 10:00:00'),
(5, 1002, '2023-05-01 09:30:00', '2023-05-01 11:30:00'),
(6, 1003, '2023-05-01 14:00:00', '2023-05-01 16:00:00');

with cte as (
select
    *,
    lead(start_time) over (partition by employee_id order by task_id) as last_start_time
from
    Tasks),
cte_2 as (
select
    *,
    timestampdiff(minute ,start_time,end_time) as diff,
    IF(last_start_time between start_time and end_time, 'Yes','') as start_time_conflict
from
    cte),
answer as (
select
    *,
    if(start_time_conflict='Yes',diff-timestampdiff(minute ,last_start_time,end_time),diff) as penalty
from
    cte_2)
select
    employee_id,
    FLOOR(sum(penalty)/60)  as total_task_hours,
    sum(if(start_time_conflict = 'Yes', 1, 0))+1 as max_concurrent_tasks
from
    answer
group by employee_id;