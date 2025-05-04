use leetcode;
SET GLOBAL time_zone = '+3:00';

Create table If Not Exists Matches (match_id int, first_player int , second_player int, first_score int, second_score int    );

insert into Matches (match_id,first_player,second_player,first_score,second_score) values(1,15,45,3,0),
                                                                                          (2,30,25,1,2),
                                                                                          (3,30,15,2,0),
                                                                                          (4,40,20,5,2),
                                                                                          (5,35,50,1,1);

Create table If Not Exists Players (player_id int, group_id int );

insert into Players (player_id,group_id) values(15,1),
                                                (25,1),
                                                (30,1),
                                                (45,1),
                                                (10,2),
                                                (35,2),
                                                (50,2),
                                                (20,3),
                                                (40,3);

with cte as (
select
    *,
    if(first_score>Matches.second_score,1,0) as first_win,
    if(first_score<Matches.second_score,1,0) as second_win,
    case
        when first_score = second_score and first_player < second_player then 1 else 0
    end as first_common,
    case
        when first_score = second_score and first_player > second_player then 1 else 0
    end as second_common
from
    Matches),
point_list as (
select
    first_player as player,
    sum(first_win) as points
from
    cte
group by first_player
union
select
    second_player as player,
    sum(second_win) as points
from
    cte
group by second_player
union
select
    first_player as player,
    sum(first_common) as points
from
    cte
group by first_player
union
select
    second_player as player,
    sum(second_common) as points
from
    cte
group by second_player
), answer as (
select
    Players.player_id,
    Players.group_id,
    ifnull(point_list.points,0) as points,
    dense_rank() over (partition by group_id order by ifnull(point_list.points,0) desc ,player_id) as drnk
from
    point_list
right join
    Players
on
    point_list.player = Players.player_id)
select
    group_id,
    player_id
from
    answer
where
    drnk=1;