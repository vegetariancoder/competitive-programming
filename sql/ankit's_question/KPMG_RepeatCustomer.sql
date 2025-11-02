use leetcode;

CREATE TABLE Orders (
 Order_id int,
    Cust_id VARCHAR(10),
    Order_dt DATETIME,
    Order_amt DECIMAL(10,2)
);

-- Insert sample data
INSERT INTO Orders
VALUES
(1,'C1', '2025-01-01 09:15:00', 200.00),
(2,'C1', '2025-01-01 16:45:00', 150.00),
(3,'C2', '2025-01-01 10:20:00', 300.00),
(4,'C3', '2025-01-02 11:10:00', 250.00),
(5,'C1', '2025-01-02 13:00:00', 100.00),
(6,'C1', '2025-01-03 09:30:00', 180.00),
(7,'C2', '2025-01-03 15:50:00', 220.00);

select * from Orders;






with distinct_customer as (
select
    distinct
    Cust_id,
    date(Order_dt) as date_val
from
    Orders),
distinct_customers_cnt as (
select
    date_val,
    count(date_val) distinct_customers
from
    distinct_customer
group by
    date_val),
first_order as (
select
    Cust_id,
    min(date_val) as first_order_date,
    (select count(distinct Cust_id) from distinct_customer) as total_customers
from
    distinct_customer
group by
    Cust_id),
first_order_cnt as (
select
    first_order_date,
    count(Cust_id) as new_cust
from
    first_order
group by
    first_order_date)
select
    distinct_customers_cnt.date_val,
    ifnull(first_order_cnt.new_cust,0) as new_cust,
    distinct_customers_cnt.distinct_customers-ifnull(first_order_cnt.new_cust,0) as repeat_cust
from
    distinct_customers_cnt
left join
    first_order_cnt
on
    distinct_customers_cnt.date_val = first_order_cnt.first_order_date;

