use leetcode;
-- Create the Purchases table
CREATE TABLE Purchases (
    user_id INT,
    purchase_date DATE,
    amount_spend INT
);

-- Insert data into the Purchases table
INSERT INTO Purchases (user_id, purchase_date, amount_spend) VALUES
(11, '2023-11-07', 1126),
(15, '2023-11-30', 7473),
(17, '2023-11-14', 2414),
(12, '2023-11-24', 9692),
(8, '2023-11-03', 5117),
(1, '2023-11-16', 5241),
(10, '2023-11-12', 8266),
(13, '2023-11-24', 12000);

-- Optional: Verify the data insertion
SELECT * FROM Purchases;

with answer as (
select
    *,
    dayofweek(purchase_date) as day,
    FLOOR((DAYOFMONTH(purchase_date) - 1) / 7) + 1 AS week_of_month
from
    Purchases)
select
    week_of_month,
    purchase_date,
    sum(amount_spend)
from
    answer
where
    day = 6
group by
    week_of_month, purchase_date;