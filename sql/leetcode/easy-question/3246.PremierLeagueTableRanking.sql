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
(1, 'Manchester City', 10, 6, 2, 2),
(2, 'Liverpool', 10, 6, 2, 2),
(3, 'Chelsea', 10, 5, 3, 2),
(4, 'Arsenal', 10, 4, 4, 2),
(5, 'Tottenham', 10, 3, 5, 2);


select * from TeamStats;

select
    *
from
    TeamStats;

select
    team_id,
    team_name,
    wins*3+draws*1+losses*0,
    rank() over (order by wins*3+draws*1+losses*0 desc ) as rnk
from
    TeamStats;