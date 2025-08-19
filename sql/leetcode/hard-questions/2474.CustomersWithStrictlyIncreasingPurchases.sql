use leetcode;

-- Create the Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    price INT
);

-- Insert data into the Orders table
INSERT INTO Orders (order_id, customer_id, order_date, price) VALUES
(1, 1, '2019-07-01', 1100),
(2, 1, '2019-11-01', 1200),
(3, 1, '2020-05-26', 3000),
(4, 1, '2021-08-31', 3100),
(5, 1, '2022-12-07', 4700),
(6, 2, '2015-01-01', 700),
(7, 2, '2017-11-07', 1000),
(8, 3, '2017-01-01', 900),
(9, 3, '2018-11-07', 900);

select
    *
from
    Orders;


with cte as (
select
    customer_id,
    year(order_date) as year,
    sum(price) as total_price
from
    Orders
group by customer_id, year
order by customer_id, year),
cte2 as (
select
    *,
    lead(year,1,year) over (partition by customer_id order by year) as next_year,
    lead(total_price,1,total_price) over (partition by customer_id order by year) as next_total_price
from
    cte),
answer as (
select
    customer_id,
    next_year-year as diff,
    next_total_price-total_price as diff_price
from
    cte2
where
    year != next_year)
select
    distinct customer_id
from
    answer
where
    diff = 1 and diff_price > 0;


with cte as (
SELECT
            customer_id,
            YEAR(order_date) as yr,
            SUM(price) AS total
        FROM Orders
        GROUP BY customer_id, YEAR(order_date))
select
    *,
    yr - RANK() OVER (
                PARTITION BY customer_id
                ORDER BY total
            ) AS rk
from
    cte
