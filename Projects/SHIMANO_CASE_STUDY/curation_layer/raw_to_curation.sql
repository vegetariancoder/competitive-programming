use shimano;
-- https://www.sqlservertutorial.net/getting-started/sql-server-sample-database/


-- Find the customer who has placed the highest total value of orders and calculate that value.

with total_price as (
select
    customers.customer_id,
    customers.first_name,
    customers.last_name,
    sum(order_items.list_price) as total_spending
from
    customers
inner join
    orders
on
    customers.customer_id = orders.customer_id
inner join
    order_items
on
    orders.order_id = order_items.order_id
group by
    customers.customer_id, customers.first_name, customers.last_name),
answer as (
select
    *,
    dense_rank() over (order by total_spending desc ) as rnk
from
    total_price)
select
    customer_id, first_name, last_name, total_spending
from
    answer
where
    rnk = 1;


-- List all products that have never been ordered along with their details.


select
    *
from
    products
where
    product_id not in (select product_id from order_items);



-- Find the store with the highest average order value.

with avg_order as (
select
    stores.store_id,

    avg(order_items.list_price) as avg_order_val
from
    stores
inner join
    orders
on
    stores.store_id = orders.store_id
inner join
    order_items
on
    orders.order_id = order_items.order_id
group by stores.store_id),
answer as (
select
    *,
    dense_rank() over (order by avg_order_val desc ) as drnk
from
    avg_order)
select
    store_id,
    avg_order_val
from
    answer
where
    drnk = 1;

