use leetcode;

CREATE TABLE Data (
first_col int,
second_col varchar(100)
);

INSERT into Data values (4,2),
                        (2,3),
                        (3,1),
                        (1,4);


select
    *
from
    Data;

with cte_1 as (
select
    first_col,
    dense_rank() over (order by first_col) as drnk_fc
from
    Data),
cte_2 as (
select
    second_col,
    dense_rank() over (order by second_col desc ) as drnk_sc
from
    Data)
select
    cte_1.first_col,
    cte_2.second_col
from
    cte_1
inner join
    cte_2
on
    cte_1.drnk_fc = cte_2.drnk_sc;

