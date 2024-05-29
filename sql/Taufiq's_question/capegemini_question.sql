create table lifts
(
      id         	  int
    , capacity_kg     int
);

insert into lifts values (1, 300);
insert into lifts values (2, 350);

create table lift_passengers
(
      passenger_name    varchar(50)
    , weight_kg     	int
	, lift_id			int
);

insert into lift_passengers values ('Rahul', 85, 1);
insert into lift_passengers values ('Adarsh', 73, 1);
insert into lift_passengers values ('Riti', 95, 1);
insert into lift_passengers values ('Dheeraj', 80, 1);
insert into lift_passengers values ('Vimal', 83, 2);
insert into lift_passengers values ('Neha', 77, 2);
insert into lift_passengers values ('Priti', 73, 2);
insert into lift_passengers values ('Himanshi', 85, 2);

select
    *
from
    lift_passengers;


select
    *
from
    lifts;

with cte as (
select
    lift_passengers.passenger_name,
    lift_passengers.weight_kg,
    lift_passengers.lift_id,
    sum(weight_kg) over (partition by lift_id order by weight_kg) as running_sm,
    capacity_kg
from
    lift_passengers
left join
    lifts
on
    lift_passengers.lift_id = lifts.id),
cte2 as (
select
    *,
    if(running_sm < capacity_kg,'Yes','No') as qlfd
from
    cte)
select
    lift_id,
    group_concat(passenger_name) as passengers
from
    cte2
where
    qlfd = 'Yes'
group by
    lift_id;
