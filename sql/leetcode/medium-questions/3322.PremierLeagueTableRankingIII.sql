use leetcode;

CREATE TABLE teams (
    season_id INT,
    team_id INT,
    team_name VARCHAR(50),
    matches_played INT,
    wins INT,
    draws INT,
    losses INT,
    goals_for INT,
    goals_against INT
);


INSERT INTO teams (season_id, team_id, team_name, matches_played, wins, draws, losses, goals_for, goals_against)
VALUES
    (2021, 1, 'Manchester City', 38, 29, 6, 3, 99, 26),
    (2021, 2, 'Liverpool', 38, 28, 8, 2, 94, 26),
    (2021, 3, 'Chelsea', 38, 21, 11, 6, 76, 33),
    (2021, 4, 'Tottenham', 38, 22, 5, 11, 69, 40),
    (2021, 5, 'Arsenal', 38, 22, 3, 13, 61, 48),
    (2022, 1, 'Manchester City', 38, 28, 5, 5, 94, 33),
    (2022, 2, 'Arsenal', 38, 26, 6, 6, 88, 43),
    (2022, 3, 'Manchester United', 38, 23, 6, 9, 58, 43),
    (2022, 4, 'Newcastle', 38, 19, 14, 5, 68, 33),
    (2022, 5, 'Liverpool', 38, 19, 10, 9, 75, 47);


select * from teams;

select
    season_id,
    team_id,
    team_name,
    (wins * 3) +  (draws * 1) + (losses * 0) as points,
    (goals_for-teams.goals_against) as goal_difference,
    dense_rank() over (partition by season_id order by (wins * 3) +  (draws * 1) + (losses * 0) desc) as drnk
from
    teams;

