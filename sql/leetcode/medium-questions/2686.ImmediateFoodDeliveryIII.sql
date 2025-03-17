drop database leetcode;
create database leetcode;
use leetcode;

CREATE TABLE delivery (
  delivery_id INT,
  customer_id INT,
  order_date DATE,
  customer_pref_delivery_date DATE
);

INSERT INTO delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date)
VALUES
  (1, 1, '2019-08-01', '2019-08-02'),
  (2, 2, '2019-08-01', '2019-08-01'),
  (3, 1, '2019-08-01', '2019-08-01'),
  (4, 3, '2019-08-02', '2019-08-13'),
  (5, 3, '2019-08-02', '2019-08-02'),
  (6, 2, '2019-08-02', '2019-08-02'),
  (7, 4, '2019-08-03', '2019-08-03'),
  (8, 1, '2019-08-03', '2019-08-03'),
  (9, 5, '2019-08-04', '2019-08-08'),
  (10, 2, '2019-08-04', '2019-08-18');


select * from delivery;

with answer as (
select
    *,
    if(order_date=customer_pref_delivery_date,'Immediate','Not') as flagging,
    count(order_date) over (partition by order_date order by order_date) as cnt,
    sum(case when if(order_date=customer_pref_delivery_date,'Immediate','Not')='Immediate' then 1 else 0 end) over (partition by order_date) as sm
from
    delivery)
select
    distinct order_date,
    round((sm/cnt)*100,2) as immediate_percentage
from
    answer