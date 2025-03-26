drop database leetcode;
create database leetcode;
use leetcode;


-- Create the Calls table
CREATE TABLE Calls (
    caller_id INT,
    recipient_id INT,
    call_time DATETIME,
    city VARCHAR(255)
);

-- Insert data into the Calls table
INSERT INTO Calls (caller_id, recipient_id, call_time, city) VALUES
(8, 4, '2021-08-24 22:46:07', 'Houston'),
(4, 8, '2021-08-24 22:57:13', 'Houston'),
(5, 1, '2021-08-11 21:28:44', 'Houston'),
(8, 3, '2021-08-17 22:04:15', 'Houston'),
(11, 3, '2021-08-17 13:07:00', 'New York'),
(8, 11, '2021-08-17 14:22:22', 'New York');

-- Optional: Verify the data insertion
SELECT * FROM Calls;

with answer as (
select
    city,
    hour(call_time) as peak_calling_hour,
    count(*) as number_of_calls,
    dense_rank() over (partition by city order by count(*) desc ) as drnk
from
    Calls
group by city, peak_calling_hour)
select
    city,
    peak_calling_hour,
    number_of_calls
from
    answer
where
    drnk = 1;