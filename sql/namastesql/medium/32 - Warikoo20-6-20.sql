use leetcode;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(100),
    monthly_salary INT,
    savings INT
);

INSERT INTO users (user_name, monthly_salary, savings) VALUES
('Rahul', 40000, 15000),
('Vivek', 70000, 10000),
('Karan', 90000, 30000),
('Sanjay', 20000, 2000),
('Meera', 25000, 1000),
('Tushar', 30000, 3000),
('Kavita', 35000, 4000),
('Rishi', 28000, 1500),
('Priya', 36000, 5000),
('Sameer', 18000, 800),
('Nilesh', 22000, 1200),
('Arjun', 27000, 1800),
('Harsh', 24000, 900),
('Divya', 26000, 1100),
('Sonam', 32000, 2000),
('Aman', 33000, 2500),
('Ruchi', 29000, 1700);

CREATE TABLE phones (
    phone_name VARCHAR(100) PRIMARY KEY,
    cost INT
);

INSERT INTO phones (phone_name, cost) VALUES
('iphone-12', 60000),
('oneplus-12', 50000),
('iphone-14', 70000),
('fold-6', 150000),
('iphone-16-pro', 180000),
('s24-ultra', 130000),
('pixel-9-pro', 125000),
('rog-9-ultimate', 140000);

select * from users;

select * from phones;

with calculated_cost as (
select
    *,
    round(20/100 * cost,0) as twenty_percent_cost,
    round((cost-(20/100 * cost))/6,0) as six_months_emi
from
    phones),
answer as (
select
    users.*,
    calculated_cost.phone_name,
    calculated_cost.twenty_percent_cost,
    calculated_cost.six_months_emi,
    calculated_cost.cost,
    round(20/100 * users.monthly_salary,0) as twenty_percent_salary
from
    calculated_cost
inner join
    users
on
    calculated_cost.twenty_percent_cost <= users.savings and calculated_cost.six_months_emi <= round(20/100 * users.monthly_salary,0)
order by
    calculated_cost.phone_name desc )
select
    answer.user_name,
    group_concat(answer.phone_name) as phone_name
from
    answer
group by
    answer.user_name
order by
    user_name;


