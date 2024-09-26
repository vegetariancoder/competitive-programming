use leetcode;

drop table if exists auto_repair;
create table auto_repair
(
	client			varchar(20),
	auto			varchar(20),
	repair_date		int,
	indicator		varchar(20),
	value			varchar(20)
);
insert into auto_repair values('c1','a1',2022,'level','good');
insert into auto_repair values('c1','a1',2022,'velocity','90');
insert into auto_repair values('c1','a1',2023,'level','regular');
insert into auto_repair values('c1','a1',2023,'velocity','80');
insert into auto_repair values('c1','a1',2024,'level','wrong');
insert into auto_repair values('c1','a1',2024,'velocity','70');
insert into auto_repair values('c2','a1',2022,'level','good');
insert into auto_repair values('c2','a1',2022,'velocity','90');
insert into auto_repair values('c2','a1',2023,'level','wrong');
insert into auto_repair values('c2','a1',2023,'velocity','50');
insert into auto_repair values('c2','a2',2024,'level','good');
insert into auto_repair values('c2','a2',2024,'velocity','80');

select
    *
from
    auto_repair;

with cte_1 as (
select
    *,
    lead(value) over (partition by repair_date) as velocity
from
    auto_repair),
cte_2 as (
select
    value,
    velocity,
    count(*) as cnt
from
    cte_1
where
    velocity REGEXP '^[0-9]+$'
group by
    value, velocity),
cte_3 as (
select
    *,
    case
        when value = 'good' and velocity = 90 then cnt else 0
    end as good_1,
    case
        when value = 'good' and velocity = 80 then cnt else 0
    end as good_2,
    case
        when value = 'good' and velocity = 70 then cnt else 0
    end as good_3,
    case
        when value = 'good' and velocity = 50 then cnt else 0
    end as good_4,
    case
        when value = 'wrong' and velocity = 50 then cnt else 0
    end as wrong_1,
    case
        when value = 'wrong' and velocity = 70 then cnt else 0
    end as wrong_2,
    case
        when value = 'regular' and velocity = 80 then cnt else 0
    end as regular
from
    cte_2)
select
    velocity,
    sum(good_1+good_2+good_3+good_4) as good,
    sum(wrong_1+wrong_2) as wrong,
    sum(regular) as regular
from
    cte_3
group by
    velocity
order by
    velocity;
