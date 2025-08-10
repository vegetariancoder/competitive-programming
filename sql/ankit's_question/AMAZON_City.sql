use leetcode;

CREATE TABLE orders (
    order_id INT,
    order_date DATE,
    user_id INT
);

INSERT INTO orders VALUES
(101, '2024-01-01', 1),
(102, '2024-01-05', 1),
(103, '2024-01-01', 2),
(104, '2024-01-20', 2),
(105, '2024-02-01', 3),
(106, '2024-02-03', 3),
(107, '2024-02-10', 3),
(108, '2024-03-01', 4),
(109, '2024-03-08', 4),
(110, '2024-04-01', 5),
(111, '2024-05-10', 6),
(112, '2024-05-10', 6);

select * from orders;

with answer as (
select
    user_id,
    datediff(lead(order_date) over (partition by user_id order by order_date),order_date) as diff
from
    orders
where
   user_id in (
select
    user_id
from
    orders
group by
    user_id
having
    count(user_id) = 2))
select distinct user_id from answer where diff <=7;


