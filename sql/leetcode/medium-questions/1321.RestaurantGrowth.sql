drop database leetcode;
create database leetcode;
use leetcode;

CREATE TABLE IF NOT EXISTS Customer (
    customer_id INT,
    name varchar(100),
    visited_on date ,
    amount int);

insert into Customer (customer_id,name,visited_on,amount) values (1,'John','2019-01-01',100);
insert into Customer (customer_id,name,visited_on,amount) values (2,'Daniel','2019-01-02',110);
insert into Customer (customer_id,name,visited_on,amount) values (3,'Jade','2019-01-03',120);
insert into Customer (customer_id,name,visited_on,amount) values (4,'Khaled','2019-01-04',130);
insert into Customer (customer_id,name,visited_on,amount) values (5,'Winston','2019-01-05',110);
insert into Customer (customer_id,name,visited_on,amount) values (6,'Elvis','2019-01-06',140);
insert into Customer (customer_id,name,visited_on,amount) values (7,'Anna','2019-01-07',150);
insert into Customer (customer_id,name,visited_on,amount) values (8,'Maria','2019-01-08',80);
insert into Customer (customer_id,name,visited_on,amount) values (9,'Jaze','2019-01-09',110);
insert into Customer (customer_id,name,visited_on,amount) values (1,'John','2019-01-10',130);
insert into Customer (customer_id,name,visited_on,amount) values (3,'Jade','2019-01-10',150);

select
    *
from
    Customer;


select
    visited_on,
    sum(Customer.amount) over (order by visited_on rows 6 preceding),
    rank() over (order by visited_on rows 6 preceding) as rnk
from
    Customer;

with total_amount as (
select
    Customer.visited_on,
    sum(amount) as total_amount
from
    Customer
group by
    visited_on),
answer as (
select
    visited_on,
    sum(total_amount) over (order by visited_on rows 6 preceding) as amount,
    rank() over (order by visited_on rows 6 preceding) as rnk
from
    total_amount
group by
    1)
select
    visited_on,
    amount,
    round(amount/7,2) as average_amount
from
    answer
where
    rnk > 6;
