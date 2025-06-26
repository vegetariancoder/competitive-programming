use leetcode;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_name VARCHAR(100),
    sales INT
);

INSERT INTO orders (order_id, order_date, customer_name, sales) VALUES
(1, '2023-01-01', 'Alexa', 100),
(2, '2023-01-02', 'Alexa', 200),
(3, '2023-01-03', 'Alexa', 300),
(4, '2023-01-03', 'Alexa', 400),
(5, '2023-01-01', 'Ramesh', 500),
(6, '2023-01-02', 'Ramesh', 600),
(7, '2023-01-03', 'Ramesh', 700),
(8, '2023-01-03', 'Neha', 800),
(9, '2023-01-03', 'Ankit', 800),
(10, '2023-01-04', 'Ankit', 900);


CREATE TABLE returns (
    order_id INT PRIMARY KEY,
    return_date DATE
);

INSERT INTO returns (order_id, return_date) VALUES
(1, '2023-01-02'),
(2, '2023-01-04'),
(3, '2023-01-05'),
(7, '2023-01-06'),
(9, '2023-01-06'),
(10, '2023-01-07');

with cte as (
select
    orders.customer_name,
    sum(if(orders.order_id = returns.order_id,1,0))/count(orders.customer_name) * 100 as return_percent
from
    orders
left join
    returns
on
    orders.order_id = returns.order_id
group by
    orders.customer_name)
select customer_name, return_percent from cte where return_percent > 50;




select
    orders.*,
    if(orders.order_id = returns.order_id,1,0) as returned
from
    orders
left join
    returns
on orders.order_id = returns.order_id;