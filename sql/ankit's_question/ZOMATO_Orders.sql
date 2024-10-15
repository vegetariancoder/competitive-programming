use leetcode;


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    item VARCHAR(255) NOT NULL
);

INSERT INTO orders (order_id, item) VALUES
(1, 'Chow Mein'),
(2, 'Pizza'),
(3, 'Veg Nuggets'),
(4, 'Paneer Butter Masala'),
(5, 'Spring Rolls'),
(6, 'Veg Burger'),
(7, 'Paneer Tikka');

select * from orders;

with answer as (
select
    *,
    case
        when mod(order_id,2) <> 0 and order_id != (select count(*) from orders) then order_id+1
        when mod(order_id,2) = 0 then order_id-1
        else order_id
    end as new_order_id
from
    orders
order by
    new_order_id)
select
    new_order_id,
    item
from
    answer;


select
    *,
    ifnull(case
        when mod(order_id,2)<>0 then lead(item) over (order by order_id)
        when mod(order_id,2)=0 then lag(item) over (order by order_id)
    end,item) as checking
from
    orders;
