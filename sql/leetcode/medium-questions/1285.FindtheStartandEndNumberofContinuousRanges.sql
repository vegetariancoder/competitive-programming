drop database leetcode;
create database leetcode;
use leetcode;

CREATE TABLE IF NOT EXISTS Logs (
    log_id INT);

insert into Logs (log_id) values (1);
insert into Logs (log_id) values (2);
insert into Logs (log_id) values (3);
insert into Logs (log_id) values (7);
insert into Logs (log_id) values (8);
insert into Logs (log_id) values (10);

select * from Logs;

with answer as (
select
    *,
    log_id-row_number() over (order by (select null)) as cluster
from
    Logs)
select
    min(log_id) as start_id,
    max(log_id) as end_id
from
    answer
group by
    cluster;