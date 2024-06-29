drop database leetcode;
create database leetcode;
use leetcode;
Create table If Not Exists Players (player_id int, player_name varchar(100));
insert into Players (player_id,player_name) value (1,'Nadal');
insert into Players (player_id,player_name) value (2,'Federer');
insert into Players (player_id,player_name) value (3,'Novak');

select * from Players;
Create table If Not Exists Championships (year int, Wimbledon int, Fr_open int, US_open int, Au_open int);
insert into Championships (year,Wimbledon,Fr_open,US_open,Au_open) value (2018,1,1,1,1);
insert into Championships (year,Wimbledon,Fr_open,US_open,Au_open) value (2019,1,1,2,2);
insert into Championships (year,Wimbledon,Fr_open,US_open,Au_open) value (2020,2,1,2,2);


select * from Championships;

with championship_title as (
select
    Wimbledon as player_id,
    count(*) as cnt_value
from
    Championships
group by Wimbledon
union all
select
    Fr_open as player_id,
    count(*) as cnt_value
from
    Championships
group by Fr_open
union all
select
    US_open as player_id,
    count(*) as cnt_value
from
    Championships
group by US_open
union all
select
    Au_open as player_id,
    count(*) as cnt_value
from
    Championships
group by Au_open)
select
    championship_title.player_id,
    Players.player_name,
    sum(cnt_value) as grand_slams_count
from
    championship_title
left join
    Players
on
    championship_title.player_id = Players.player_id
group by
    player_id,player_name;
