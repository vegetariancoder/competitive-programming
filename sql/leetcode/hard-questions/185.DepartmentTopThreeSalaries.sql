use leetcode;
Create table If Not Exists Employee (id int, name varchar(255), salary int, departmentId int);
Create table If Not Exists Department (id int, name varchar(255));

insert into Employee (id, name, salary, departmentId) values ('1', 'Joe', '85000', '1')
insert into Employee (id, name, salary, departmentId) values ('2', 'Henry', '80000', '2')
insert into Employee (id, name, salary, departmentId) values ('3', 'Sam', '60000', '2')
insert into Employee (id, name, salary, departmentId) values ('4', 'Max', '90000', '1')
insert into Employee (id, name, salary, departmentId) values ('5', 'Janet', '69000', '1')
insert into Employee (id, name, salary, departmentId) values ('6', 'Randy', '85000', '1')
insert into Employee (id, name, salary, departmentId) values ('7', 'Will', '70000', '1')

insert into Department (id, name) values ('1', 'IT');
insert into Department (id, name) values ('2', 'Sales');

with answer as (
select
    Employee.name as Employee,
    Department.name,
    Employee.salary,
    dense_rank() over (partition by Department.name order by salary desc ) as drnk
from
    Employee
inner join
    Department
on
    Employee.departmentId = Department.id)
select
    name as Department,
    Employee,
    salary
from answer
where
    drnk <=3;