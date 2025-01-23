use leetcode;
Create table If Not Exists Accounts (account_id int, income int);
insert into Accounts (account_id,income) value (3,108939);
insert into Accounts (account_id,income) value (2,12747);
insert into Accounts (account_id,income) value (8,87709);
insert into Accounts (account_id,income) value (6,91796);

select
    *
from
    Accounts;

select
    'Low Salary' as salary,
    0 as cnt
union all
select
    'Average Salary' as salary,
    0 as cnt
union all
select
    'High Salary' as salary,
    0 as cnt;


with cte as (
select
    *,
    case
        when income < 20000 then 'Low Salary'
        when income > 20000 and income < 50000 then 'Average Salary'
        when income > 50000 then 'High Salary'
    end as salary_type
from
    Accounts),
salary_cnt as (
select
    salary_type,
    count(salary_type) as cnt
from
    cte
group by
    salary_type)
select
    salary_tbl.salary,
    ifnull(salary_cnt.cnt,salary_tbl.count) as accounts_count
from
    salary_cnt
right join
    (select
    'Low Salary' as salary,
    0 as count
union all
select
    'Average Salary' as salary,
    0 as count
union all
select
    'High Salary' as salary,
    0 as count) salary_tbl
on
    salary_cnt.salary_type = salary_tbl.salary;