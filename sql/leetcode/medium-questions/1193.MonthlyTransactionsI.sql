Create table If Not Exists Transactions (id int, country varchar(100), state varchar(100), amount int, trans_date date);
insert into Transactions (id,country,state,amount,trans_date) value (121,'US','approved',1000,'2018-12-18');
insert into Transactions (id,country,state,amount,trans_date) value (122,'US','declined',2000,'2018-12-19');
insert into Transactions (id,country,state,amount,trans_date) value (123,'US','approved',2000,'2019-01-01');
insert into Transactions (id,country,state,amount,trans_date) value (124,'DE','approved',2000,'2019-01-07');

select
    *
from
    Transactions;

select
    substring(trans_date,1,7) as month,
    country,
    count(id) as trans_count,
    sum(if(state = 'approved', 1, 0)) as approved_count,
    sum(amount) as trans_total_amount,
    sum(if(state = 'approved', amount,0)) as approved_total_amount
from
    Transactions
group by month, country ;