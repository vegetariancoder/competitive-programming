use leetcode;

CREATE TABLE product_orders (
    order_id INT PRIMARY KEY,
    product_id VARCHAR(50),
    category VARCHAR(50),
    unit_price INT,
    quantity INT
);

INSERT INTO product_orders VALUES
(100, 'Chair-1221', 'Furniture', 1500, 1),
(101, 'Table-3421', 'Furniture', 2000, 3),
(102, 'Chair-1221', 'Furniture', 1500, 2),
(103, 'Table-9762', 'Furniture', 7000, 2),
(104, 'Shoes-1221', 'Footwear', 1700, 1),
(105, 'floaters-3421', 'Footwear', 2000, 1),
(106, 'floaters-3421', 'Footwear', 2000, 1),
(107, 'floaters-9875', 'Footwear', 1500, 2),
(108, 'Chair-1221', 'Furniture', 1500, 1),
(109, 'Table-3421', 'Furniture', 2000, 1),
(110, 'Shoes-1221', 'Footwear', 1700, 1),
(111, 'floaters-9875', 'Footwear', 1500, 1),
(112, 'floaters-3421', 'Footwear', 2000, 1),
(113, 'Table-9762', 'Furniture', 7000, 1),
(114, 'Table-3421', 'Furniture', 2000, 2),
(115, 'floaters-9875', 'Footwear', 1500, 1),
(116, 'Laptop-5511', 'Electronics', 55000, 2),
(117, 'Mouse-8841', 'Electronics', 700, 1),
(118, 'Keyboard-7721', 'Electronics', 1500, 1),
(119, 'Mouse-8841', 'Electronics', 700, 1);


with cte as (
select
    *,
    dense_rank() over (partition by category order by quantity desc ,unit_price desc ) as drnk
from
    product_orders)
select
    category,
    product_id
from
    cte
where
    drnk = 1
order by
    category;