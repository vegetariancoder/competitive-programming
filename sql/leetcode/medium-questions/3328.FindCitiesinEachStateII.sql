use leetcode;

CREATE TABLE locations (
    state VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO locations (state, city)
VALUES
    ('New York', 'New York City'),
    ('New York', 'Newark'),
    ('New York', 'Buffalo'),
    ('New York', 'Rochester'),
    ('California', 'San Francisco'),
    ('California', 'Sacramento'),
    ('California', 'San Diego'),
    ('California', 'Los Angeles'),
    ('Texas', 'Tyler'),
    ('Texas', 'Temple'),
    ('Texas', 'Taylor'),
    ('Texas', 'Dallas'),
    ('Pennsylvania', 'Philadelphia'),
    ('Pennsylvania', 'Pittsburgh'),
    ('Pennsylvania', 'Pottstown');


select * from locations;

with answer as (
select
    *,
    if(substring(state,1,1)=substring(city,1,1),1,0) as match_checking
from
    locations)
select
    state,
    group_concat(city) as cities,
    sum(match_checking) as matching_letter_count
from
    answer
group by state
having matching_letter_count > 0
order by matching_letter_count desc ;