use leetcode;

create table events(
    event varchar(100),
    event_date date
);

insert into events (event, event_date)
values ('fail','2020-01-04');
insert into events (event, event_date)
values ('success','2020-01-01');
insert into events (event, event_date)
values ('success','2020-01-03');
insert into events (event, event_date)
values ('success','2020-01-06');
insert into events (event, event_date)
values ('fail','2020-01-05');
insert into events (event, event_date)
values ('success','2020-01-02');

select * from events;




with answer as (
select
    event,
    event_date,
    row_number() over (partition by events.event order by event_date) as row_num,
    day(event_date)- row_number() over (partition by events.event order by event_date) as day_num
from
    events
order by
    event_date)
select
    event,
    min(event_date) as start_dt,
    max(event_date) as end_dt
from
    answer
group by
    event,day_num;

