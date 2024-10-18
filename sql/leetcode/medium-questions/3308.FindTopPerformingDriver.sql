use leetcode;

-- Drop tables if they exist to avoid errors
DROP TABLE IF EXISTS Trips;
DROP TABLE IF EXISTS Vehicles;
DROP TABLE IF EXISTS Drivers;

-- Create Drivers table
CREATE TABLE Drivers (
    driver_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    experience INT,
    accidents INT
);

-- Insert data into Drivers table
INSERT INTO Drivers VALUES (1, 'Alice', 34, 10, 1);
INSERT INTO Drivers VALUES (2, 'Bob', 45, 20, 3);
INSERT INTO Drivers VALUES (3, 'Charlie', 28, 5, 0);

-- Create Vehicles table
CREATE TABLE Vehicles (
    vehicle_id INT PRIMARY KEY,
    driver_id INT,
    model VARCHAR(50),
    fuel_type VARCHAR(20),
    mileage INT,
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id)
);

-- Insert data into Vehicles table
INSERT INTO Vehicles VALUES (100, 1, 'Sedan', 'Gasoline', 20000);
INSERT INTO Vehicles VALUES (101, 2, 'SUV', 'Electric', 30000);
INSERT INTO Vehicles VALUES (102, 3, 'Coupe', 'Gasoline', 15000);

-- Create Trips table
CREATE TABLE Trips (
    trip_id INT PRIMARY KEY,
    vehicle_id INT,
    distance INT,
    duration INT,
    rating INT,
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id)
);

-- Insert data into Trips table
INSERT INTO Trips VALUES (201, 100, 50, 30, 5);
INSERT INTO Trips VALUES (202, 100, 30, 20, 4);
INSERT INTO Trips VALUES (203, 101, 100, 60, 4);
INSERT INTO Trips VALUES (204, 101, 80, 50, 5);
INSERT INTO Trips VALUES (205, 102, 40, 30, 5);
INSERT INTO Trips VALUES (206, 102, 60, 40, 5);


with cte as (
select
    Drivers.driver_id,
    fuel_type,
    round(avg(rating),2) as rating,
    sum(distance) as distance,
    sum(accidents) as accident_count
from
    Trips
inner join
    Vehicles
on
    Trips.vehicle_id = Vehicles.vehicle_id
inner join
    Drivers on Vehicles.driver_id = Drivers.driver_id
group by Drivers.driver_id, fuel_type),
answer as (
select
    *,
    dense_rank() over (partition by fuel_type order by rating desc,distance desc , accident_count ) as drnk
from
    cte)
select
    fuel_type,
    driver_id,
    rating,
    distance
from
    answer
where
    drnk=1;