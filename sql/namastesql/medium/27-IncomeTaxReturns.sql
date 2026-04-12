use leetcode;

-- Table for tax filing deadlines per financial year
CREATE TABLE income_tax_dates (
    financial_year VARCHAR(10),
    file_start_date DATE,
    file_due_date DATE,
    PRIMARY KEY (financial_year)
);

-- Table for user-specific tax return filing dates
CREATE TABLE user_tax_returns (
    user_id INT,
    financial_year VARCHAR(10),
    return_file_date DATE
);

INSERT INTO user_tax_returns (user_id, financial_year, return_file_date) VALUES
(1, 'FY20', '2020-05-10'),
(1, 'FY21', '2021-10-10'),
(1, 'FY23', '2023-08-20'),
(2, 'FY20', '2020-05-15'),
(2, 'FY21', '2021-09-10'),
(2, 'FY22', '2022-08-20'),
(2, 'FY23', '2023-10-10'),
(3, 'FY20', '2020-06-20'),
(3, 'FY22', '2022-07-10'),
(3, 'FY23', '2023-09-20'),
(1, 'FY24', '2024-07-10'),
(2, 'FY24', '2024-08-12');

INSERT INTO income_tax_dates (financial_year, file_start_date, file_due_date) VALUES
('FY20', '2020-05-01', '2020-08-31'),
('FY21', '2021-06-01', '2021-09-30'),
('FY22', '2022-05-05', '2022-08-29'),
('FY23', '2023-05-05', '2023-08-31');

select * from user_tax_returns;

select * from income_tax_dates;

select
    user_tax_returns.*,
    income_tax_dates.file_start_date,
    income_tax_dates.file_due_date,
    if(return_file_date > file_due_date, 'late return', 'not late') as comment
from
    user_tax_returns
inner join
    income_tax_dates
on
    user_tax_returns.financial_year = income_tax_dates.financial_year;

select
    user_tax_returns.user_id,
    user_tax_returns.financial_year
from
    user_tax_returns
where
    user_tax_returns.financial_year not in (select distinct financial_year from income_tax_dates);



with all_years_value as (
select u.user_id,
       it.financial_year,
       it.file_due_date
from
    user_tax_returns u
cross join
    income_tax_dates it
group by
    u.user_id,it.financial_year,it.file_due_date)
select
    all_years_value.user_id,
    all_years_value.financial_year,
    if(return_file_date > file_due_date, 'late return', 'missed') as comment
from
    all_years_value
left join
    user_tax_returns
on
    all_years_value.user_id = user_tax_returns.user_id
    and all_years_value.financial_year = user_tax_returns.financial_year
where
    user_tax_returns.return_file_date > all_years_value.file_due_date or user_tax_returns.return_file_date is null
order by
    all_years_value.financial_year