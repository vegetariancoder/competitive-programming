use namastesql;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_name VARCHAR(50),
    sales INT
);


CREATE TABLE customers (
    order_id INT,
    return_date DATE
);


INSERT INTO orders (order_id, order_date, customer_name, sales) VALUES
(1,  '2023-01-01', 'Alexa', 100),
(2,  '2023-01-02', 'Alexa', 200),
(3,  '2023-01-03', 'Alexa', 300),
(4,  '2023-01-03', 'Alexa', 400),
(5,  '2023-01-01', 'Ramesh', 500),
(6,  '2023-01-02', 'Ramesh', 600),
(7,  '2023-01-03', 'Ramesh', 700),
(8,  '2023-01-03', 'Neha', 800),
(9,  '2023-01-03', 'Ankit', 800),
(10, '2023-01-04', 'Ankit', 900),
(11, '2023-01-05', 'Amit', 250),
(12, '2023-01-06', 'Amit', 300),
(13, '2023-01-07', 'Amit', 350),
(14, '2023-01-05', 'John', 150),
(15, '2023-01-06', 'John', 200),
(16, '2023-01-07', 'John', 250),
(17, '2023-01-08', 'Sneha', 400),
(18, '2023-01-09', 'Sneha', 450),
(19, '2023-01-10', 'Sneha', 500),
(20, '2023-01-11', 'Ravi', 600),
(21, '2023-01-12', 'Ravi', 650),
(22, '2023-01-13', 'Ravi', 700),
(23, '2023-01-14', 'Priya', 300),
(24, '2023-01-15', 'Priya', 350),
(25, '2023-01-16', 'Priya', 400);

INSERT INTO customers (order_id, return_date) VALUES
(1,  '2023-01-02'),
(2,  '2023-01-04'),
(3,  '2023-01-05'),
(7,  '2023-01-06'),
(9,  '2023-01-06'),
(10, '2023-01-07'),
(23, '2023-01-16'),
(24, '2023-01-17');


select * from orders;


with cte as (
select
    orders.*,
    customers.return_date
from
    orders
left join
    customers
on
    orders.order_id = customers.order_id),
answer as (
select
    customer_name,
    round(sum(case when return_date is not null then 1 else 0 end)/count(order_id) * 100,2) as return_rate
from
    cte
group by
    customer_name)
select * from answer where return_rate > 50 order by customer_name;

