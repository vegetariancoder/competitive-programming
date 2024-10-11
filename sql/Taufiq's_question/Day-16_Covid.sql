-- Given table contains reported covid cases in 2020.
-- Calculate the percentage increase in covid cases each month versus cumulative cases as of the prior month.
-- Return the month number, and the percentage increase rounded to one decimal. Order the result by the month.

drop table if exists covid_cases;
CREATE TABLE covid_cases (
    cases_reported INT,
    dates DATE
);

INSERT INTO covid_cases VALUES (20124, STR_TO_DATE('10/01/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (40133, STR_TO_DATE('15/01/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (65005, STR_TO_DATE('20/01/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (30005, STR_TO_DATE('08/02/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (35015, STR_TO_DATE('19/02/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (15015, STR_TO_DATE('03/03/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (35035, STR_TO_DATE('10/03/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (49099, STR_TO_DATE('14/03/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (84045, STR_TO_DATE('20/03/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (100106, STR_TO_DATE('31/03/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (17015, STR_TO_DATE('04/04/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (36035, STR_TO_DATE('11/04/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (50099, STR_TO_DATE('13/04/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (87045, STR_TO_DATE('22/04/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (101101, STR_TO_DATE('30/04/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (40015, STR_TO_DATE('01/05/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (54035, STR_TO_DATE('09/05/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (71099, STR_TO_DATE('14/05/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (82045, STR_TO_DATE('21/05/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (90103, STR_TO_DATE('25/05/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (99103, STR_TO_DATE('31/05/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (11015, STR_TO_DATE('03/06/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (28035, STR_TO_DATE('10/06/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (38099, STR_TO_DATE('14/06/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (45045, STR_TO_DATE('20/06/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (36033, STR_TO_DATE('09/07/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (40011, STR_TO_DATE('23/07/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (25001, STR_TO_DATE('12/08/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (29990, STR_TO_DATE('26/08/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (20112, STR_TO_DATE('04/09/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (43991, STR_TO_DATE('18/09/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (51002, STR_TO_DATE('29/09/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (26587, STR_TO_DATE('25/10/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (11000, STR_TO_DATE('07/11/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (35002, STR_TO_DATE('16/11/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (56010, STR_TO_DATE('28/11/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (15099, STR_TO_DATE('02/12/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (38042, STR_TO_DATE('11/12/2020', '%d/%m/%Y'));
INSERT INTO covid_cases VALUES (73030, STR_TO_DATE('26/12/2020', '%d/%m/%Y'));




select * from covid_cases;

with cte as (
select
    month(dates) as monthvalue,
    sum(cases_reported) as total_cases
from
    covid_cases
group by monthvalue),
cte2 as (
select
    *,
    sum(total_cases) over (order by monthvalue) as sm_over
from
    cte)
select
    monthvalue,
    round(ifnull(total_cases/lag(sm_over) over (order by monthvalue),'-')*100,1) as percentage_increase
from
    cte2;

