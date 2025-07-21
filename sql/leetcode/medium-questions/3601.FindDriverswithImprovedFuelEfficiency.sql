use leetcode;

CREATE TABLE drivers (
    driver_id INT,
    driver_name VARCHAR(255)
)
CREATE TABLE trips (
    trip_id INT,
    driver_id INT,
    trip_date DATE,
    distance_km DECIMAL(8, 2),
    fuel_consumed DECIMAL(6, 2)
)
Truncate table drivers
insert into drivers (driver_id, driver_name) values ('1', 'Alice Johnson')
insert into drivers (driver_id, driver_name) values ('2', 'Bob Smith')
insert into drivers (driver_id, driver_name) values ('3', 'Carol Davis')
insert into drivers (driver_id, driver_name) values ('4', 'David Wilson')
insert into drivers (driver_id, driver_name) values ('5', 'Emma Brown')
Truncate table trips
insert into trips (trip_id, driver_id, trip_date, distance_km, fuel_consumed) values ('1', '1', '2023-02-15', '120.5', '10.2')
insert into trips (trip_id, driver_id, trip_date, distance_km, fuel_consumed) values ('2', '1', '2023-03-20', '200.0', '16.5')
insert into trips (trip_id, driver_id, trip_date, distance_km, fuel_consumed) values ('3', '1', '2023-08-10', '150.0', '11.0')
insert into trips (trip_id, driver_id, trip_date, distance_km, fuel_consumed) values ('4', '1', '2023-09-25', '180.0', '12.5')
insert into trips (trip_id, driver_id, trip_date, distance_km, fuel_consumed) values ('5', '2', '2023-01-10', '100.0', '9.0')
insert into trips (trip_id, driver_id, trip_date, distance_km, fuel_consumed) values ('6', '2', '2023-04-15', '250.0', '22.0')
insert into trips (trip_id, driver_id, trip_date, distance_km, fuel_consumed) values ('7', '2', '2023-10-05', '200.0', '15.0')
insert into trips (trip_id, driver_id, trip_date, distance_km, fuel_consumed) values ('8', '3', '2023-03-12', '80.0', '8.5')
insert into trips (trip_id, driver_id, trip_date, distance_km, fuel_consumed) values ('9', '3', '2023-05-18', '90.0', '9.2')
insert into trips (trip_id, driver_id, trip_date, distance_km, fuel_consumed) values ('10', '4', '2023-07-22', '160.0', '12.8')
insert into trips (trip_id, driver_id, trip_date, distance_km, fuel_consumed) values ('11', '4', '2023-11-30', '140.0', '11.0')
insert into trips (trip_id, driver_id, trip_date, distance_km, fuel_consumed) values ('12', '5', '2023-02-28', '110.0', '11.5')

select * from trips;


with cte as (
select
    *,
    distance_km/fuel_consumed as fuelefficiency,
    if(month(trip_date) in (1,2,3,4,5,6),1,2) as half
from
    trips),
first_half as (
select
    driver_id,
    round(avg(fuelefficiency),2) as first_half_avg
from
    cte
where
    half=1
group by driver_id,half),
second_half as (
    select
    driver_id,
    round(avg(fuelefficiency),2) as second_half_avg
from
    cte
where
    half=2
group by driver_id,half
),
main_cte as (
select
    first_half.driver_id,
    first_half_avg,
    second_half_avg,
    round(second_half_avg-first_half_avg,2) as efficiency_improvement
from
    first_half
inner join
    second_half
on
    first_half.driver_id = second_half.driver_id)
select
    main_cte.driver_id,
    drivers.driver_name,
    main_cte.first_half_avg,
    main_cte.second_half_avg,
    main_cte.efficiency_improvement
from
    main_cte
inner join
    drivers
on
    main_cte.driver_id = drivers.driver_id
order by
    efficiency_improvement desc;
