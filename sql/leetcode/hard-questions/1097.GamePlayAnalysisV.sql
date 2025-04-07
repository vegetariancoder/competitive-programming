drop database leetcode;
create database leetcode;
use leetcode;
CREATE TABLE IF NOT EXISTS Activity (player_id int, device_id  int, event_date date, games_played int);
insert into Activity (player_id, device_id, event_date,games_played) values (1,2,'2016-03-01',5);
insert into Activity (player_id, device_id, event_date,games_played) values (1,2,'2016-03-02',6);
insert into Activity (player_id, device_id, event_date,games_played) values (2,3,'2017-06-25',1);
insert into Activity (player_id, device_id, event_date,games_played) values (3,1,'2016-03-01',0);
insert into Activity (player_id, device_id, event_date,games_played) values (3,4,'2016-07-03',5);


select * from Activity;
with install_date_cte as (
select
    player_id,
    min(event_date) as install_date
from
    Activity
group by player_id),
answer as (
select
    Activity.*,
    install_date_cte.install_date,
    if(datediff(event_date,install_date)=1,1,0) as checking
from
    Activity
inner join
    install_date_cte
on
    Activity.player_id = install_date_cte.player_id)
select
    install_date,
    count(distinct player_id) as installs,
    round(sum(checking)/count(distinct player_id),2) as Day1_retention
from
    answer
group by
    install_date;