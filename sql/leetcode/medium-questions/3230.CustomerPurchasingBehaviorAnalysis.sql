drop database leetcode;
create database leetcode;
use leetcode;

-- Create the Transactions table
CREATE TABLE Transactions (
    transaction_id INT,
    customer_id INT,
    product_id INT,
    transaction_date DATE,
    amount DECIMAL(10, 2)
);

-- Insert data into the Transactions table
INSERT INTO Transactions (transaction_id, customer_id, product_id, transaction_date, amount) VALUES
(1, 101, 1, '2023-01-01', 100.00),
(2, 101, 2, '2023-01-15', 150.00),
(3, 102, 1, '2023-01-01', 100.00),
(4, 102, 3, '2023-01-22', 200.00),
(5, 101, 3, '2023-02-10', 200.00);

-- Create the Products table
CREATE TABLE Products (
    product_id INT,
    category VARCHAR(255),
    price DECIMAL(10, 2)
);

-- Insert data into the Products table
INSERT INTO Products (product_id, category, price) VALUES
(1, 'A', 100.00),
(2, 'B', 150.00),
(3, 'C', 200.00);

-- Optional: Verify the data insertion
SELECT * FROM Transactions;

SELECT * FROM Products;

with cte as (
select
    Transactions.*,
    Products.category,
    dense_rank() over (partition by customer_id order by amount desc ) as drnk
from
    Transactions
inner join
    Products
on
    Transactions.product_id = Products.product_id),
answer as (
select
    customer_id,
    sum(amount) as total_amount,
    count(transaction_id) as transaction_count,
    count(distinct category) as unique_categories,
    avg(amount) as avg_transaction_amount,
    round((count(transaction_id)*10) + sum(amount)/100,2) as loyalty_score
from
    cte
group by customer_id)
select
    answer.*,
    cte.category
from
    answer
left join
    cte
on
    answer.customer_id = cte.customer_id
where
    cte.drnk = 1;