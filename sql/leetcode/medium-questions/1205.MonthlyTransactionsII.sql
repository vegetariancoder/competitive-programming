drop database leetcode;
create database leetcode;
use leetcode;
Create table If Not Exists Transactions (id int, country varchar (100), state varchar (100), amount int, trans_date date);
insert into Transactions (id,country,state,amount,trans_date) value (101,'US','approved',1000,'2019-05-18');
insert into Transactions (id,country,state,amount,trans_date) value (102,'US','declined',2000,'2019-05-19');
insert into Transactions (id,country,state,amount,trans_date) value (103,'US','approved',3000,'2019-06-10');
insert into Transactions (id,country,state,amount,trans_date) value (104,'US','declined',4000,'2019-06-13');
insert into Transactions (id,country,state,amount,trans_date) value (105,'US','approved',5000,'2019-06-15');

Create table If Not Exists Chargebacks (trans_id int, trans_date date);
insert into Chargebacks (trans_id,trans_date) value (102,'2019-05-29');
insert into Chargebacks (trans_id,trans_date) value (101,'2019-06-30');
insert into Chargebacks (trans_id,trans_date) value (105,'2019-09-18');


with calc as (
select
    substring(Transactions.trans_date,1,7) as year,
    country,
    sum(if(state='approved',1,0)) as approved_count,
    sum(if(state='approved',amount,0)) as approved_amount
from
    Transactions
group by
    year,country),
charges as (
select
    Transactions.amount,
    substring(Chargebacks.trans_date,1,7) as yearcharge,
    count(*) as cnt
from
    Transactions
left join
    Chargebacks
on
    Transactions.id = Chargebacks.trans_id
where
    trans_id is not null
group by Transactions.amount, Chargebacks.trans_date)
select
    charges.yearcharge as month,
    ifnull(calc.country,'US') as country,
    ifnull(calc.approved_count,0) as approved_count,
    ifnull(calc.approved_amount,0) as approved_amount ,
    charges.cnt as chargeback_count,
    charges.amount as chargeback_amount
from
    calc
right join
    charges
on
    calc.year = charges.yearcharge;
