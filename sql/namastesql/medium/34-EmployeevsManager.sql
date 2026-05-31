use leetcode;

-- Create the employee table
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    joining_date DATE NOT NULL,
    salary INT NOT NULL,
    manager_id INT
);

-- Insert all 20 records into the employee table
INSERT INTO employee (emp_id, emp_name, joining_date, salary, manager_id) VALUES
(1, 'Ankit', '2021-01-01', 10000, 4),
(2, 'Mohit', '2022-05-01', 15000, 5),
(3, 'Vikas', '2023-06-01', 10000, 4),
(4, 'Rohit', '2022-02-01', 5000, 2),
(5, 'Mudit', '2021-03-01', 12000, 6),
(6, 'Agam', '2024-02-01', 12000, 2),
(7, 'Sanjay', '2024-02-21', 9000, 2),
(8, 'Ashish', '2023-01-05', 5000, 2),
(9, 'Mukesh', '2020-02-03', 6000, 6),
(10, 'Rakesh', '2022-08-01', 7000, 6),
(11, 'Kunal', '2023-05-01', 12000, 4),
(12, 'Nitin', '2021-04-01', 4000, 5),
(13, 'Tarun', '2020-11-11', 7000, 6),
(14, 'Gaurav', '2021-07-10', 3000, 2),
(15, 'Amit', '2022-01-01', 6000, 3),
(16, 'Rohin', '2020-06-15', 2000, 5),
(17, 'Vipul', '2023-02-20', 8000, 6),
(18, 'Lokesh', '2022-03-18', 9000, 6),
(19, 'Suresh', '2021-09-25', 6500, 3),
(20, 'Harish', '2023-01-20', 5500, 5);


select * from employee;


with cte as (
select
    e2.emp_id as emp_id,
    e2.emp_name as emp_name,
    e1.emp_name as manager_name,
    e2.joining_date as emp_joining_date,
    e1.joining_date as manager_joining_date,
    e2.salary as emp_salary,
    e1.salary as manager_salary
from
    employee e1
inner join
    employee e2
on
    e1.emp_id = e2.manager_id)
select
    emp_name,
    emp_salary as salary,
    emp_joining_date as joining_date,
    manager_salary,
    manager_joining_date
from
    cte
where
    emp_salary > manager_salary and emp_joining_date > manager_joining_date
order by
    emp_name;