use leetcode;

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

INSERT INTO Products (product_id, category, price)
VALUES
(1, 'Electronics', 1000),
(2, 'Clothing', 50),
(3, 'Electronics', 1200),
(4, 'Home', 500);


CREATE TABLE Discounts (
    category VARCHAR(50) PRIMARY KEY,
    discount INT
);


INSERT INTO Discounts (category, discount)
VALUES
('Electronics', 10),
('Clothing', 20);

select
    Products.product_id,
    round(ifnull((price - (discount/100)*price),price),0) as final_price,
    ifnull(Discounts.category,Products.category) as category
from
    Products
left join
    Discounts
on
    Products.category = Discounts.category;

