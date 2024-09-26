drop database leetcode;
create database leetcode;

use leetcode;
DROP TABLE IF EXISTS pizza_delivery;
CREATE TABLE pizza_delivery
(
	order_id 			INT,
	order_time 			TIMESTAMP,
	expected_delivery 	TIMESTAMP,
	actual_delivery 	TIMESTAMP,
	no_of_pizzas 		INT,
	price 				DECIMAL
);

select * from pizza_delivery;

with cte_1 as (
select
    *,
    concat(month(pizza_delivery.order_time),'-',year(pizza_delivery.order_time)) as period,
    timestampdiff(minute,order_time,actual_delivery) as diff
from
    pizza_delivery)
select
    period,
    (sum(case
        when diff > 30 then no_of_pizzas
    end)/sum(no_of_pizzas))*100 as percentage,
    sum(case
        when diff > 30 then no_of_pizzas
    end) as delay_pizza
from
    cte_1
group by
    period;