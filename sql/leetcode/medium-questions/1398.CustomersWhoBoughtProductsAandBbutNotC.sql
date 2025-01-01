use leetcode;

create table Customers(
    customer_id int,
    name varchar(100)
);

insert into Customers (customer_id, name)
values (1,'Daniel');
insert into Customers (customer_id, name)
values (2,'Diana');
insert into Customers (customer_id, name)
values (3,'Elizabeth');
insert into Customers (customer_id, name)
values (4,'john');


create table Orders(
    order_id int,
    customer_id int,
    product_name varchar(100)
);
truncate table Orders;
insert into Orders (order_id, customer_id, product_name)
values (10,1,'A');
insert into Orders (order_id, customer_id, product_name)
values (20,1,'B');
insert into Orders (order_id, customer_id, product_name)
values (30,1,'D');
insert into Orders (order_id, customer_id, product_name)
values (40,1,'C');
insert into Orders (order_id, customer_id, product_name)
values (50,2,'A');
insert into Orders (order_id, customer_id, product_name)
values (60,3,'A');
insert into Orders (order_id, customer_id, product_name)
values (70,3,'B');
insert into Orders (order_id, customer_id, product_name)
values (80,3,'D');
insert into Orders (order_id, customer_id, product_name)
values (90,4,'C');

select
    customer_id,
    count(distinct product_name)
from
    Orders
group by customer_id ;

with A_only as (
select
    distinct customer_id
from
    Orders
where
    product_name = 'A'),
B_only as (
select
    distinct customer_id
from
    Orders
where
    product_name = 'B'),
C_only as (
select
    distinct customer_id
from
    Orders
where
    product_name = 'C')
select
    Customers.name
from
    A_only
right join
    Customers
on
    A_only.customer_id = Customers.customer_id
where
    A_only.customer_id in (select customer_id from B_only) and A_only.customer_id not in (select customer_id from C_only);
