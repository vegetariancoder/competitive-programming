drop database leetcode;
create database leetcode;
use leetcode;
Create table If Not Exists Contests (contest_id int, gold_medal int , silver_medal int, bronze_medal int);
insert into Contests (contest_id,gold_medal,silver_medal,bronze_medal) value (190,1,5,2);
insert into Contests (contest_id,gold_medal,silver_medal,bronze_medal) value (191,2,3,5);
insert into Contests (contest_id,gold_medal,silver_medal,bronze_medal) value (192,5,2,3);
insert into Contests (contest_id,gold_medal,silver_medal,bronze_medal) value (193,1,3,5);
insert into Contests (contest_id,gold_medal,silver_medal,bronze_medal) value (194,4,5,2);
insert into Contests (contest_id,gold_medal,silver_medal,bronze_medal) value (195,4,2,1);
insert into Contests (contest_id,gold_medal,silver_medal,bronze_medal) value (196,1,5,2);


Create table If Not Exists Users (user_id int, mail varchar(100), name varchar(100));
insert into Users (user_id,mail,name) value (1,'sarah@gmail.com','Sarah');
insert into Users (user_id,mail,name) value (2,'bob@gmail.com','Bob');
insert into Users (user_id,mail,name) value (3,'alice@gmail.com','Alice');
insert into Users (user_id,mail,name) value (4,'hercy@gmail.com','Hercy');
insert into Users (user_id,mail,name) value (5,'quarz@gmail.com','Quarz');

select
    *
from
    Contests;

with cte as (
select
    contest_id,
    gold_medal as user_id,
    1 as type
from
    Contests
union all
select
    contest_id,
    silver_medal as user_id,
    2
from
    Contests
union all
select
    contest_id,
    bronze_medal as user_id,
    3
from
    Contests),
main_cte as (
select
    user_id,
    contest_id,
    row_number() over (partition by user_id order by contest_id) as rn,
    contest_id - row_number() over (partition by user_id order by contest_id) as diff
from
    cte),
all_candidate as (
select
    distinct user_id
from
    main_cte
group by
    user_id,diff
having
    count(diff) >=3
union
select
    user_id
from
    cte
where
    type = 1
group by
    user_id
having
    count(type) >=3)
select
    Users.name,
    Users.mail
from
    all_candidate
left join
    Users
on
    all_candidate.user_id = Users.user_id;

