drop database leetcode;
create database leetcode;
use leetcode;

-- Create the Orders table
CREATE TABLE Orders (
    minute INT,
    order_count INT
);

-- Insert data into the Orders table
INSERT INTO Orders (minute, order_count) VALUES
    (1, 0),
    (2, 2),
    (3, 4),
    (4, 6),
    (5, 1),
    (6, 4),
    (7, 1),
    (8, 2),
    (9, 4),
    (10, 1),
    (11, 4),
    (12, 6);


select * from Orders;

select
    minute,
    sum(order_count) over (order by minute rows 5 preceding) as cm
from
    Orders