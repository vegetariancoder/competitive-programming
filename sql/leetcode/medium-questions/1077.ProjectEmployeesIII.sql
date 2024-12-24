drop database leetcode;
create database leetcode;
use leetcode;
Create table If Not Exists Project (project_id int,employee_id int);
insert into Project (project_id,employee_id) value (1,1);
insert into Project (project_id,employee_id) value (1,2);
insert into Project (project_id,employee_id) value (1,3);
insert into Project (project_id,employee_id) value (2,1);
insert into Project (project_id,employee_id) value (2,4);


Create table If Not Exists Employee (employee_id int,name varchar(100), experience_years int);
insert into Employee (employee_id,name,experience_years) value (1,'khaled',3);
insert into Employee (employee_id,name,experience_years) value (2,'Ali',2);
insert into Employee (employee_id,name,experience_years) value (3,'John',3);
insert into Employee (employee_id,name,experience_years) value (4,'Doe',2);

with answer as (
select
    project_id,
    Project.employee_id,
    Employee.experience_years,
    dense_rank() over (partition by project_id order by experience_years desc ) as dr
from
    Employee
inner join
    Project
on
    Employee.employee_id = Project.employee_id)
select
    project_id,
    employee_id
from
    answer
where
    dr = 1