drop database leetcode;
create database leetcode;
use leetcode;
CREATE TABLE IF NOT EXISTS Teams (
team_id INT,
team_name varchar(100));

insert into Teams (team_id,team_name) values (1,'Ajax'),
                                             (4,'Dortmund'),
                                             (6,'Arsenal');

CREATE TABLE IF NOT EXISTS Matches (
home_team_id INT,
away_team_id int,
home_team_goals int,
away_team_goals int);

insert into Matches (home_team_id, away_team_id, home_team_goals, away_team_goals)
values (1,4,0,1);
insert into Matches (home_team_id, away_team_id, home_team_goals, away_team_goals)
values (1,6,3,3);
insert into Matches (home_team_id, away_team_id, home_team_goals, away_team_goals)
values (4,1,5,2);
insert into Matches (home_team_id, away_team_id, home_team_goals, away_team_goals)
values (6,1,0,0);

select
    *
from
    Matches;


select * from Matches;

with m_cte as (
select
    *,
    case
        when home_team_goals > away_team_goals then 3
        when home_team_goals = away_team_goals then 1
    end as home_goals,
    case
        when home_team_goals < away_team_goals then 3
        when home_team_goals = away_team_goals then 1
    end as away_goals
from
    Matches),
home as (
select
    home_team_id as team_id,
    count(home_team_id) as matches_played,
    sum(home_goals) as points,
    sum(home_team_goals) as goal_for,
    sum(away_team_goals) as goal_against
from
    m_cte
group by home_team_id),
away as (
select
    away_team_id as team_id,
    count(away_team_id) as matches_played,
    sum(away_goals) as points,
    sum(away_team_goals) as goal_for,
    sum(home_team_goals) as goal_against
from
    m_cte
group by away_team_id),
answer as (
select * from home
union
select * from away)
select
    Teams.team_name,
    sum(matches_played) as matches_played,
    sum(points) as points,
    sum(goal_for) as goal_for,
    sum(goal_against) as goal_against,
    sum(goal_for) - sum(goal_against) as goal_diff
from
    answer
right join
    Teams
on
    answer.team_id = Teams.team_id
group by
    team_name
order by
    points desc ;


