use leetcode;

-- Table for product price history
CREATE TABLE products (
    product_id INT,
    price_date DATE,
    price INT,
    PRIMARY KEY (product_id, price_date)
);

-- Table for customer orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    product_id INT
);

INSERT INTO products (product_id, price_date, price) VALUES
(100, '2024-01-01', 150),
(100, '2024-01-21', 170),
(100, '2024-02-01', 190),
(101, '2024-01-01', 1000),
(101, '2024-01-27', 1200),
(101, '2024-02-05', 1250),
(102, '2024-01-01', 50),
(102, '2024-01-15', 60),
(102, '2024-02-01', 80),
(103, '2024-01-01', 200),
(103, '2024-01-18', 230),
(104, '2024-01-03', 500),
(104, '2024-02-01', 550),
(105, '2024-01-10', 300),
(106, '2024-01-05', 120),
(106, '2024-01-25', 140),
(107, '2024-02-01', 900),
(108, '2024-01-04', 160),
(108, '2024-02-06', 190),
(109, '2024-01-02', 40);


INSERT INTO orders (order_id, order_date, product_id) VALUES
(1, '2024-01-05', 100),
(2, '2024-01-21', 100),
(3, '2024-02-20', 100),
(4, '2024-01-07', 101),
(5, '2024-02-04', 101),
(6, '2024-02-05', 101),
(7, '2024-02-10', 101),
(8, '2024-01-02', 102),
(9, '2024-01-16', 102),
(10, '2024-02-10', 102),
(11, '2024-01-10', 103),
(12, '2024-01-25', 103),
(13, '2024-01-20', 104),
(14, '2024-02-03', 105),
(15, '2024-01-06', 106),
(16, '2024-01-28', 106),
(17, '2024-02-05', 107),
(18, '2024-02-08', 108),
(19, '2024-01-03', 109),
(20, '2024-01-15', 109);

select * from products;


with product_price_change as (
select
    product_id,
    price_date,
    price,
    lead(price_date) over (partition by product_id order by price_date) as price_next_date
from
    products),
final_table as (
select
    orders.*,
    product_price_change.price,
    dense_rank() over (partition by orders.order_id order by price desc ) as drnk
from
    orders
inner join
    product_price_change
on
    orders.product_id = product_price_change.product_id
and
    orders.order_date between product_price_change.price_date and ifnull(product_price_change.price_next_date, '9999-12-31'))
select
    product_id,
    sum(price) as total_sales
from
    final_table
where
    drnk = 1
group by
    product_id
