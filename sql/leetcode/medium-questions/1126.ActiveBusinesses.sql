create database if not exists leetcode;
use leetcode;

create table if not exists Events(business_id int,
event_type varchar(100),
occurences int);

insert into Events(business_id, event_type, occurences) VALUES (1,'reviews',7 );
insert into Events(business_id, event_type, occurences) VALUES (3,'reviews',3 );
insert into Events(business_id, event_type, occurences) VALUES (1,'ads',11 );
insert into Events(business_id, event_type, occurences) VALUES (2,'ads',7 );
insert into Events(business_id, event_type, occurences) VALUES (3,'ads',6 );
insert into Events(business_id, event_type, occurences) VALUES (1,'page reviews',3 );
insert into Events(business_id, event_type, occurences) VALUES (2,'page reviews',12 );

select
    *
from
    Events;

with cte as (
select
    *,
    round(sum(occurences) over (partition by event_type)/count(occurences) over (partition by event_type),1) as avg_act
from
    Events)
select
    business_id
from
    cte
group by
    business_id
having
    sum(if(occurences>avg_act,1,0)) > 1;