use leetcode;

create table numbers (n int);
insert into numbers values (1),(2),(3),(4),(5);

select
    *
from
    numbers;


with recursive cte as (
select
    n,
    1 as counter
from
    numbers
union all
select
    n,
    counter+1
from
    cte
where
    counter<n)
SELECT n
FROM cte
ORDER BY n, counter;


WITH RECURSIVE numbers_cte AS (
    -- Anchor member: select all numbers from the original table
    SELECT n, 1 AS counter
    FROM numbers
    -- Recursive member: increment the counter and repeat the value
    UNION ALL
    SELECT n, counter + 1
    FROM numbers_cte
    WHERE counter < n
)
-- Final output: select the values from the CTE
SELECT n
FROM numbers_cte
ORDER BY n, counter;
