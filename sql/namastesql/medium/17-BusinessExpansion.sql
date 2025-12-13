use namastesql;


CREATE TABLE business_operations (
    business_date DATE,
    city_id INT
);

INSERT INTO business_operations (business_date, city_id) VALUES
('2020-01-02', 3),
('2020-07-01', 7),
('2021-01-01', 3),
('2021-02-03', 19),
('2022-12-01', 3),
('2022-12-15', 3),
('2022-02-28', 12),
('2020-03-10', 3),
('2020-11-20', 7),
('2021-05-08', 19),
('2021-09-18', 3),
('2022-01-12', 12),
('2022-03-22', 3),
('2022-06-14', 7),
('2023-01-05', 25),
('2023-02-10', 25),
('2022-10-12', 19),
('2021-11-11', 7),
('2020-12-30', 12),
('2022-09-09', 3);


select * from business_operations;


with answer as (
select
    city_id,
    min(year(business_date)) as first_year
from
    business_operations
group by
    city_id)
select
    first_year as first_operation_year,
    count(*) as no_of_new_cities
from
    answer
group by
    first_operation_year
order by
    first_operation_year;
