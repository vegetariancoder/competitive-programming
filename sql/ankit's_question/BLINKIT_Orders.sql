use leetcode;

CREATE TABLE orders (
    customer_id INT,
    order_date DATE,
    coupon_code VARCHAR(50)
);


-- ✅ Customer 1: First order in Jan, valid pattern
INSERT INTO Orders VALUES (1, '2025-01-10', NULL);
INSERT INTO Orders VALUES (1, '2025-02-05', NULL);
INSERT INTO Orders VALUES (1, '2025-02-20', NULL);
INSERT INTO Orders VALUES (1, '2025-03-01', NULL);
INSERT INTO Orders VALUES (1, '2025-03-10', NULL);
INSERT INTO Orders VALUES (1, '2025-03-15', 'DISC10'); -- last order with coupon ✅

-- ✅ Customer 2: First order in Feb, valid pattern
INSERT INTO Orders VALUES (2, '2025-02-02', NULL);   -- Month1 = 1
INSERT INTO Orders VALUES (2, '2025-02-05', NULL);   -- Month1 = 1
INSERT INTO Orders VALUES (2, '2025-03-05', NULL);   -- Month2 = 2
INSERT INTO Orders VALUES (2, '2025-03-18', NULL);
INSERT INTO Orders VALUES (2, '2025-03-20', NULL);   -- Month2 = 2
INSERT INTO Orders VALUES (2, '2025-03-22', NULL);
INSERT INTO Orders VALUES (2, '2025-04-02', NULL);   -- Month3 = 3
INSERT INTO Orders VALUES (2, '2025-04-10', NULL);
INSERT INTO Orders VALUES (2, '2025-04-15', 'DISC20'); -- last order with coupon ✅
INSERT INTO Orders VALUES (2, '2025-04-16', NULL);   -- Month3 = 3
INSERT INTO Orders VALUES (2, '2025-04-18', NULL);
INSERT INTO Orders VALUES (2, '2025-04-20', 'DISC20'); -- last order with coupon ✅

-- ❌ Customer 3: First order in March but wrong multiples
INSERT INTO Orders VALUES (3, '2025-03-05', NULL);  -- Month1 = 1
INSERT INTO Orders VALUES (3, '2025-04-10', NULL);  -- Month2 should have 2, but only 1 ❌
INSERT INTO Orders VALUES (3, '2025-05-15', 'DISC30');

-- ❌ Customer 4: First order in Feb but missing March (gap)
INSERT INTO Orders VALUES (4, '2025-02-01', NULL);  -- Month1
INSERT INTO Orders VALUES (4, '2025-04-05', 'DISC40'); -- Skipped March ❌

-- ❌ Customer 5: Valid multiples but last order has no coupon
INSERT INTO Orders VALUES (5, '2025-01-03', NULL);  -- M1 = 1
INSERT INTO Orders VALUES (5, '2025-02-05', NULL);  -- M2 = 2
INSERT INTO Orders VALUES (5, '2025-02-15', NULL);
INSERT INTO Orders VALUES (5, '2025-03-01', NULL);  -- M3 = 3
INSERT INTO Orders VALUES (5, '2025-03-08', 'DISC50'); -- coupon mid
INSERT INTO Orders VALUES (5, '2025-03-20', NULL);     -- last order no coupon ❌

-- ❌ Customer 6: Skips month 2, should be excluded
INSERT INTO Orders VALUES (6, '2025-01-05', NULL);     -- Month1 = 1 order
-- (no orders in Feb, so Month2 is missing ❌)
INSERT INTO Orders VALUES (6, '2025-03-02', NULL);     -- Month3 = 1st order
INSERT INTO Orders VALUES (6, '2025-03-15', NULL);     -- Month3 = 2nd order
-- Jump to May (Month5 relative to Jan)
INSERT INTO Orders VALUES (6, '2025-05-05', NULL);
INSERT INTO Orders VALUES (6, '2025-05-10', NULL);
INSERT INTO Orders VALUES (6, '2025-05-25', 'DISC60'); -- Last order with coupon

select * from orders;



with three_consecutive_months as (
select
    distinct customer_id
from
    (
select
    customer_id,
    count(customer_id) over (partition by customer_id) as num_orders,
    lead(month_number) over (partition by customer_id order by month_number) - month_number as months_to_next_order
from
    (
select
    distinct customer_id,
    month(order_date) as month_number
from
    orders) as temp) as temp2
where
    num_orders = 3 and months_to_next_order = 1),
checking_second_third_month as (
select
    customer_id,
    month(order_date) as month_value,
    count(customer_id) as order_count,
    lead(count(customer_id)) over (partition by customer_id) as second_order_count,
    lead(count(customer_id),2) over (partition by customer_id) as third_order_count
from
    orders
where
    customer_id in (select customer_id from three_consecutive_months)
group by
    customer_id,
    month_value),
second_third_order_double as (
select
    customer_id
from
    checking_second_third_month
where
    second_order_count = order_count* 2 and third_order_count = order_count* 3),
last_order as (
select
    customer_id,
    max(order_date) as last_order_date
from
    orders
where
    customer_id in (select customer_id from second_third_order_double)
group by
    customer_id)
select
    customer_id
from
    orders
where
    (customer_id,order_date) in (select customer_id,last_order_date from last_order) and coupon_code is not null;

