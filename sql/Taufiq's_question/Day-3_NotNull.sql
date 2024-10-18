use leetcode;

DROP TABLE IF EXISTS FOOTER;
CREATE TABLE FOOTER
(
	id 			INT PRIMARY KEY,
	car 		VARCHAR(20),
	length 		INT,
	width 		INT,
	height 		INT
);

INSERT INTO FOOTER VALUES (1, 'Hyundai Tucson', 15, 6, NULL);
INSERT INTO FOOTER VALUES (2, NULL, NULL, NULL, 20);
INSERT INTO FOOTER VALUES (3, NULL, 12, 8, 15);
INSERT INTO FOOTER VALUES (4, 'Toyota Rav4', NULL, 15, NULL);
INSERT INTO FOOTER VALUES (5, 'Kia Sportage', NULL, NULL, 18);

SELECT * FROM FOOTER;


with cte as (
select
    *,
    sum(case
        when car is not null then 1 else 0
    end) over (order by id) car_test,
    sum(case
        when length is not null then 1 else 0
    end) over (order by id) length_test,
    sum(case
        when width is not null then 1 else 0
    end) over (order by id) width_test,
    sum(case
        when FOOTER.height is not null then 1 else 0
    end) over (order by id) height_test
from
    FOOTER)
select
    first_value(car) over (partition by car_test order by id) as length,
    first_value(length) over (partition by length_test order by id) as length,
    first_value(width) over (partition by width_test order by id) as width,
    first_value(height) over (partition by height_test order by id) as height
from
    cte
order by id desc limit 1;


# solution 2
with car as (
select
    car
from
    FOOTER
where
    car is not null
order by id desc limit 1)
, length as (
select
    length
from
    FOOTER
where
    length is not null
order by id desc limit 1)
, width as (
select
    width
from
    FOOTER
where
    width is not null
order by id desc limit 1)
, height as (
select
    height
from
    FOOTER
where
    height is not null
order by id desc limit 1)
select
    *
from
    car
cross join
    length
cross join
    width
cross join
    height;


