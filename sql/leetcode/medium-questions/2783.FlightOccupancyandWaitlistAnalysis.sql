drop database leetcode;
create database leetcode;
use leetcode;


-- Create Flights table
CREATE TABLE Flights (
  flight_id INT PRIMARY KEY,
  capacity INT
);

-- Insert data into Flights table
INSERT INTO Flights (flight_id, capacity)
VALUES
  (1, 2),
  (2, 2),
  (3, 1);

-- Create Passengers table
CREATE TABLE Passengers (
  passenger_id INT PRIMARY KEY,
  flight_id INT,
  FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

-- Insert data into Passengers table
INSERT INTO Passengers (passenger_id, flight_id)
VALUES
  (101, 1),
  (102, 1),
  (103, 1),
  (104, 2),
  (105, 2),
  (106, 3),
  (107, 3);


select
    *
from
    Passengers;


with flight_cte as (
select
    flight_id as f_id,
    count(flight_id) over (partition by flight_id) as cnt
from
    Passengers)
select
    distinct flight_cte.f_id,
    capacity as booked_cnt,
    cnt-Flights.capacity as waitlist_cnt
from
    flight_cte
right join
    Flights
on
    flight_cte.f_id = Flights.flight_id;