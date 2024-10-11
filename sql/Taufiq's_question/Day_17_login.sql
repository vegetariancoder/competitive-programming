-- Drop the table if it exists
DROP TABLE IF EXISTS user_login;

-- Create the user_login table
CREATE TABLE user_login (
    user_id INT,
    login_date DATE
);

-- Insert data into the table using STR_TO_DATE() for date conversion
INSERT INTO user_login VALUES (1, STR_TO_DATE('01/03/2024', '%d/%m/%Y'));
INSERT INTO user_login VALUES (1, STR_TO_DATE('02/03/2024', '%d/%m/%Y'));
INSERT INTO user_login VALUES (1, STR_TO_DATE('03/03/2024', '%d/%m/%Y'));
INSERT INTO user_login VALUES (1, STR_TO_DATE('04/03/2024', '%d/%m/%Y'));
INSERT INTO user_login VALUES (1, STR_TO_DATE('06/03/2024', '%d/%m/%Y'));
INSERT INTO user_login VALUES (1, STR_TO_DATE('10/03/2024', '%d/%m/%Y'));
INSERT INTO user_login VALUES (1, STR_TO_DATE('11/03/2024', '%d/%m/%Y'));
INSERT INTO user_login VALUES (1, STR_TO_DATE('12/03/2024', '%d/%m/%Y'));
INSERT INTO user_login VALUES (1, STR_TO_DATE('13/03/2024', '%d/%m/%Y'));
INSERT INTO user_login VALUES (1, STR_TO_DATE('14/03/2024', '%d/%m/%Y'));

INSERT INTO user_login VALUES (1, STR_TO_DATE('20/03/2024', '%d/%m/%Y'));
INSERT INTO user_login VALUES (1, STR_TO_DATE('25/03/2024', '%d/%m/%Y'));
INSERT INTO user_login VALUES (1, STR_TO_DATE('26/03/2024', '%d/%m/%Y'));
INSERT INTO user_login VALUES (1, STR_TO_DATE('27/03/2024', '%d/%m/%Y'));
INSERT INTO user_login VALUES (1, STR_TO_DATE('28/03/2024', '%d/%m/%Y'));
INSERT INTO user_login VALUES (1, STR_TO_DATE('29/03/2024', '%d/%m/%Y'));
INSERT INTO user_login VALUES (1, STR_TO_DATE('30/03/2024', '%d/%m/%Y'));

INSERT INTO user_login VALUES (2, STR_TO_DATE('01/03/2024', '%d/%m/%Y'));
INSERT INTO user_login VALUES (2, STR_TO_DATE('02/03/2024', '%d/%m/%Y'));
INSERT INTO user_login VALUES (2, STR_TO_DATE('03/03/2024', '%d/%m/%Y'));
INSERT INTO user_login VALUES (2, STR_TO_DATE('04/03/2024', '%d/%m/%Y'));

INSERT INTO user_login VALUES (3, STR_TO_DATE('01/03/2024', '%d/%m/%Y'));
INSERT INTO user_login VALUES (3, STR_TO_DATE('02/03/2024', '%d/%m/%Y'));
INSERT INTO user_login VALUES (3, STR_TO_DATE('03/03/2024', '%d/%m/%Y'));
INSERT INTO user_login VALUES (3, STR_TO_DATE('04/03/2024', '%d/%m/%Y'));
INSERT INTO user_login VALUES (3, STR_TO_DATE('04/03/2024', '%d/%m/%Y'));
INSERT INTO user_login VALUES (3, STR_TO_DATE('04/03/2024', '%d/%m/%Y'));
INSERT INTO user_login VALUES (3, STR_TO_DATE('05/03/2024', '%d/%m/%Y'));

INSERT INTO user_login VALUES (4, STR_TO_DATE('01/03/2024', '%d/%m/%Y'));
INSERT INTO user_login VALUES (4, STR_TO_DATE('02/03/2024', '%d/%m/%Y'));
INSERT INTO user_login VALUES (4, STR_TO_DATE('03/03/2024', '%d/%m/%Y'));
INSERT INTO user_login VALUES (4, STR_TO_DATE('04/03/2024', '%d/%m/%Y'));
INSERT INTO user_login VALUES (4, STR_TO_DATE('04/03/2024', '%d/%m/%Y'));

-- Select all records from the table
SELECT * FROM user_login;

with sample_cte as (
select
    distinct
    user_login.user_id,
    user_login.login_date
from
    user_login),
sample_cte2 as (
select
    *,
    day(login_date)-row_number() over (partition by user_id order by login_date) as rn
from
    sample_cte),
sample_cte3 as (
select
    *,
    count(rn) over (partition by rn,user_id) as cnt
from
    sample_cte2)
select
    user_id,
    min(login_date) as start_date,
    max(login_date) as end_date,
    cnt
from
    sample_cte3
where
    cnt >=5
group by user_id,cnt;
