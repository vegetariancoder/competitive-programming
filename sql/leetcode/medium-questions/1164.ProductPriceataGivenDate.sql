drop database leetcode;
create database leetcode;
use leetcode;
Create table If Not Exists Products (product_id int,new_price int, change_date date);
insert into Products (product_id,new_price,change_date) value (1,20,'2019-08-14');
insert into Products (product_id,new_price,change_date) value (2,50,'2019-08-14');
insert into Products (product_id,new_price,change_date) value (1,30,'2019-08-15');
insert into Products (product_id,new_price,change_date) value (1,35,'2019-08-16');
insert into Products (product_id,new_price,change_date) value (2,65,'2019-08-17');
insert into Products (product_id,new_price,change_date) value (3,20,'2019-08-18');

select
    *
from
    Products;


with cte as (
select
    product_id,
    Products.new_price,
    dense_rank() over (partition by product_id order by change_date desc ) as drnk
from
    Products
where
    change_date <= '2019-08-16'),
price as (
select
    product_id,
    new_price
from
    cte
where
    drnk = 1)
select
    t.product_id,
    ifnull(new_price,10) as price
from
    price
right join
    (select distinct Products.product_id from Products) as t
on
    price.product_id = t.product_id;



