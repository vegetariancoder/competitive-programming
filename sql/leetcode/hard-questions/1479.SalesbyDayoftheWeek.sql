use leetcode;

CREATE TABLE Items (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(100),
    item_category VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    item_id INT,
    quantity INT,
    FOREIGN KEY (item_id) REFERENCES Items(item_id)
);

INSERT INTO Items (item_id, item_name, item_category) VALUES
(1, 'LC Alg. Book', 'Book'),
(2, 'LC DB. Book', 'Book'),
(3, 'LC SmarthPhone', 'Phone'),
(4, 'LC Phone 2020', 'Phone'),
(5, 'LC SmartGlass', 'Glasses'),
(6, 'LC T-Shirt XL', 'T-Shirt');

INSERT INTO Orders (order_id, customer_id, order_date, item_id, quantity) VALUES
(1, 1, '2020-06-01', 1, 10),
(2, 1, '2020-06-08', 2, 10),
(3, 2, '2020-06-02', 1, 5),
(4, 3, '2020-06-03', 3, 5),
(5, 4, '2020-06-04', 4, 1),
(6, 4, '2020-06-05', 5, 5),
(7, 5, '2020-06-05', 1, 10),
(8, 5, '2020-06-14', 4, 5),
(9, 5, '2020-06-21', 3, 5);


select
    Items.item_category,
    sum(if(dayofweek(order_date)=2,quantity,0))as Monday,
    sum(if(dayofweek(order_date)=3,quantity,0))as Tuesday,
    sum(if(dayofweek(order_date)=4,quantity,0))as Wednesday,
    sum(if(dayofweek(order_date)=5,quantity,0))as Thursday,
    sum(if(dayofweek(order_date)=6,quantity,0))as Friday,
    sum(if(dayofweek(order_date)=7,quantity,0))as Saturday,
    sum(if(dayofweek(order_date)=1,quantity,0))as Sunday
from
    Orders
right join
    Items
on
    Orders.item_id = Items.item_id
group by Items.item_category
order by item_category;
