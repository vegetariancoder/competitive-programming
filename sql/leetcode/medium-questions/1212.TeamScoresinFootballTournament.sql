use leetcode;

SET GLOBAL time_zone = '+3:00';

CREATE TABLE IF NOT EXISTS Teams (
team_id INT,
team_name varchar(100));

insert into Teams (team_id,team_name) values (10,'Leetcode FC'),
(20,'NewYork FC'),
(30,'Atlanta FC'),
(40,'Chicago FC'),
(50,'Toronto FC');


CREATE TABLE IF NOT EXISTS MatchesTable (
match_id INT,
host_team int,
guest_team int,
host_goals int,
guest_goals int);


insert into MatchesTable (match_id,host_team,guest_team,host_goals,guest_goals) values (1,10,20,3,0),
(2,30,10,2,2),
(3,10,50,5,1),
(4,20,30,1,0),
(5,50,30,1,0);



with scores as (
select
    *,
    if(host_goals>guest_goals,3,0) as host_winner,
    if(host_goals<guest_goals,3,0) as guest_winner,
    if(host_goals=guest_goals,1,0) as draw_winner
from
    MatchesTable),
host_winner as (
select
    host_team,
    sum(host_winner) as host_winner
from
    scores
group by host_team),
guest_winner as (
select
    guest_team,
    sum(guest_winner) as guest_winner
from
    scores
group by guest_team),
host_draw as (
select
    host_team,
    sum(IF(draw_winner = 1, 1, 0)) as host_draw
from
    scores
group by host_team),
guest_draw as (
select
    guest_team,
    sum(IF(draw_winner = 1, 1, 0)) as guest_draw
from
    scores
group by guest_team),
final as (
select
    host_winner.host_team,
    host_winner + guest_winner+host_draw+guest_draw as total
from
    host_winner
inner join
    guest_winner
on
    host_winner.host_team = guest_winner.guest_team
inner join
    host_draw
on
    host_winner.host_team = host_draw.host_team
inner join
    guest_draw
on
    host_winner.host_team = guest_draw.guest_team)
select
    distinct
    Teams.team_id,
    Teams.team_name,
    ifnull(final.total,0) as num_points
from
    final
right join
    Teams
on
    final.host_team = Teams.team_id;
