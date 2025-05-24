use leetcode;

-- Step 1: Create the table
CREATE TABLE Calls (
    caller_id INT,
    recipient_id INT,
    call_time DATETIME
);

-- Step 2: Insert the data
INSERT INTO Calls (caller_id, recipient_id, call_time) VALUES
(8, 4, '2021-08-24 17:46:07'),
(4, 8, '2021-08-24 19:57:13'),
(5, 1, '2021-08-11 05:28:44'),
(8, 3, '2021-08-17 04:04:15'),
(11, 3, '2021-08-17 13:07:00'),
(8, 11, '2021-08-17 22:22:22');

select * from Calls;


with all_calls as (
select
    *
from
    Calls
union all
select
    recipient_id as call_id,
    caller_id,
    call_time
from
    Calls),
first as (
select
    caller_id,
    recipient_id,
    first_value(recipient_id) over (partition by caller_id,DATE_FORMAT(call_time, '%Y-%m-%d') order by call_time asc ) fv,
    call_time
from
    all_calls),
last as (select caller_id,
                recipient_id,
                first_value(recipient_id)
                            over (partition by caller_id,DATE_FORMAT(call_time, '%Y-%m-%d') order by call_time desc ) lv,
                call_time
         from all_calls)
select
    distinct first.caller_id as user_id
from
    first
inner join
    last
on
    first.caller_id = last.caller_id
where
    fv = lv;
