drop database leetcode;
create database leetcode;
use leetcode;

CREATE TABLE Seller (
    seller_id INT,
    join_date DATE,
    favorite_brand VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT,
    order_date DATE,
    item_id INT,
    seller_id INT
);

CREATE TABLE Items (
    item_id INT,
    item_brand VARCHAR(50)
);

INSERT INTO Seller (seller_id, join_date, favorite_brand)
VALUES
    (1, '2019-01-01', 'Lenovo'),
    (2, '2019-02-09', 'Samsung'),
    (3, '2019-01-19', 'LG');

INSERT INTO Orders (order_id, order_date, item_id, seller_id)
VALUES
    (1, '2019-08-01', 4, 2),
    (2, '2019-08-02', 2, 3),
    (3, '2019-08-03', 3, 3),
    (4, '2019-08-04', 1, 2),
    (5, '2019-08-04', 4, 2);

INSERT INTO Items (item_id, item_brand)
VALUES
    (1, 'Samsung'),
    (2, 'Lenovo'),
    (3, 'LG'),
    (4, 'HP');


with cte as (
select
    Orders.*,
    Items.item_id as fav_item_id
from
    Seller
inner join
    Items
on
    Seller.favorite_brand = Items.item_brand
inner join
    Orders
on
    Seller.seller_id = Orders.seller_id)
select
    seller_id,
    count(distinct item_id) as num_items
from
    cte
where
    item_id !=fav_item_id
group by seller_id;