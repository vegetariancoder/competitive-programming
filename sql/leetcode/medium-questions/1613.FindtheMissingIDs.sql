drop database leetcode;
create database leetcode;
use leetcode;

CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT,
    customer_name varchar(100));

insert into Customers (customer_id,customer_name) values (1,'Alice');
insert into Customers (customer_id,customer_name) values (4,'Bob');
insert into Customers (customer_id,customer_name) values (5,'Charlie');

with answer as (
select
    *,
    row_number() over (order by customer_id) as rn
from
    Customers)
select
    rn
from
    answer
where
    rn not in (select customer_id from Customers);



# Write your MySQL query statement below
WITH RECURSIVE
    t AS (
        SELECT
            1 AS n
        UNION ALL
        SELECT
            n + 1
        FROM t
        WHERE n < 100
    )
SELECT
    n AS ids
FROM t
WHERE
    n < (
        SELECT
            MAX(customer_id)
        FROM Customers
    )
    AND n NOT IN (
        SELECT
            customer_id
        FROM Customers
    );