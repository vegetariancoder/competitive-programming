drop database leetcode;
create database leetcode;
use leetcode;

CREATE TABLE IF NOT EXISTS Employees (
    employee_id int,
    employee_name varchar(100),
    manager_id int);

insert into Employees (employee_id,employee_name,manager_id) values (1,'Boss',1);
insert into Employees (employee_id,employee_name,manager_id) values (3,'Alice',3);
insert into Employees (employee_id,employee_name,manager_id) values (2,'Bob',1);
insert into Employees (employee_id,employee_name,manager_id) values (4,'Daniel',2);
insert into Employees (employee_id,employee_name,manager_id) values (7,'Luis',4);
insert into Employees (employee_id,employee_name,manager_id) values (8,'Jhon',3);
insert into Employees (employee_id,employee_name,manager_id) values (9,'Angela',8);
insert into Employees (employee_id,employee_name,manager_id) values (77,'Robert',1);


select
    *
from
    Employees;

with layer_1 as (
select
    employee_id
from
    Employees
where
    manager_id = 1 and employee_id != 1),
layer_2 as (
select
    employee_id
from
    Employees
where
    manager_id in (select * from layer_1)),
layer_3 as (
select
    employee_id
from
    Employees
where manager_id in (select * from layer_2))
select * from layer_1
union all
select * from layer_2
union all
select * from layer_3;




select
    distinct
    E1.employee_id
from
    Employees E1
inner join
    Employees E2
on
    E1.manager_id = E2.employee_id
join
    Employees E3
on
    E2.manager_id = E3.employee_id
where
    E1.employee_id != 1 and E3.manager_id = 1;

