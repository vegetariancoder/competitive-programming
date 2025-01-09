use leetcode;


create table Calls
(
    from_id int null,
    to_id        int null,
    duration     int null
);

insert into Calls (from_id,to_id,duration) values (1,2,59),
                                                  (2,1,11),
                                                  (1,3,20),
                                                  (3,4,100),
                                                  (3,4,200),
                                                  (3,4,200),
                                                  (4,3,499);


select * from Calls;


with cte as (
select
    from_id,
    to_id,
    duration
from
    Calls
union all
select
    to_id,
    from_id,
    duration
from
    Calls),
answer as (
select
    from_id,
    to_id,
    count(*) as cnt,
    sum(duration) as sm

from
    cte
group by from_id, to_id)
select
    *
from
    answer;


SELECT
    IF(from_id < to_id, from_id, to_id) AS person1,
    IF(from_id < to_id, to_id, from_id) AS person2,
    count(*) as call_count,
    sum(duration) as total_duration
FROM Calls
group by
    person1,person2

