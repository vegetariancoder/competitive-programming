USE leetcode;
CREATE TABLE Buses (
  bus_id int,
  arrival_time int
);

INSERT INTO Buses
  (bus_id, arrival_time)
VALUES
  (1,2),
  (2,4),
  (3,7);


CREATE TABLE Passengers (
  passenger_id int,
  arrival_time int
);

INSERT INTO Passengers
  (passenger_id, arrival_time)
VALUES
  (11,1),
  (12,5),
  (13,6),
  (14,7);


with buses_vals as (
select
    bus_id as b_id,
    ifnull(lag(B.arrival_time) over (order by B.arrival_time),1) as prev_value,
    B.arrival_time as arr_time
from
    Buses B)
select
    b_id as bus_id,
    sum(if(Passengers.arrival_time between buses_vals.prev_value and buses_vals.arr_time,1,0)) as passengers_cnt
from buses_vals,Passengers
group by
    b_id;

