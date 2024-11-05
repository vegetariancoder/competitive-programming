Create table if not exists transactions ( transaction_id int, amount int, transaction_date date);
insert into transactions (transaction_id, amount, transaction_date) values ('1', '150', '2024-07-01');
insert into transactions (transaction_id, amount, transaction_date) values ('2', '200', '2024-07-01');
insert into transactions (transaction_id, amount, transaction_date) values ('3', '75', '2024-07-01');
insert into transactions (transaction_id, amount, transaction_date) values ('4', '300', '2024-07-02');
insert into transactions (transaction_id, amount, transaction_date) values ('5', '50', '2024-07-02');
insert into transactions (transaction_id, amount, transaction_date) values ('6', '120', '2024-07-03');


select * from transactions;

with cte as (
select
    *,
    IF(mod(amount, 2) = 0, amount, 0) as even_amount,
    IF(mod(amount, 2) != 0, amount, 0) as odd_amount
from
    transactions)
select
    transaction_date,
    sum(odd_amount) as odd_sum,
    sum(even_amount) as even_sum
from
    cte
group by transaction_date ;