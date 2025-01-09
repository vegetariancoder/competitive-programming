USE leetcode;
CREATE TABLE UsersName (
  user_id int,
  user_name varchar (100),
  credit int
);

INSERT INTO UsersName
  (user_id, user_name,credit)
VALUES
  (1, 'Moustafa',100),
  (2, 'Jonathan',200),
  (3, 'Winston',10000),
  (4, 'Luis',800);


CREATE TABLE TransactionsName (
  trans_id int,
  paid_by int,
  paid_to int,
  amount int
);

INSERT INTO TransactionsName
  (trans_id, paid_by,paid_to,amount)
VALUES
  (1,1,3,400),
  (2,3,2,500),
  (3,2,1,200);

with paid_by as (
select
    UsersName.user_name,
    credit,
    case
        when paid_by then credit-TransactionsName.amount
    end as paid_by_transaction
from
    TransactionsName
inner join
    UsersName
on
    UsersName.user_id = TransactionsName.paid_by),
paid_to as (
select
    UsersName.user_name,
    credit,
    case
        when paid_to then TransactionsName.amount
    end as paid_to_transaction
from
    TransactionsName
inner join
    UsersName
on
    UsersName.user_id = TransactionsName.paid_to)
select
    UsersName.user_id,
    UsersName.user_name,
    ifnull(paid_by.paid_by_transaction + paid_to.paid_to_transaction,UsersName.credit) as credit,
    if(ifnull(paid_by.paid_by_transaction + paid_to.paid_to_transaction,0)<0,'Yes','No') as credit_limit_breached
from
    paid_by
inner join
    paid_to
on
    paid_by.user_name = paid_to.user_name
right join
    UsersName
on
    paid_by.user_name = UsersName.user_name;