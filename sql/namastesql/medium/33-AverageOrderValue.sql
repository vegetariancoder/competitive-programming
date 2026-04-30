use leetcode;

CREATE TABLE transactions (
    order_id INT PRIMARY KEY,
    user_id INT,
    transaction_amount DECIMAL(10, 2),
    transaction_date DATE
);

INSERT INTO transactions (order_id, user_id, transaction_amount, transaction_date) VALUES
(1, 101, 50.00, '2024-02-24'),
(2, 102, 75.00, '2024-02-24'),
(3, 103, 100.00, '2024-02-25'),
(4, 104, 30.00, '2024-02-26'),
(5, 105, 200.00, '2024-02-27'),
(6, 106, 50.00, '2024-02-27'),
(7, 107, 150.00, '2024-02-27'),
(8, 108, 80.00, '2024-02-29'),
(9, 201, 10.00, '2024-03-10'),
(10, 202, 60.00, '2024-03-01'),
(11, 203, 70.00, '2024-03-02'),
(12, 204, 85.00, '2024-03-03'),
(13, 205, 90.00, '2024-03-04'),
(14, 206, 55.00, '2024-03-05'),
(15, 207, 95.00, '2024-03-06'),
(16, 208, 120.00, '2024-03-07'),
(17, 209, 75.00, '2024-03-08'),
(18, 210, 65.00, '2024-03-09'),
(19, 211, 110.00, '2024-03-11'),
(20, 212, 105.00, '2024-03-12');

select * from transactions;


with cte as (
select
    transaction_date,
    sum(transaction_amount) / count(transaction_date) as aov
from
    transactions
group by
    transaction_date)
select
    distinct
    (select transaction_date from cte where aov = (select min(aov) from cte)) as transaction_date,
    (select round(min(aov),2) from cte) as aov,
    round((select max(aov) from cte)-(select min(aov) from cte),2) as diff_from_highest_aov
from
    cte


