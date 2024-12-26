use leetcode;

create table Queue
(
    person_id   int          null,
    person_name varchar(100) null,
    weight      int          null,
    turn        int          null
);

insert into Queue(person_id, person_name, weight, turn) values (5,'Alice',250,1),
                                                               (4,'Bob',175,5),
                                                               (3,'Alex' ,350,2),
                                                               (6,'John Cena',400,3),
                                                               (1,'Winston' ,500,6),
                                                               (2,'Marie',200,4);

select * from Queue;


with answer as (
select
    *,
    sum(weight) over (order by turn) as total_weight,
    if(sum(weight) over (order by turn)<=1000,'Yes','No') as allowed
from
    Queue)
select
    person_name
from
    answer
where
    allowed = 'Yes'
order by
    turn desc
limit 1;