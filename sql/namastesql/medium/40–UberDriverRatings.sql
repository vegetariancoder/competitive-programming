with tile_ratings as (
select
	*,
	ntile(3) over (order by avg_rating desc) as tiling
from
	driver_ratings)
select
    driver_id,
    avg_rating,
    case
        when tiling = 1 then 'Top'
        when tiling = 2 then 'Middle'
    else 'Bottom' end as performance_tier
from
    tile_ratings