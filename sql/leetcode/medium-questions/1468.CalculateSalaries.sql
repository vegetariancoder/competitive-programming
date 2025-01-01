drop database leetcode;
create database leetcode;
use leetcode;
CREATE TABLE IF NOT EXISTS Salaries (
    company_id INT,
    employee_id INT,
    employee_name VARCHAR(19),
    salary INT);

insert into Salaries (company_id,employee_id,employee_name,salary) values (1,1,'Tony',2000);
insert into Salaries (company_id,employee_id,employee_name,salary) values (1,2,'Pronub',21300);
insert into Salaries (company_id,employee_id,employee_name,salary) values (1,3,'Tyrrox',10800);
insert into Salaries (company_id,employee_id,employee_name,salary) values (2,1,'Pam',300);
insert into Salaries (company_id,employee_id,employee_name,salary) values (2,7,'Bassem',450);
insert into Salaries (company_id,employee_id,employee_name,salary) values (2,9,'Hermione',700);
insert into Salaries (company_id,employee_id,employee_name,salary) values (3,7,'Bocaben',100);
insert into Salaries (company_id,employee_id,employee_name,salary) values (3,2,'Ognjen',2200);
insert into Salaries (company_id,employee_id,employee_name,salary) values (3,13,'Nyancat',3300);
insert into Salaries (company_id,employee_id,employee_name,salary) values (3,15,'Morninngcat',7777);



select
    *
from
    Salaries;

with max_salary as (
select
    company_id,
    max(salary) as max_salary,
    case
        when max(salary) < 1000 then 0
        when max(salary) > 1000 and max(salary) < 10000 then 24
        when max(salary) > 10000 then 49
    end as percentage_cat
from
    Salaries
group by company_id)
select
    Salaries.company_id as company_id,
    Salaries.employee_id as employee_id,
    Salaries.employee_name as employee_name,
    round(salary - (salary * (percentage_cat/100)),0) as checks
from
    Salaries
inner join
    max_salary
on
    Salaries.company_id = max_salary.company_id;