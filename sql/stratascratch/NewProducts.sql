use leetcode;


-- Create the table
CREATE TABLE car_sales (
    year INT,
    company_name VARCHAR(50),
    product_name VARCHAR(50)
);

-- Insert values
INSERT INTO car_sales (year, company_name, product_name) VALUES
(2019, 'Toyota', 'Avalon'),
(2019, 'Toyota', 'Camry'),
(2020, 'Toyota', 'Corolla'),
(2019, 'Honda', 'Accord'),
(2019, 'Honda', 'Passport'),
(2019, 'Honda', 'CR-V'),
(2020, 'Honda', 'Pilot'),
(2019, 'Honda', 'Civic'),
(2020, 'Chevrolet', 'Trailblazer'),
(2020, 'Chevrolet', 'Trax'),
(2019, 'Chevrolet', 'Traverse'),
(2020, 'Chevrolet', 'Blazer'),
(2019, 'Ford', 'Figo'),
(2020, 'Ford', 'Aspire'),
(2019, 'Ford', 'Endeavour'),
(2020, 'Jeep', 'Wrangler'),
(2020, 'Jeep', 'Cherokee'),
(2020, 'Jeep', 'Compass'),
(2019, 'Jeep', 'Renegade'),
(2019, 'Jeep', 'Gladiator');

select * from car_sales;


with main_cte as (
select
    company_name,
    year,
    count(distinct product_name) as cnt
from
    car_sales
group by company_name, year)
, cte_2020 as (
select
    company_name,
    year,
    cnt as cnt_2020
from
    main_cte
where
    year=2020),
cte_2019 as (
select
    company_name,
    year,
    cnt as cnt_2019
from
    main_cte
where
    year=2019)
select
    cte_2019.company_name,
    cte_2020.cnt_2020 - cte_2019.cnt_2019 as net_products
from
    cte_2020
inner join
    cte_2019
on
    cte_2020.company_name = cte_2019.company_name;
