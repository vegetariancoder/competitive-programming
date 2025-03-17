drop database leetcode;
create database leetcode;
use leetcode;
create table If Not Exists Genders (user_id int, gender varchar(100));
insert into Genders (user_id,gender) values (4,'male');
insert into Genders (user_id,gender) values (7,'female');
insert into Genders (user_id,gender) values (2,'other');
insert into Genders (user_id,gender) values (5,'male');
insert into Genders (user_id,gender) values (3,'female');
insert into Genders (user_id,gender) values (8,'male');
insert into Genders (user_id,gender) values (6,'other');
insert into Genders (user_id,gender) values (1,'other');
insert into Genders (user_id,gender) values (9,'female');


select * from Genders;

with answer as (
select
    *,
    rank() over (partition by gender order by user_id) as rnk,
    case
        when gender = 'female' then 0
        when gender = 'other' then 1
    else 2 end as rnk2
from
    Genders)
select
    user_id,
    gender
from
    answer
order by rnk,rnk2;