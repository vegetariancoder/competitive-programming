use online;

create table sku
(
sku_id int,
price_date date ,
price int
);

insert into sku values
(1,'2023-01-01',10)
,(1,'2023-02-15',15)
,(1,'2023-03-03',18)
,(1,'2023-03-27',15)
,(1,'2023-04-06',20);

select *
from sku;

with answer as (
with cte as (
select
    *,
    row_number() over (partition by sku_id, year(price_date), month(price_date) order by price_date desc ) as rno
from
    sku)
select
    sku_id,
    date_format(date_add(price_date, interval 1 month ),'%Y-%m-01') as next_month,
    price
from
    cte
where
    rno =1
union all
select
    sku_id,
    price_date,
    price
from
    sku
where
    day(price_date) = 1
order by
    next_month)
select
    *,
    ifnull(price - lag(price) over (partition by sku_id order by next_month),0) as diff
from
    answer;
