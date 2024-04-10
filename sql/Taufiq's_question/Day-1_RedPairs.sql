DROP TABLE IF EXISTS brands;
CREATE TABLE brands
(
    brand1      VARCHAR(20),
    brand2      VARCHAR(20),
    year        INT,
    custom1     INT,
    custom2     INT,
    custom3     INT,
    custom4     INT
);
INSERT INTO brands VALUES ('apple', 'samsung', 2020, 1, 2, 1, 2);
INSERT INTO brands VALUES ('samsung', 'apple', 2020, 1, 2, 1, 2);
INSERT INTO brands VALUES ('apple', 'samsung', 2021, 1, 2, 5, 3);
INSERT INTO brands VALUES ('samsung', 'apple', 2021, 5, 3, 1, 2);
INSERT INTO brands VALUES ('google', NULL, 2020, 5, 9, NULL, NULL);
INSERT INTO brands VALUES ('oneplus', 'nothing', 2020, 5, 9, 6, 3);

SELECT * FROM brands;

select
    *
from
    brands;

with answer as (
select
    *,
    row_number() over (partition by case when brand1 > brand2 then concat(brand1,brand2,year) else concat(brand2,brand1,year) end order by year) as rno
from
    brands)
select
    *
from
    answer
where
    rno = 1 or (custom1 <> custom3 or custom2 <> custom4);


