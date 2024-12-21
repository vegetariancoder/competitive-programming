drop database leetcode;
create database leetcode;
use leetcode;
Create table If Not Exists Employee (followee varchar(100), follower varchar(100));
insert into Employee (followee,follower) value ('Alice','Bob');
insert into Employee (followee,follower) value ('Bob','Cena');
insert into Employee (followee,follower) value ('Bob','Donald');
insert into Employee (followee,follower) value ('Donald','Edward');

select
    *
from
    Employee;

with followee_cnt as (
select
    Employee.followee,
    count(*)
from
    Employee
group by
    followee),
follower_cnt as (
select
    Employee.follower,
    count(*)
from
    Employee
group by
    follower)
select
    distinct
    follower as follower
from
    followee_cnt
inner join
    follower_cnt
on
    followee_cnt.followee = follower_cnt.follower;