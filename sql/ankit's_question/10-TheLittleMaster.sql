use leetcode;

CREATE TABLE players (
  player_id INT,
  player_name VARCHAR(100)
);

CREATE TABLE scores (
  match_id INT,
  player_id INT,
  runs INT
);

INSERT INTO players VALUES
(1, 'Sachin Tendulkar'),
(2, 'Virat Kohli'),
(3, 'Rohit Sharma');

INSERT INTO scores VALUES
(101, 1, 120),
(102, 1, 90),
(103, 2, 85),
(104, 3, 150),
(105, 2, 100),
(106, 3, 50);


with answer as (
select
    players.player_name,
    dense_rank() over (order by sum(runs) desc) as drnk
from
    scores
left join
    players
on
    scores.player_id = players.player_id
group by
    players.player_name)
select player_name from answer where drnk = 1;