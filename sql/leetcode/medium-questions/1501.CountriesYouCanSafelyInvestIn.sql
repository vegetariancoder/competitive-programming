drop database leetcode;
create database leetcode;
use leetcode;
CREATE TABLE IF NOT EXISTS Person (id int, name varchar(100), phone_number varchar(100));

insert into Person (id, name, phone_number)
values (3,'Jonathan','051-1234567');
insert into Person (id, name, phone_number)
values (12,'Elvis','051-7654321');
insert into Person (id, name, phone_number)
values (1,'Moncef','212-1234567');
insert into Person (id, name, phone_number)
values (2,'Maroua','212-6523651');
insert into Person (id, name, phone_number)
values (7,'Meir','972-1234567');
insert into Person (id, name, phone_number)
values (9,'Rachel','972-0011100');


CREATE TABLE IF NOT EXISTS Country (name varchar(100), country_code int);
insert into Country(name, country_code) VALUES ('Peru',051);
insert into Country(name, country_code) VALUES ('Israel',972);
insert into Country(name, country_code) VALUES ('Morocco',212);
insert into Country(name, country_code) VALUES ('Germany',049);
insert into Country(name, country_code) VALUES ('Ethiopia',251);

CREATE TABLE IF NOT EXISTS Calls (caller_id int, callee_id int, duration int);
insert into Calls(caller_id, callee_id, duration) VALUES (1,9,33);
insert into Calls(caller_id, callee_id, duration) VALUES (2,9,4);
insert into Calls(caller_id, callee_id, duration) VALUES (1,2,59);
insert into Calls(caller_id, callee_id, duration) VALUES (3,12,102);
insert into Calls(caller_id, callee_id, duration) VALUES (3,12,330);
insert into Calls(caller_id, callee_id, duration) VALUES (12,3,5);
insert into Calls(caller_id, callee_id, duration) VALUES (7,9,13);
insert into Calls(caller_id, callee_id, duration) VALUES (7,1,3);
insert into Calls(caller_id, callee_id, duration) VALUES (9,7,1);
insert into Calls(caller_id, callee_id, duration) VALUES (1,7,7);


use leetcode;

select avg(Calls.duration) from Calls;


with id_country as (
select
    Person.id,
    Country.name
from
    Person
right join
    Country
on
    substring(Person.phone_number,1,3) = Country.country_code),
callee as (
select
    id_country.name as id,
    Calls.duration
from
    Calls
inner join
    id_country
on
    Calls.callee_id = id_country.id),
caller as (
select
    id_country.name as id,
    Calls.duration
from
    Calls
inner join
    id_country
on
    Calls.caller_id = id_country.id),
main_cte as (
select
    id,
    duration
from
    callee
union all
select
    id,
    duration
from
    caller),
answer as (
select
    id as country,
    avg(duration) as avg_duration
from
    main_cte
group by
    country)
select
    country
from
    answer
where
    avg_duration > (select avg(Calls.duration) from Calls);
