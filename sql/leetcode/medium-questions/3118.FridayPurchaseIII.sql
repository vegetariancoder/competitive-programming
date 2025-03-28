use leetcode;

-- Create the Purchases table
CREATE TABLE Purchases (
    user_id INT,
    purchase_date DATE,
    amount_spend INT
);

-- Insert data into the Purchases table
INSERT INTO Purchases (user_id, purchase_date, amount_spend) VALUES
(11, '2023-11-03', 1126),
(15, '2023-11-10', 7473),
(17, '2023-11-17', 2414),
(12, '2023-11-24', 9692),
(8, '2023-11-24', 5117),
(1, '2023-11-24', 5241),
(10, '2023-11-22', 8266),
(13, '2023-11-21', 12000);

-- Create the Users table
CREATE TABLE Users (
    user_id INT,
    membership VARCHAR(255)
);

-- Insert data into the Users table
INSERT INTO Users (user_id, membership) VALUES
(11, 'Premium'),
(15, 'VIP'),
(17, 'Standard'),
(12, 'VIP'),
(8, 'Premium'),
(1, 'VIP'),
(10, 'Standard'),
(13, 'Premium');

-- Optional: Verify the data insertion
SELECT * FROM Purchases;
SELECT * FROM Users;


WITH RECURSIVE
    T AS (
        SELECT 1 AS week_of_month
        UNION
        SELECT week_of_month + 1
        FROM T
        WHERE week_of_month < 4
    ),
    M AS (
        SELECT 'Premium' AS membership
        UNION
        SELECT 'VIP'
    ),
    P AS (
        SELECT CEIL(DAYOFMONTH(purchase_date) / 7) AS week_of_month, membership, amount_spend
        FROM
            Purchases
            JOIN Users USING (user_id)
        WHERE DAYOFWEEK(purchase_date) = 6
    )
SELECT week_of_month, membership, IFNULL(SUM(amount_spend), 0) AS total_amount
FROM
    T
    JOIN M
    LEFT JOIN P USING (week_of_month, membership)
GROUP BY 1, 2
ORDER BY 1, 2;