drop database leetcode;
create database leetcode;
use leetcode;

CREATE TABLE Fraud (
    policy_id INT PRIMARY KEY,
    state VARCHAR(50),
    fraud_score DECIMAL(3, 2)
);

INSERT INTO Fraud (policy_id, state, fraud_score) VALUES
(1, 'California', 0.92),
(2, 'California', 0.68),
(3, 'California', 0.17),
(4, 'New York', 0.94),
(5, 'New York', 0.81),
(6, 'New York', 0.77),
(7, 'Texas', 0.98),
(8, 'Texas', 0.97),
(9, 'Texas', 0.96),
(10, 'Florida', 0.97),
(11, 'Florida', 0.98),
(12, 'Florida', 0.78),
(13, 'Florida', 0.88),
(14, 'Florida', 0.66);

select * from Fraud;

with answer as (
select
    *,
    rank()  over (partition by state order by policy_id) as pr
from
    Fraud)
select
    policy_id,
    state,
    fraud_score
from
    answer
where
    pr = 1
order by
    state,fraud_score desc ,policy_id;
