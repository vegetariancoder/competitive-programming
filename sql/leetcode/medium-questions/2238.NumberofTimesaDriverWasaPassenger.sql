use leetcode;

create table Rides
(
    ride_id   int null,
    driver_id int null,
    passenger_id int null
);

insert into Rides(ride_id, driver_id,passenger_id) values (1,7,1),
                                                            (2,7,2),
                                                          (3,11,1),
                                                          (4,11,7),
                                                          (5,11,7),
                                                          (6,11,3);

select
    *
from
    Rides;


select
    distinct Rides.driver_id,
    ifnull(cnt,0) as cnt
from
    Rides
left join
(select
    passenger_id,
    count(*) as cnt
from
    Rides
where
    passenger_id in (select driver_id from Rides)
group by passenger_id) calc
on
    Rides.driver_id = calc.passenger_id;
