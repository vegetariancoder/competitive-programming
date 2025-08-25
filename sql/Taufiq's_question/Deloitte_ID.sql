use leetcode;
DROP TABLE IF EXISTS Products;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Product VARCHAR(255),
    Category VARCHAR(100)
);

INSERT INTO Products (ProductID, Product, Category)
VALUES
    (1, 'Laptop', 'Electronics'),
    (2, 'Smartphone', 'Electronics'),
    (3, 'Tablet', 'Electronics'),
    (4, 'Headphones', 'Accessories'),
    (5, 'Smartwatch', 'Accessories'),
    (6, 'Keyboard', 'Accessories'),
    (7, 'Mouse', 'Accessories'),
    (8, 'Monitor', 'Accessories'),
    (9, 'Printer', 'Electronics');

select * from Products;


with cte as (
select
    ProductID,
    Category,
    dense_rank() over (order by ProductID) as drnk
from
    Products
where
    Category = 'Electronics'),
calculated_cte as (
select
    *,
    dense_rank() over (order by drnk desc ) as drnk2
from
    cte),
main_cte as (
select
    Product,
    Category,
    dense_rank() over (order by ProductID ) as drnk
from
    Products
where
    category = 'Electronics')
select
    calculated_cte.ProductID,
    main_cte.Product,
    main_cte.Category
from
    calculated_cte
inner join
    main_cte
on
    calculated_cte.drnk2 = main_cte.drnk;







with cte as (
select
    ProductID,
    Category,
    dense_rank() over (partition by Products.Category order by ProductID) as drnk
from
    Products),
calculated_cte as (
select
    *,
    dense_rank() over (partition by cte.Category order by drnk desc ) as drnk2
from
    cte),
main_cte as (
select
    Product,
    Category,
    dense_rank() over (partition by Products.Category order by ProductID ) as drnk
from
    Products)
select
    calculated_cte.ProductID,
    main_cte.Product,
    main_cte.Category
from
    calculated_cte
inner join
    main_cte
on
    calculated_cte.drnk2 = main_cte.drnk and calculated_cte.Category = main_cte.Category;













