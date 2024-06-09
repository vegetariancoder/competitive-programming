CREATE TABLE employees  (employee_id int,employee_name varchar(15), email_id varchar(15) );

INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('101','Liam Alton', 'li.al@abc.com');
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('102','Josh Day', 'jo.da@abc.com');
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('103','Sean Mann', 'se.ma@abc.com');
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('104','Evan Blake', 'ev.bl@abc.com');
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('105','Toby Scott', 'jo.da@abc.com');
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('106','Anjali Chouhan', 'JO.DA@ABC.COM');
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('107','Ankit Bansal', 'AN.BA@ABC.COM');

select * from employees;


with cte1 as (
select
    *,
    lower(email_id) as lower_id
from
    employees),
answer as (
select
    *,
    count(lower_id) over (partition by lower_id) as cnt,
    if(email_id = BINARY lower_id,'Yes','No') as same
from
    cte1)
select
    email_id,
    employee_id,
    employee_name
from
    answer
where
    cnt > 1 and same = 'Yes';