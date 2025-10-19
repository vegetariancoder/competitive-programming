use leetcode;

CREATE TABLE subscribers (
  customer_id INT,
  subscription_date DATE,
  plan_value INT
);

INSERT INTO subscribers VALUES
(1, '2023-03-02', 799),
(1, '2023-04-01', 599),
(1, '2023-05-01', 499),
(2, '2023-04-02', 799),
(2, '2023-07-01', 599),
(2, '2023-09-01', 499),
(3, '2023-01-01', 499),
(3, '2023-04-01', 599),
(3, '2023-07-02', 799),
(4, '2023-04-01', 499),
(4, '2023-09-01', 599),
(4, '2023-10-02', 499),
(4, '2023-11-02', 799),
(5, '2023-10-02', 799),
(5, '2023-11-02', 799),
(6, '2023-03-01', 499);

select * from subscribers;;

with cte_1 as (
select
    *,
    lead(plan_value) over (partition by customer_id order by subscription_date) as next_plan_value
from
    subscribers),
graded as (
select
    *,
    if(next_plan_value<plan_value, 'Yes','No') as has_downgraded,
    if(next_plan_value>plan_value, 'Yes','No') as has_updgraded
from
    cte_1),
downgraded as (
select
    distinct
    customer_id,
    has_updgraded,
    has_downgraded

from
    graded
where
    has_downgraded='Yes'),
upgraded as (
select
    distinct
    customer_id,
    has_updgraded,
    has_downgraded

from
    graded
where
    has_updgraded='Yes'),
main_cte as (
select
    *
from
    upgraded
union all
select
    *
from
    downgraded
order by
    customer_id)
select
    dis_customers.customer_id,
    ifnull(main_cte.has_updgraded,'No') as has_updgraded,
    ifnull(main_cte.has_downgraded,'No') as has_downgraded
from
    main_cte
right join
    (select distinct customer_id from subscribers) as dis_customers
on
    dis_customers.customer_id=main_cte.customer_id;





# solution - 2

with cte as (
select
    *,
    lead(plan_value) over (partition by customer_id order by subscription_date) as next_plan_value
from
    subscribers)
select
    *
from
    cte