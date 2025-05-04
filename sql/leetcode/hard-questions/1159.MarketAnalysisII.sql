drop database leetcode;
create database leetcode;
use leetcode;

CREATE TABLE IF NOT EXISTS Users (
    user_id INT,
    join_date date,
    favorite_brand varchar(100));


CREATE TABLE IF NOT EXISTS Orders (
    order_id INT,
    order_date date,
    item_id int,
    buyer_id int,
    seller_id int);

CREATE TABLE IF NOT EXISTS Items (
    item_id INT,
    item_brand varchar(100));


insert into Users (user_id,join_date,favorite_brand) values (1,'2019-01-01','Lenovo');
insert into Users (user_id,join_date,favorite_brand) values (2,'2019-02-09','Samsung');
insert into Users (user_id,join_date,favorite_brand) values (3,'2019-01-19','LG');
insert into Users (user_id,join_date,favorite_brand) values (4,'2019-05-21','HP');


insert into Orders (order_id,order_date,item_id,buyer_id,seller_id) values (1,'2019-08-01',4,1,2);
insert into Orders (order_id,order_date,item_id,buyer_id,seller_id) values (2,'2019-08-02',2,1,3);
insert into Orders (order_id,order_date,item_id,buyer_id,seller_id) values (3,'2019-08-03',3,2,3);
insert into Orders (order_id,order_date,item_id,buyer_id,seller_id) values (4,'2019-08-04',1,4,2);
insert into Orders (order_id,order_date,item_id,buyer_id,seller_id) values (5,'2019-08-04',1,3,4);
insert into Orders (order_id,order_date,item_id,buyer_id,seller_id) values (6,'2019-08-05',2,2,4);


insert into Items (item_id,item_brand) values (1,'Samsung');
insert into Items (item_id,item_brand) values (2,'Lenovo');
insert into Items (item_id,item_brand) values (3,'LG');
insert into Items (item_id,item_brand) values (4,'HP');

with fav_table as (
select
    Users.*,
    Items.item_id as fav_item_id
from
    Users
inner join
    Items
on
    Users.favorite_brand = Items.item_brand
order by
    Users.user_id),
cte as (
select
    Orders.*,
    fav_table.fav_item_id,
    dense_rank() over (partition by seller_id order by order_date) as drnk
from
    Orders
inner join
    fav_table
on
    Orders.seller_id = fav_table.user_id),
answer as (
select
    cte.seller_id,
    if(item_id=fav_item_id,'Yes','No') as 2nd_item_fav_brand
from
    cte
where
    cte.drnk = 2)
select
    Users.user_id,
    ifnull(answer.2nd_item_fav_brand,'No') as 2nd_item_fav_brand
from
    Users
left join
    answer
on
    Users.user_id = answer.seller_id;