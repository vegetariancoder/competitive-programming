use leetcode;

-- Create the TeamStats table
CREATE TABLE TeamStats (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(50),
    matches_played INT,
    wins INT,
    draws INT,
    losses INT
);

-- Insert data into the TeamStats table
INSERT INTO TeamStats (team_id, team_name, matches_played, wins, draws, losses)
VALUES
(1, 'Chelsea', 22, 13, 2, 7),
(2, 'Nottingham Forest', 27, 6, 6, 15),
(3, 'Liverpool', 17, 1, 8, 8),
(4, 'Aston Villa', 20, 1, 6, 13),
(5, 'Fulham', 31, 18, 1, 12),
(6, 'Burnley', 26, 6, 9, 11),
(7, 'Newcastle United', 33, 11, 10, 12),
(8, 'Sheffield United', 20, 18, 2, 0),
(9, 'Luton Town', 5, 4, 0, 1),
(10, 'Everton', 14, 2, 6, 6);


select
    *
from
    TeamStats;

with cte as (
select
    team_id,
    team_name,
    3*TeamStats.wins + 1*TeamStats.draws + 0*TeamStats.losses as points,
    count(*) over () as total_teams
from
    TeamStats)
select
    *,
    rank() over (order by points desc ) as rnk,
    CASE
        WHEN rank() over (order by points desc ) <= CEIL(total_teams / 3.0) THEN 'Tier 1'
        WHEN rank() over (order by points desc ) <= CEIL(2 * total_teams / 3.0) THEN 'Tier 2'
        ELSE 'Tier 3'
    END tier
from
    cte;
