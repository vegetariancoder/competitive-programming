use leetcode;

CREATE TABLE TeamPoints (
team_id int,
name varchar(100),
points int
);

INSERT into TeamPoints values (3,'Algeria',1431),
                           (1,'Senegal',2132),
                           (2,'New Zealand',1402),
                           (4,'Croatia',1817);



CREATE TABLE PointsChange (
team_id int,
points_change int
);

INSERT into PointsChange values (3,399),
                           (2,0),
                           (4,13),
                           (1,-22);

select * from PointsChange;

select * from TeamPoints;

with answer as (
select
    TeamPoints.*,
    dense_rank() over (order by points desc,name ) as drnk,
    PointsChange.points_change,
    if(points_change>=0,points+PointsChange.points_change,points-abs(PointsChange.points_change)) as change_points,
    dense_rank() over (order by if(points_change>=0,points+PointsChange.points_change,points-abs(PointsChange.points_change)) desc ,name) as drnk_2
from
    TeamPoints
inner join
    PointsChange
on
    TeamPoints.team_id = PointsChange.team_id
order by
    drnk)
select
    team_id,
    name,
    CAST(drnk AS SIGNED) - CAST(drnk_2 AS SIGNED) AS rank_diff
from
    answer;

