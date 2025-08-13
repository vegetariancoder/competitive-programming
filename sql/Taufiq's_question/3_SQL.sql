use leetcode;

-- Step 1: Create the table
CREATE TABLE Purchases (
    purchase_id INT PRIMARY KEY,
    customer_id VARCHAR(10),
    purchase_date DATE,
    return_date DATE
);

-- Step 2: Insert sample data
INSERT INTO Purchases (purchase_id, customer_id, purchase_date, return_date) VALUES
(1, 'C001', '2025-07-20', NULL),
(2, 'C002', '2025-07-22', '2025-07-25'),
(3, 'C001', '2025-07-25', NULL),
(4, 'C003', '2025-07-28', '2025-08-02'),
(5, 'C002', '2025-08-01', NULL),
(6, 'C001', '2025-08-05', NULL),
(7, 'C003', '2025-08-07', NULL),
(8, 'C002', '2025-08-10', NULL),
(9, 'C004', '2025-08-12', '2025-08-13'),
(10, 'C004', '2025-08-15', NULL);


select * from Purchases;

with cte as (
select
    *,
    datediff(return_date, purchase_date) as return_days
from
    Purchases
where
    purchase_date between date_sub(current_date, interval 30 day) and current_date)
select
    customer_id
from
    cte
where
    return_days > 7 or return_days is null
group by
    customer_id
having
    count(purchase_id) >= 2;





CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    order_date DATE,
    order_value DECIMAL(10,2)
);


INSERT INTO Orders (order_id, customer_name, order_date, order_value) VALUES
(1, 'Alice', '2025-08-01', 100.00),
(2, 'Bob', '2025-08-05', 200.00),
(3, 'Alice', '2025-08-10', 150.00),
(4, 'Charlie', '2025-07-30', 50.00),
(5, 'Alice', '2025-08-10', 200.00),
(6, 'Bob', '2025-08-05', 100.00),
(7, 'David', null, null);

select * from Orders;

select
    customer_name,
    order_date,
    sum(order_value) as total_value
from
    Orders
where
    (customer_name, order_date) in (
select
    customer_name,
    max(order_date) as latest_order_date
from
    Orders
group by
    customer_name)
group by customer_name, order_date
union
select
    Orders.customer_name,
    '9999-01-01' as order_date,
    0 as total_value
from
    Orders
where
    order_date is null;