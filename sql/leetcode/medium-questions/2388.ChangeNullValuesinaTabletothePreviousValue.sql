drop database leetcode;
create database leetcode;
use leetcode;


CREATE TABLE IF NOT EXISTS CoffeeShop (
    id INT,
    drink varchar(100));

insert into CoffeeShop (id,drink) values (9,'Mezcal Margarita');
insert into CoffeeShop (id,drink) values (6,null);
insert into CoffeeShop (id,drink) values (7,null);
insert into CoffeeShop (id,drink) values (3,'Americano');
insert into CoffeeShop (id,drink) values (1,'Daiquiri');
insert into CoffeeShop (id,drink) values (2,null);

select * from CoffeeShop;


with cte1 as (
select
    *,
    row_number() over () as rk
from
    CoffeeShop),
cte2 as (
select
    *,
    lead(rk,1,9999) over (order by rk) as next_rn
from
    cte1
where
    drink is not null)
select
    cte2.id,
    cte2.drink
from
    cte1
inner join
    cte2
on
    cte1.rk >= cte2.rk and cte1.rk <= cte2.next_rn;



select * from CoffeeShop;


select
    *,
    case
        when drink is not null then @cur :=CoffeeShop.drink else @cur end as drinks
from
    CoffeeShop

