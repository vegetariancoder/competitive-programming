drop database leetcode;
create database leetcode;
use leetcode;
Create table If Not Exists salary (id int, employee_id int , amount int, pay_date date);
insert into salary (id,employee_id,amount,pay_date) value (1,1,9000,'2017-03-31');
insert into salary (id,employee_id,amount,pay_date) value (2,2,6000,'2017-03-31');
insert into salary (id,employee_id,amount,pay_date) value (3,3,10000,'2017-03-31');
insert into salary (id,employee_id,amount,pay_date) value (4,1,7000,'2017-02-28');
insert into salary (id,employee_id,amount,pay_date) value (5,2,6000,'2017-02-28');
insert into salary (id,employee_id,amount,pay_date) value (6,3,8000,'2017-02-28');

Create table If Not Exists employee (employee_id int, department_id int );
insert into employee (employee_id,department_id) value (1,1);
insert into employee (employee_id,department_id) value (2,2);
insert into employee (employee_id,department_id) value (3,2);

with cte as (
select
    salary.*,
    employee.department_id
from
    salary
inner join
    employee
on
    salary.employee_id = employee.employee_id),
avg_sal as (
select
    substring(pay_date,1,7) as y_m,
    avg(amount) as avg_amount
from
    salary
group by y_m),
answer as (
select
    substring(cte.pay_date,1,7) as pay_month,
    cte.department_id,
    avg_sal.avg_amount,
    avg(cte.amount) as avg_amount_dept
from
    cte
inner join
    avg_sal
on
    substring(cte.pay_date,1,7) = avg_sal.y_m
group by
    1,2,3)
select
    pay_month,
    department_id,
    case
        when avg_amount = avg_amount_dept then 'same'
        when avg_amount < avg_amount_dept then 'higher'
        else 'lower' end as 'comparison'

from
    answer
order by
    department_id,pay_month;
