use leetcode;


-- Table to store user account information
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    opening_balance INT
);

-- Table to store transaction history
CREATE TABLE transactions (
    id INT PRIMARY KEY,
    from_userid INT,
    to_userid INT,
    amount INT,
    FOREIGN KEY (from_userid) REFERENCES users(user_id),
    FOREIGN KEY (to_userid) REFERENCES users(user_id)
);

INSERT INTO users (user_id, username, opening_balance) VALUES
(100, 'Ankit', 1000),
(101, 'Rahul', 9000),
(102, 'Amit', 5000),
(103, 'Agam', 7500),
(104, 'Neeraj', 3000);

INSERT INTO transactions (id, from_userid, to_userid, amount) VALUES
(1, 100, 102, 500),
(2, 102, 101, 700),
(3, 101, 102, 600),
(4, 102, 100, 1500),
(5, 102, 101, 800),
(6, 102, 101, 300),
(7, 104, 100, 200),
(8, 100, 104, 150),
(9, 104, 102, 300),
(10, 101, 104, 400),
(11, 103, 104, 250),
(12, 104, 103, 100),
(13, 102, 104, 500),
(14, 104, 101, 350),
(15, 100, 103, 100),
(16, 103, 100, 200),
(17, 101, 102, 50),
(18, 102, 101, 120),
(19, 104, 102, 180),
(20, 102, 104, 220);

select * from users;


select * from transactions;

with paid_amt as (
select
    from_userid,
    sum(amount) as paid_amount
from
    transactions
group by from_userid),
get_amt as (
select
    to_userid,
    sum(amount) as get_amount
from
    transactions
group by to_userid),
final as (
select
    from_userid,
    get_amount - paid_amount as balance
from
    paid_amt
inner join
    get_amt
on
    paid_amt.from_userid = get_amt.to_userid)
select
    username,
    opening_balance + balance as final_balance
from
    users
inner join
    final
on
    users.user_id = final.from_userid
order by final_balance;





