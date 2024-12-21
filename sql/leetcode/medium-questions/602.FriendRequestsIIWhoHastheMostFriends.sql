use leetcode;

create table RequestAccepted (requester_id int, accepter_id int);
insert into RequestAccepted values (1,2),
                                   (1,3),
                                   (2,3),
                                   (3,4);
with cte as (
select
    requester_id as id
from
    RequestAccepted
union all
select
    RequestAccepted.accepter_id as id
from
    RequestAccepted),
answer as (
select
    id,
    dense_rank() over (order by count(*) desc ) as drnk
from
    cte
group by
    id)
select id from answer where drnk=1;