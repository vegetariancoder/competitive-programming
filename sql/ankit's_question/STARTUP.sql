use leetcode;


create table events
(userid int ,
event_type varchar(20),
event_time datetime);

insert into events VALUES (1, 'click', '2023-09-10 09:00:00');
insert into events VALUES (1, 'click', '2023-09-10 10:00:00');
insert into events VALUES (1, 'scroll', '2023-09-10 10:20:00');
insert into events VALUES (1, 'click', '2023-09-10 10:50:00');
insert into events VALUES (1, 'scroll', '2023-09-10 11:40:00');
insert into events VALUES (1, 'click', '2023-09-10 12:40:00');
insert into events VALUES (1, 'scroll', '2023-09-10 12:50:00');
insert into events VALUES (2, 'click', '2023-09-10 09:00:00');
insert into events VALUES (2, 'scroll', '2023-09-10 09:20:00');
insert into events VALUES (2, 'click', '2023-09-10 10:30:00');

select * from events;

with sample_cte as (
select
    *,
    ifnull(timestampdiff(minute,lag(event_time) over (partition by userid order by event_time),event_time),0) as diff
from
    events),
answer as (
select
    *,
    sum(if(diff>30,1,0)) over (partition by userid order by event_time) as session_id
from
    sample_cte)
select
    userid,
    session_id,
    min(event_time) as session_start_time,
    max(event_time) as session_end_time,
    timestampdiff(minute,min(event_time),max(event_time)) as session_duration,
    count(*) as event_count
from
    answer
group by
    userid,session_id;

