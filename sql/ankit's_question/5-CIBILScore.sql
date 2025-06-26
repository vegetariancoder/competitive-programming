use leetcode;

CREATE TABLE cibil_scores (
    customer_id INT,
    score INT,
    date DATE
);

INSERT INTO cibil_scores (customer_id, score, date) VALUES
(1, 750, '2022-01-01'),
(1, 770, '2022-06-01'),
(1, 780, '2022-12-01'),

(2, 710, '2022-01-01'),
(2, 700, '2022-06-01'),
(2, 730, '2022-12-01'),

(3, 600, '2022-01-01'),
(3, 650, '2022-05-01'),
(3, 640, '2022-10-01'),

(4, 800, '2022-03-01'),
(4, 820, '2022-08-01'),
(4, 850, '2022-12-31');


select * from cibil_scores;

with cte as (
select
    *,
    lead(score,1,score) over (partition by customer_id order by date) as next_score
from
    cibil_scores),
cte2 as (
select
    *,
    if(next_score>=score,'Yes','No') as increase,
    count(customer_id) over (partition by customer_id) as cnt_customer
from
    cte),
answer as (
select
    *,
    sum(IF(increase = 'Yes', 1, 0)) over (partition by customer_id order by date) as sm
from
    cte2)
select
    distinct customer_id
from
    answer
where
    cnt_customer = sm