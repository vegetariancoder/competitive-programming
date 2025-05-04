use leetcode;

-- Create the Failed table
CREATE TABLE Failed (
    fail_date DATE
);

-- Insert data into Failed table
INSERT INTO Failed (fail_date) VALUES
('2018-12-28'),
('2018-12-29'),
('2019-01-04'),
('2019-01-05');

-- Create the Succeeded table
CREATE TABLE Succeeded (
    success_date DATE
);

-- Insert data into Succeeded table
INSERT INTO Succeeded (success_date) VALUES
('2018-12-30'),
('2018-12-31'),
('2019-01-01'),
('2019-01-02'),
('2019-01-03'),
('2019-01-06');


with all_data as (
select
    fail_date as date_Value,
    'failed' as type
from
    Failed
union
select
    success_date as date_Value,
    'succeeded' as type
from
    Succeeded),
answer as (
select
    *,
    row_number() over (partition by type order by date_Value) as rno,
    substring(date_Value,10,10)-row_number() over (partition by type order by date_Value) as checking
from
    all_data
where
    year(date_Value) = 2019)
select
    type,
    min(date_Value) as start_date,
    max(date_Value) as end_date
from
    answer
group by
    checking, type
order by
    start_date;
