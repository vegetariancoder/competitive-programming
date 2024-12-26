use leetcode;
Create table If Not Exists Delivery (delivery_id int, customer_id varchar(100), order_date date, customer_pref_delivery_date date);
insert into Delivery (delivery_id,customer_id,order_date,customer_pref_delivery_date) value (1,1,'2019-08-01','2019-08-02');
insert into Delivery (delivery_id,customer_id,order_date,customer_pref_delivery_date) value (2,2,'2019-08-02','2019-08-02');
insert into Delivery (delivery_id,customer_id,order_date,customer_pref_delivery_date) value (3,1,'2019-08-11','2019-08-12');
insert into Delivery (delivery_id,customer_id,order_date,customer_pref_delivery_date)value (4,3,'2019-08-24','2019-08-24');
insert into Delivery (delivery_id,customer_id,order_date,customer_pref_delivery_date) value (5,3,'2019-08-21','2019-08-22');
insert into Delivery (delivery_id,customer_id,order_date,customer_pref_delivery_date) value (6,2,'2019-08-11','2019-08-13');
insert into Delivery (delivery_id,customer_id,order_date,customer_pref_delivery_date) value (7,4,'2019-08-09','2019-08-09');

with cte as (
select
    *,
    dense_rank() over (partition by customer_id order by order_date ) as drnk
from
    Delivery)
select
    round((sum(if(order_date = customer_pref_delivery_date,1,0))/(select count(distinct customer_id) from cte))*100,2) as imm_del
from
    cte
where
    drnk = 1;
