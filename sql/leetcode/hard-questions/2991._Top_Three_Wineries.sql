drop database online;
create database online;
use online;

CREATE TABLE Wineries (
    id INT PRIMARY KEY,
    country VARCHAR(255),
    points INT,
    winery VARCHAR(255)
);

INSERT INTO Wineries (id, country, points, winery) VALUES
(103, 'Australia', 84, 'WhisperingPines'),
(737, 'Australia', 85, 'GrapesGalore'),
(848, 'Australia', 100, 'HarmonyHill'),
(222, 'Hungary', 60, 'MoonlitCellars'),
(116, 'USA', 47, 'RoyalVines'),
(124, 'USA', 45, 'Eagle''sNest'),
(648, 'India', 69, 'SunsetVines'),
(894, 'USA', 39, 'RoyalVines'),
(677, 'USA', 9, 'PacificCrest');

select * from Wineries;

with main_table as (
select
    country,
    winery,
    points,
    dense_rank() over (partition by country order by points desc ) as drnk
from
    Wineries),
first as (
select
    country,
    case
        when drnk = 1 then concat(winery," ", "(",points,")")
    end as top_winery
from
    main_table
where
    drnk = 1),
second as (
select
    country,
    case
        when drnk = 2 then concat(winery," ", "(",points,")")
    end as second_winery
from
    main_table
where
    drnk = 2),
third as (
select
    country,
    case
        when drnk = 3 then concat(winery," ", "(",points,")")
    end as third_winery
from
    main_table
where
    drnk = 3)
select
    first.country,
    top_winery,
    ifnull(second_winery,"No second winery") as second_winery,
    ifnull(third_winery,"No third winery") as third_winery
from
    first
left join
    second
on
    first.country = second.country
left join
    third
on
    first.country = third.country;


