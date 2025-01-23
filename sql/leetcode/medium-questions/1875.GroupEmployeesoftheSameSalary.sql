use leetcode;
Create table If Not Exists Employees (employee_id int, name varchar(100) , salary int);

insert into Employees (employee_id,name,salary) value (2,'Meir',3000);
insert into Employees (employee_id,name,salary) value (3,'Michael',3000);
insert into Employees (employee_id,name,salary) value (7,'Addilyn',7400);
insert into Employees (employee_id,name,salary) value (8,'Juan',6100);
insert into Employees (employee_id,name,salary) value (9,'Kannon',7400);

with cte_1 as (
select
    *,
    dense_rank() over (order by salary) as drnk
from
    Employees)
select
    cte_1.employee_id,
    cte_1.name,
    cte_1.salary,
    dense_rank() over (order by salary) as team_id
from
    cte_1
where
    drnk in (select drnk from cte_1 group by drnk having count(drnk)>1)
order by
    team_id;
