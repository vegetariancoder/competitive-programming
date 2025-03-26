drop database leetcode;
create database leetcode;
use leetcode;

-- Create the Employees table
CREATE TABLE Employees (
    emp_id INT,
    emp_name VARCHAR(255),
    dep_id INT,
    position VARCHAR(255)
);

-- Insert data into the Employees table
INSERT INTO Employees (emp_id, emp_name, dep_id, position) VALUES
(156, 'Michael', 107, 'Manager'),
(112, 'Lucas', 107, 'Consultant'),
(8, 'Isabella', 101, 'Manager'),
(160, 'Joseph', 100, 'Manager'),
(80, 'Aiden', 100, 'Engineer'),
(190, 'Skylar', 100, 'Freelancer'),
(196, 'Stella', 101, 'Coordinator'),
(167, 'Audrey', 100, 'Consultant'),
(97, 'Nathan', 101, 'Supervisor'),
(128, 'Ian', 101, 'Administrator'),
(81, 'Ethan', 107, 'Administrator');

-- Optional: Verify the data insertion
SELECT * FROM Employees;

with cte_1 as (
select
    dep_id,
    count(*),
    dense_rank() over (order by count(*) desc ) as drnk
from
    Employees
group by dep_id)
select
    emp_name,
    dep_id
from
    Employees
where
    dep_id in (select dep_id from cte_1 where drnk=1) and position = 'Manager';