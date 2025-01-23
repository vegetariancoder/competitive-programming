use leetcode;
Create table If Not Exists Accounts (account_id int, max_income int);
insert into Accounts (account_id,max_income) value (3,21000);
insert into Accounts (account_id,max_income) value (4,10400);

Create table If Not Exists Transactions (transaction_id int, account_id int, Accounttype varchar(100), amount int, dayvalue date);
insert into Transactions (transaction_id, account_id, Accounttype, amount, dayvalue) values (2,3,'Creditor',107100,'2021-06-02');
insert into Transactions (transaction_id, account_id, Accounttype, amount, dayvalue) values (4,4,'Creditor',10400,'2021-06-20');
insert into Transactions (transaction_id, account_id, Accounttype, amount, dayvalue) values (11,4,'Debtor',58800,'2021-07-23');
insert into Transactions (transaction_id, account_id, Accounttype, amount, dayvalue) values (1,4,'Creditor',49300,'2021-05-03');
insert into Transactions (transaction_id, account_id, Accounttype, amount, dayvalue) values (15,3,'Debtor',75500,'2021-05-23');
insert into Transactions (transaction_id, account_id, Accounttype, amount, dayvalue) values (10,3,'Creditor',102100,'2021-06-15');
insert into Transactions (transaction_id, account_id, Accounttype, amount, dayvalue) values (14,4,'Creditor',56300,'2021-07-21');
insert into Transactions (transaction_id, account_id, Accounttype, amount, dayvalue) values (19,4,'Debtor',101100,'2021-05-09');
insert into Transactions (transaction_id, account_id, Accounttype, amount, dayvalue) values (8,3,'Creditor',64900,'2021-07-26');
insert into Transactions (transaction_id, account_id, Accounttype, amount, dayvalue) values (7,3,'Creditor',90900,'2021-06-14');


select
    *,
    substring(dayvalue,1,7) as month,
    sum(amount) over (partition by account_id,substring(dayvalue,1,7) order by  dayvalue) as rsum
from
    Transactions
where
    Accounttype = 'Creditor';


with cte as (
select
    Transactions.account_id,
    substring(Transactions.dayvalue,1,7) as month,
    sum(Transactions.amount) as sm
from
    Transactions
where
    Accounttype = 'Creditor'
group by
    account_id, month
order by
    account_id),
answer as (
select
    cte.account_id,
    cte.month,
    cte.sm,
    Accounts.max_income,
    if(sm>Accounts.max_income,'Yes','No') as exceeded,
    lead(month) over (partition by Accounts.account_id) as next_month,
    lead(if(sm>Accounts.max_income,'Yes','No')) over (partition by Accounts.account_id) as next_exceed
from
    cte
inner join
    Accounts
on
    Accounts.account_id = cte.account_id)
select
account_id
from
    answer
where
    substring(next_month,6,7)-substring(month,6,7)=1 and exceeded = next_exceed;