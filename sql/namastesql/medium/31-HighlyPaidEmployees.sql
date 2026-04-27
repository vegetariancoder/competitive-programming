use leetcode;

select * from employees;

select
    *,
    sum(employees.salary) over (partition by employees.department) as sm
from
    employees;

CREATE TABLE employees_sample (
    emp_id INT PRIMARY KEY,
    salary INT,
    department VARCHAR(50)
);

INSERT INTO employees_sample (emp_id, salary, department) VALUES
(101, 70000, 'Engineering'),
(102, 50000, 'Engineering'),
(103, 40000, 'Marketing'),
(104, 30000, 'Marketing'),
(105, 45000, 'Sales');


select * from employees_sample;

select
    *,
    sum(employees_sample.salary) over (partition by employees_sample.department) as sm
from
    employees_sample;


select
    *
from
    employees
where
    salary > (select avg(salary) from employees)
order by
    emp_id;
