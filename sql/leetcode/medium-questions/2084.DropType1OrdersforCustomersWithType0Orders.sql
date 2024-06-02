use leetcode;

CREATE TABLE OrdersLeetCode (
order_id int,
customer_id int,
order_type int
);

INSERT into OrdersLeetCode values (1,1,0),
  (2,1,0),
  (11,2,0),
  (12,2,1),
  (21,3,1),
  (22,3,0),
  (31,4,1),
  (32,4,1);

select * from OrdersLeetCode;


with type0 as (
select
    customer_id,
    order_type
from
    OrdersLeetCode
where
    order_type = 0)
, type1 as (
select
    customer_id,
    order_type
from
    OrdersLeetCode
where
    order_type = 1)
select
    *
from
    type1
where
    customer_id not in (select customer_id from type0)
union all
select * from type0;