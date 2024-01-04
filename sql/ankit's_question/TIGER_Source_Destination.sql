drop database online;
create database online;
use online;



CREATE TABLE flights
(
    cid VARCHAR(512),
    fid VARCHAR(512),
    origin VARCHAR(512),
    Destination VARCHAR(512)
);

INSERT INTO flights (cid, fid, origin, Destination) VALUES ('1', 'f1', 'Del', 'Hyd');
INSERT INTO flights (cid, fid, origin, Destination) VALUES ('1', 'f2', 'Hyd', 'Blr');
INSERT INTO flights (cid, fid, origin, Destination) VALUES ('2', 'f3', 'Mum', 'Agra');
INSERT INTO flights (cid, fid, origin, Destination) VALUES ('2', 'f4', 'Agra', 'Kol');

select * from flights;


# Approach-1
select
    f1.cid,
    f1.origin as origin,
    f2.Destination as destination
from
    flights f1
inner join
    flights f2
on
    f1.Destination = f2.origin;


# Approach-2
with answer as (
select
    *,
    lead(origin) over (partition by cid) as next_origin,
    lead(Destination) over (partition by cid) as next_destination
from
    flights)
select
    cid,
    origin,
    next_destination as destination
from
    answer
where
    Destination = next_origin;



