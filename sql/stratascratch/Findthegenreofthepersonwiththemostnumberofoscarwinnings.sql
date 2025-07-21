use leetcode;

CREATE TABLE nominee_information (
    name VARCHAR(255),
    amg_person_id VARCHAR(50),
    top_genre VARCHAR(100),
    birthday DATE,
    id INT PRIMARY KEY
);

select * from nominee_information;

CREATE TABLE oscar_nominees (
    year INT,
    category VARCHAR(255),
    nominee VARCHAR(255),
    movie VARCHAR(255),
    winner BOOLEAN,
    id INT PRIMARY KEY
);

select * from oscar_nominees;
select * from nominee_information;

select * from nominee_information where name like '%Abigail Breslin%';


with answer as (
select
    oscar_nominees.nominee,
    nominee_information.top_genre,
    sum(oscar_nominees.winner) as winning_time,
    dense_rank() over (order by sum(oscar_nominees.winner) desc ) as drnk
from
    oscar_nominees
inner join
    nominee_information
on
    oscar_nominees.nominee = nominee_information.name
where
    winner=1
group by nominee,top_genre)
select top_genre from answer where drnk=1;