use leetcode;



CREATE TABLE IF NOT EXISTS Activity (player_id int, device_id int, event_date date, games_played int);
insert into Activity (player_id, device_id,event_date,games_played) values (1,2,'2016-03-01',5);
insert into Activity (player_id, device_id,event_date,games_played) values (1,2,'2016-03-02',6);
insert into Activity (player_id, device_id,event_date,games_played) values (2,3,'2017-06-25',1);
insert into Activity (player_id, device_id,event_date,games_played) values (3,1,'2016-03-02',0);
insert into Activity (player_id, device_id,event_date,games_played) values (3,4,'2018-07-03',5);

select
    *
from
    Activity;

with answer as (
select
    *,
    datediff(lead(event_date) over (partition by player_id order by event_date),event_date) as diff
from
    Activity)
select
    round(count(player_id) / (select count(distinct player_id) from Activity),2) as fraction
from
    answer
where
    diff = 1;