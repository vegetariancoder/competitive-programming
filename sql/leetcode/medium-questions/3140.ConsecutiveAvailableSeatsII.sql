use leetcode;

-- Create the Cinema table
CREATE TABLE Cinema (
    seat_id INT,
    free INT
);

-- Insert data into the Cinema table
INSERT INTO Cinema (seat_id, free) VALUES
(1, 1),
(2, 0),
(3, 1),
(4, 1),
(5, 1);

-- Optional: Verify the data insertion
SELECT * FROM Cinema;


with cte as (
select
    *,
    dense_rank() over (order by seat_id) as drnk,
    seat_id-dense_rank() over (order by seat_id) as diff
from
    Cinema
where
    free =1),
answer as (
select
    *,
    first_value(seat_id) over (partition by diff) as fv,
    last_value(seat_id) over (partition by diff) as lv
from
    cte)
select
    fv as first_seat_id,
    lv as last_seat_id,
    count(*) as consecutive_seats_len
from
    answer
group by
    fv, lv
order by
    consecutive_seats_len desc
limit 1;