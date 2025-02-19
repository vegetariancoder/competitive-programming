use leetcode;

drop table Flights;
-- Create the Flights table
CREATE TABLE Flights (
    departure_airport INT,
    arrival_airport INT,
    flights_count INT
);

-- Insert data into the Flights table
INSERT INTO Flights (departure_airport, arrival_airport, flights_count)
VALUES
    (1, 2, 4),
    (2, 1, 5),
    (3, 4, 5),
    (4, 3, 4),
    (5, 6, 7);

select * from Flights;


with cte as (
select
    departure_airport as airport,
    flights_count
from
    Flights
union all
select
    arrival_airport,
    flights_count
from
    Flights),
answer as (
select
    airport,
    dense_rank() over (order by sum(flights_count) desc ) as drnk
from
    cte
group by airport)
select
    airport
from
    answer
where
    drnk=1
