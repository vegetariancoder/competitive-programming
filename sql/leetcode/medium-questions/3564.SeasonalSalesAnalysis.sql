use leetcode;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

INSERT INTO products (product_id, product_name, category) VALUES
(1, 'Warm Jacket', 'Apparel'),
(2, 'Designer Jeans', 'Apparel'),
(3, 'Cutting Board', 'Kitchen'),
(4, 'Smart Speaker', 'Tech'),
(5, 'Yoga Mat', 'Fitness');


CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    sale_date DATE,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO sales (sale_id, product_id, sale_date, quantity, price) VALUES
(1, 1, '2023-01-15', 5, 10.00),
(2, 2, '2023-01-20', 4, 15.00),
(3, 3, '2023-03-10', 3, 18.00),
(4, 4, '2023-04-05', 1, 20.00),
(5, 1, '2023-05-20', 2, 10.00),
(6, 2, '2023-06-12', 4, 15.00),
(7, 5, '2023-06-15', 5, 12.00),
(8, 3, '2023-07-24', 2, 18.00),
(9, 4, '2023-08-01', 5, 20.00),
(10, 5, '2023-09-03', 3, 12.00),
(11, 1, '2023-09-25', 6, 10.00),
(12, 2, '2023-11-10', 4, 15.00),
(13, 3, '2023-12-05', 6, 18.00),
(14, 4, '2023-12-22', 3, 20.00),
(15, 5, '2024-02-14', 2, 12.00);

with cte as (
select
    sales.*,
    products.category,
    case
        when month(sale_date) in (12,1,2) then 'Winter'
        when month(sale_date) in (3,4,5) then 'Spring'
        when month(sale_date) in (6,7,8) then 'Summer'
        when month(sale_date) in (9,10,11) then 'Fall'
    end as season,
    quantity*price as value
from
    sales
inner join
    products
on
    sales.product_id = products.product_id),
answer as (
select
    season,
    category,
    sum(quantity) as total_qty,
    sum(value) as total_revenue,
    dense_rank() over (partition by season order by sum(quantity) desc , sum(value) desc ) as drnk
from
    cte
group by
season, category)
select season,category, total_qty,total_revenue from answer where drnk=1;