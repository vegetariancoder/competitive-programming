use leetcode;

-- Create the EmployeeShifts table
CREATE TABLE EmployeeShifts (
    employee_id INT,
    start_time TIME,
    end_time TIME
);

-- Insert data into the EmployeeShifts table
INSERT INTO EmployeeShifts (employee_id, start_time, end_time)
VALUES
(1, '08:00:00', '12:00:00'),
(1, '11:00:00', '15:00:00'),
(1, '14:00:00', '18:00:00'),
(2, '09:00:00', '17:00:00'),
(2, '16:00:00', '20:00:00'),
(3, '10:00:00', '12:00:00'),
(3, '13:00:00', '15:00:00'),
(3, '16:00:00', '18:00:00'),
(4, '08:00:00', '10:00:00'),
(4, '09:00:00', '11:00:00');

select
    *
from
    EmployeeShifts;

with cte as (
select
    *,
    hour(start_time) as start_hour,
    hour(end_time) as end_hour,
    lead(hour(start_time)) over (partition by employee_id) as next_start_hour
from
    EmployeeShifts),
answer as (
select
    *,
    if(next_start_hour between start_hour and end_hour,'Yes','No') as fallback
from
    cte)
select
    employee_id,
    count(*) as cnt
from
    answer
where
    fallback = 'Yes'
group by employee_id;

