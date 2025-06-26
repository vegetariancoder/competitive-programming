use leetcode;

CREATE TABLE products (
    product_id INT,
    price_date DATE,
    price INT
);

INSERT INTO products (product_id, price_date, price) VALUES
(100, '2024-01-01', 150),
(100, '2024-01-21', 170),
(100, '2024-02-01', 190),
(101, '2024-01-01', 1000),
(101, '2024-01-27', 1200),
(101, '2024-02-05', 1250);


CREATE TABLE orders (
    order_id INT,
    order_date DATE,
    product_id INT
);

INSERT INTO orders (order_id, order_date, product_id) VALUES
(1, '2024-01-05', 100),
(2, '2024-01-21', 100),
(3, '2024-02-20', 100),
(4, '2024-01-07', 101),
(5, '2024-02-04', 101),
(6, '2024-02-05', 101),
(7, '2024-02-10', 101);

select * from products;

with cte as (
select
    *,
    DATE_ADD(LEAD(price_date, 1, '9999-12-31') OVER (PARTITION BY product_id ORDER BY price_date), INTERVAL -1 DAY) AS price_end_date
from
    products),
findings as (
select
    cte.*,
    orders.order_date,
    if(orders.order_date between cte.price_date and cte.price_end_date,'Yes','No') as yellow
from
    cte
inner join
    orders
on cte.product_id = orders.product_id)
select product_id,sum(price) as total_sales from findings where yellow = 'Yes' group by product_id;
