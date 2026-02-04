use leetcode;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_name VARCHAR(100),
    sales DECIMAL(10, 2)
);

INSERT INTO orders (order_id, order_date, customer_name, sales) VALUES
(1, '2023-01-01', 'Alexa', 2000),
(2, '2023-01-02', 'Alexa', 300),
(3, '2023-01-03', 'Alexa', 1100),
(4, '2023-01-03', 'Alexa', 1350),
(5, '2023-01-01', 'Ramesh', 3500),
(6, '2023-01-02', 'Ramesh', 1600),
(7, '2023-01-03', 'Ramesh', 1100),
(8, '2023-01-03', 'Neha', 1200),
(9, '2023-01-03', 'Subhash', 1000),
(10, '2023-01-03', 'Subhash', 1050),
(11, '2023-01-04', 'Pooja', 500),
(12, '2023-01-05', 'Pooja', 600),
(13, '2023-01-06', 'Pooja', 450),
(14, '2023-01-07', 'Amit', 700),
(15, '2023-01-08', 'Amit', 800),
(16, '2023-01-09', 'Vikas', 900),
(17, '2023-01-10', 'Seema', 400),
(18, '2023-01-11', 'Seema', 350),
(19, '2023-01-12', 'Manoj', 300),
(20, '2023-01-13', 'Manoj', 250),
(21, '2023-01-14', 'Kiran', 600),
(22, '2023-01-15', 'Kiran', 500),
(23, '2023-01-16', 'Kiran', 550),
(24, '2023-01-17', 'Kiran', 650),
(25, '2023-01-18', 'Kiran', 700);

select * from orders;

select
    customer_name,
    count(order_id) as no_of_orders
from
    orders
group by
    customer_name
having
    no_of_orders >
(select
    count(orders.order_id)/(select (count(distinct customer_name)) from orders) as cnt
from
    orders)
order by
    no_of_orders desc;

