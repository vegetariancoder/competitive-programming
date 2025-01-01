drop database leetcode;
create database leetcode;
use leetcode;
SET GLOBAL time_zone = '+3:00';

create table Accounts(
    id int,
    name varchar(100)
);

create table Logins(
    id int,
    logins date
);


insert into Accounts values (1,'Winston'),
                            (7,'Jonathan');

insert into Logins
values (7,'2020-05-30'),
       (1,'2020-05-30'),
       (7,'2020-05-31'),
       (7,'2020-06-01'),
       (7,'2020-06-02'),
       (7,'2020-06-03'),
       (1,'2020-06-07'),
       (7,'2020-06-10');

with cte as (
select
    *,
    row_number() over (partition by id order by logins) as rn
from
    Logins
order by logins, id),
answer as (
select
    id
from
    cte
group by id, date_sub(logins,interval rn day )
having
    count(*) >=5)
select
    *
from
    Accounts
where
    id in (select id from answer);

