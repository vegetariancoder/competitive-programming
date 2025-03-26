drop database leetcode;
create database leetcode;
use leetcode;-- Create the Transactions table

CREATE TABLE Transactions (
    user_id INT,
    spend DECIMAL(10, 2),  -- DECIMAL for monetary values
    transaction_date DATETIME
);

-- Insert data into the Transactions table
INSERT INTO Transactions (user_id, spend, transaction_date) VALUES
(1, 65.56, '2023-11-18 13:49:42'),
(1, 96.00, '2023-11-30 02:47:26'),
(1, 7.44, '2023-11-02 12:15:23'),
(1, 49.78, '2023-11-12 00:13:46'),
(2, 40.89, '2023-11-21 04:39:15'),
(2, 100.44, '2023-11-20 07:39:34'),
(3, 37.33, '2023-11-03 06:22:02'),
(3, 13.89, '2023-11-11 16:00:14'),
(3, 7.00, '2023-11-29 22:32:36');

-- Optional: Verify the data insertion
SELECT * FROM Transactions;

with answer as (
select
    *,
    dense_rank() over (partition by user_id order by transaction_date,spend) as drnk,
    lag(spend,2) over (partition by user_id order by transaction_date,spend) as first_lg,
    lag(spend,1) over (partition by user_id order by transaction_date,spend) as second_lg
from
    Transactions)
select
    user_id,
    spend as third_transaction_spend,
    transaction_date
from
    answer
where
    drnk = 3 and spend > first_lg and spend > second_lg;