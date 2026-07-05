use leetcode;

-- Table for product master data
CREATE TABLE products (
    product_id int,
    unit_cost decimal(5,2)
);

-- Table for tracking inventory level history and events
CREATE TABLE inventory (
    inventory_level int,
    inventory_target int,
    location_id INT,
    product_id int
);

INSERT INTO inventory (location_id, product_id, inventory_level, inventory_target) VALUES
(1, 101, 90, 80),
(1, 102, 100, 85),
(2, 102, 90, 80),
(2, 103, 70, 95),
(2, 104, 50, 60),
(3, 103, 120, 100),
(4, 104, 90, 102),
(5, 105, 50, 50),
(5, 106, 40, 40),
(5, 107, 80, 80),
(5, 108, 60, 60),
(5, 109, 55, 55),
(5, 110, 75, 75),
(5, 111, 90, 90),
(5, 112, 65, 65),
(5, 113, 70, 70),
(5, 114, 100, 100),
(5, 115, 85, 85),
(5, 116, 95, 95);


INSERT INTO products (product_id, unit_cost) VALUES
(101, 51.50),
(102, 55.50),
(103, 59.00),
(104, 50.00),
(105, 60.00),
(106, 70.00),
(107, 40.00),
(108, 75.00),
(109, 80.00),
(110, 55.00),
(111, 62.00),
(112, 66.00),
(113, 77.00),
(114, 88.00),
(115, 99.00),
(116, 45.00);


with calc as (
select
    location_id,
    sum(inventory.inventory_level)-sum(inventory.inventory_target) as excess_insufficient_qty,
    sum(products.unit_cost * inventory.inventory_level) - sum(products.unit_cost * inventory.inventory_target) as excess_insufficient_value
from
    inventory
inner join
    products
on
    inventory.product_id = products.product_id
group by
    location_id)
select
    location_id,
    excess_insufficient_qty,
    excess_insufficient_value
from
    calc
union
select
    'Overall' as location,
    (select sum(excess_insufficient_qty) from calc) as excess_insufficient_qty,
    (select sum(excess_insufficient_value) from calc) as excess_insufficient_value;


