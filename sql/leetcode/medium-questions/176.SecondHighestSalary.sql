use leetcode;

Create table If Not Exists Employee (id int, salary int);
Truncate table Employee;
insert into Employee (id, salary) values ('1', '100');
insert into Employee (id, salary) values ('2', '200');
insert into Employee (id, salary) values ('3', '300');

select * from Employee;

select
    max(salary)
from
    Employee
where
    salary < (select max(salary) from Employee);

with answer as (
select
    *,
    rank() over (order by salary desc ) as rnk
from
    Employee)
select
    salary
from
    answer
where
    rnk=2;









