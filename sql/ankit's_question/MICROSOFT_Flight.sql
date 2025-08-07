use leetcode;


CREATE TABLE airports (
    port_code VARCHAR(10) PRIMARY KEY,
    city_name VARCHAR(100)
);

CREATE TABLE flights (
    flight_id varchar (10),
    start_port VARCHAR(10),
    end_port VARCHAR(10),
    start_time datetime,
    end_time datetime
);


INSERT INTO airports (port_code, city_name) VALUES
('JFK', 'New York'),
('LGA', 'New York'),
('EWR', 'New York'),
('LAX', 'Los Angeles'),
('ORD', 'Chicago'),
('SFO', 'San Francisco'),
('HND', 'Tokyo'),
('NRT', 'Tokyo'),
('KIX', 'Osaka');


INSERT INTO flights VALUES
(1, 'JFK', 'HND', '2025-06-15 06:00', '2025-06-15 18:00'),
(2, 'JFK', 'LAX', '2025-06-15 07:00', '2025-06-15 10:00'),
(3, 'LAX', 'NRT', '2025-06-15 10:00', '2025-06-15 22:00'),
(4, 'JFK', 'LAX', '2025-06-15 08:00', '2025-06-15 11:00'),
(5, 'LAX', 'KIX', '2025-06-15 11:30', '2025-06-15 22:00'),
(6, 'LGA', 'ORD', '2025-06-15 09:00', '2025-06-15 12:00'),
(7, 'ORD', 'HND', '2025-06-15 11:30', '2025-06-15 23:30'),
(8, 'EWR', 'SFO', '2025-06-15 09:00', '2025-06-15 12:00'),
(9, 'LAX', 'HND', '2025-06-15 13:00', '2025-06-15 23:00'),
(10, 'KIX', 'NRT', '2025-06-15 08:00', '2025-06-15 10:00');

select * from flights;

select * from airports;



with cte as (
select
    *
from
    flights
where
    end_port in ('HND', 'NRT') or start_port in ('JFK')),
answer_1 as (
select
    ct2.start_port as start_city,
    ct2.end_port as middle_city,
    ct1.end_port as end_city,
    concat(ct2.flight_id, ',',ct1.flight_id) as flight_id,
    timestampdiff(minute,ct2.start_time,ct1.end_time) as duration
from
    cte as ct1
inner join
    cte as ct2
where
    ct1.start_port = ct2.end_port and ct2.end_time <= ct1.start_time),
answer_2 as (
select
    start_port as start_city,
    null as middle_city,
    end_port as end_city,
    flight_id,
    timestampdiff(minute,start_time,end_time) as duration
from
    cte
where
    start_port = 'JFK' and end_port in ('HND', 'NRT'))
select * from answer_1 union select * from answer_2;