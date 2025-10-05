use leetcode;

create table teams (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(255)
);

insert into teams(team_id, team_name) VALUES (1001, 'Nieckmesters'), (1003, 'Sunrisers'), (1006, 'Prates'), (1007, 'Smashers');

CREATE TABLE matches (
    match_id INT PRIMARY KEY,
    winning_team_id INT,
    losing_team_id INT,
    goals_won INT
);
delete from matches;
INSERT INTO matches (match_id, winning_team_id, losing_team_id, goals_won) VALUES
(1, 1001, 1007, 1),
(2, 1007, 1001, 2),
(3, 1006, 1003, 3),
(4, 1001, 1003, 1),
(5, 1007, 1001, 1),
(6, 1006, 1003, 2),
(7, 1006, 1001, 3),
(8, 1007, 1003, 5),
(9, 1001, 1003, 1),
(10, 1007, 1006, 2),
(11, 1006, 1003, 3),
(12, 1001, 1003, 4),
(13, 1001, 1006, 2),
(14, 1007, 1001, 4),
(15, 1006, 1007, 3),
(16, 1001, 1003, 3),
(17, 1001, 1007, 3),
(18, 1006, 1007, 2),
(19, 1003, 1001, 1);

select * from matches;


with winning as (
select
    winning_team_id,
    count(winning_team_id) as winning_times,
    sum(goals_won) as total_goals
from
    matches
group by
    winning_team_id),
losing as (
select
    losing_team_id,
    count(losing_team_id) as losing_times
from
    matches
group by
    losing_team_id),
cte as (
select
    winning.winning_team_id,
    winning.winning_times,
    winning.total_goals,
    losing.losing_times,
    winning.winning_times-losing.losing_times as difference,
    dense_rank() over (order by winning.winning_times-losing.losing_times desc ) as drnk
from
    winning
inner join
    losing
on
    winning.winning_team_id = losing.losing_team_id)
select
    teams.team_name,
    cte.drnk
from
    cte
inner join
    teams
on
    cte.winning_team_id = teams.team_id
order by
    drnk;
