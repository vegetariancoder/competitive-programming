use leetcode;

CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    loan_amount INT,
    due_date DATE
);

INSERT INTO loans (loan_id, customer_id, loan_amount, due_date) VALUES
(1, 1, 5000, '2023-01-15'),
(2, 2, 8000, '2023-02-20'),
(3, 3, 10000, '2023-03-10'),
(4, 4, 6000, '2023-04-05'),
(5, 5, 7000, '2023-05-01');

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    loan_id INT,
    payment_date DATE,
    amount_paid INT
);

INSERT INTO payments (payment_id, loan_id, payment_date, amount_paid) VALUES
(1, 1, '2023-01-10', 2000),
(2, 1, '2023-02-10', 1500),
(3, 2, '2023-02-20', 8000),
(4, 3, '2023-04-20', 5000),
(5, 4, '2023-03-15', 2000),
(6, 4, '2023-04-02', 4000),
(7, 5, '2023-04-02', 4000),
(8, 5, '2023-05-02', 3000);


with cte as (
select
    payments.loan_id,
    sum(payments.amount_paid) as amt_paid,
    loans.loan_amount,
    loans.due_date,
    max(payments.payment_date) as max_paydt
from
    payments
inner join
    loans
on
    payments.loan_id = loans.loan_id
group by
    loan_id)
select
    loan_id,
    loan_amount,
    due_date,
    if(amt_paid>=loan_amount,1,0) as fully_paid_flag,
    if(due_date < max_paydt,0,1) as on_time_flag
from
    cte;