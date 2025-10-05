use leetcode;

-- Create the table
CREATE TABLE emp_details (
    emp_name VARCHAR(10),
    city VARCHAR(15)
);

-- Insert sample data
INSERT INTO emp_details (emp_name, city) VALUES
('Sam', 'New York'),
('David', 'New York'),
('Peter', 'New York'),
('Chris', 'New York'),
('John', 'New York'),
('Steve', 'San Francisco'),
('Rachel', 'San Francisco'),
('Robert', 'Los Angeles');

select * from emp_details;

with answer as (
select
    *,
    row_number() over (partition by city order by emp_name) as row_num,
    IF(row_number() over (partition by city order by emp_name) < 3, 0, 1) as is_first_in_city
from
    emp_details)
select
    city,
    group_concat(emp_name) as employees,
    concat('Team',row_number() over (order by (select null))) as team_name
from
    answer
group by
    city,
    is_first_in_city;
