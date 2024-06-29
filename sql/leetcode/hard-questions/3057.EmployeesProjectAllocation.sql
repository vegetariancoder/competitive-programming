use leetcode;

-- Create Project table
CREATE TABLE Project (
    project_id INT,
    employee_id INT,
    workload INT
);

-- Insert data into Project table
INSERT INTO Project (project_id, employee_id, workload) VALUES
(1, 1, 45),
(1, 2, 90),
(2, 3, 12),
(2, 4, 68);

-- Create Employees table
CREATE TABLE Employees (
    employee_id INT,
    name VARCHAR(50),
    team CHAR(1)
);

-- Insert data into Employees table
INSERT INTO Employees (employee_id, name, team) VALUES
(1, 'Khaled', 'A'),
(2, 'Ali', 'B'),
(3, 'John', 'B'),
(4, 'Doe', 'A');



select
    *
from
    Project;

select
    *
from
    Employees;


with avg_wkld as (
select
    team,
    round(avg(workload),2)as avg_workload
from
    Project
inner join
    Employees
on
    Project.employee_id = Employees.employee_id
group by team ),
main_info as (select
    Project.employee_id,
    project_id,
    name,
    workload,
    team
from
    Project
inner join
    Employees
on
    Project.employee_id = Employees.employee_id)
select
    main_info.*
from
    main_info
left join
    avg_wkld
on
    main_info.team = avg_wkld.team
where
    workload>avg_workload;







