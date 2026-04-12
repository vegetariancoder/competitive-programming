use leetcode;

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    project_completion_date DATE
);

INSERT INTO projects (project_id, employee_name, project_completion_date) VALUES
(100, 'Ankit', '2022-12-15'),
(101, 'Shilpa', '2023-01-03'),
(102, 'Shilpa', '2023-01-15'),
(103, 'Shilpa', '2023-01-22'),
(104, 'Rahul', '2023-01-05'),
(105, 'Rahul', '2023-01-12'),
(106, 'Mukesh', '2023-01-23'),
(108, 'Mukesh', '2023-02-04'),
(109, 'Mukesh', '2023-02-16'),
(110, 'Shilpa', '2023-02-24'),
(112, 'Rahul', '2023-02-25'),
(113, 'Rohit', '2022-11-20'),
(114, 'Neha', '2023-01-10'),
(115, 'Karan', '2023-01-18'),
(116, 'Vijay', '2023-02-05'),
(117, 'Divya', '2023-02-19'),
(118, 'Tarun', '2022-12-02'),
(119, 'Sonam', '2022-12-11'),
(120, 'Amit', '2022-12-29'),
(121, 'Rita', '2022-12-30');

select * from projects;

with best_employee as (
select
    *,
    concat(substr(project_completion_date,1,4),'',substr(project_completion_date,6,2)) as yearmonth
from
    projects),
answer as (
select
    employee_name,
    yearmonth,
    count(employee_name) as no_of_completed_projects,
    rank() over (partition by substr(yearmonth,4,6) order by count(employee_name) desc ) as rnk
from
    best_employee
group by
    employee_name,
    yearmonth)
select employee_name,no_of_completed_projects, yearmonth from answer where rnk = 1 order by no_of_completed_projects desc, employee_name desc