drop database leetcode;
create database leetcode;
use leetcode;

Create table If Not Exists Movies (movie_id int, title varchar (100));
insert into Movies (movie_id,title) value (1,'Avengers');
insert into Movies (movie_id,title) value (2,'Frozen 2');
insert into Movies (movie_id,title) value (3,'Joker');


Create table If Not Exists Users (user_id int, name varchar (100));
insert into Users (user_id,name) value (1,'Daniel');
insert into Users (user_id,name) value (2,'Monica');
insert into Users (user_id,name) value (3,'Maria');
insert into Users (user_id,name) value (4,'James');

Create table If Not Exists Movie_Rating (movie_id int, user_id int, rating int , created_at date );
insert into Movie_Rating (movie_id,user_id,rating,created_at) value (1,1,3,'2020-01-12');
insert into Movie_Rating (movie_id,user_id,rating,created_at) value (1,2,4,'2020-02-11');
insert into Movie_Rating (movie_id,user_id,rating,created_at) value (1,3,2,'2020-02-12');
insert into Movie_Rating (movie_id,user_id,rating,created_at) value (1,4,1,'2020-01-01');
insert into Movie_Rating (movie_id,user_id,rating,created_at) value (2,1,5,'2020-02-17');
insert into Movie_Rating (movie_id,user_id,rating,created_at) value (2,2,2,'2020-02-01');
insert into Movie_Rating (movie_id,user_id,rating,created_at) value (2,3,2,'2020-03-01');
insert into Movie_Rating (movie_id,user_id,rating,created_at) value (3,1,3,'2020-02-22');
insert into Movie_Rating (movie_id,user_id,rating,created_at) value (3,2,4,'2020-02-25');

with user as (
select
    Users.name,
    count(*) as cnt,
    dense_rank() over (order by count(*) desc, name ) as drnk
from
    Users
inner join
    Movie_Rating
on
    Users.user_id = Movie_Rating.user_id
group by Users.name),
best_user as (
select
    name as results
from
    user
where
    drnk=1),
movies as (
select
    Movies.title,
    avg(rating) as avg_rating,
    dense_rank() over (order by avg(rating) desc, title ) as drnk
from
    Movie_Rating
inner join
    Movies
on
    Movie_Rating.movie_id = Movies.movie_id
where
    month(created_at) = 2
group by Movies.title ),
best_movie as (
select
    title as results
from
    movies
where
    drnk=1)
select
    results
from
    best_user
union
select
    results
from
    best_movie;


-- method -2

select
    result from
(
select
    Users.name as result
from
    Users
inner join
    Movie_Rating
on
    Users.user_id = Movie_Rating.user_id
group by Users.name
limit 1) as user
union
select
    result from
(select
    Movies.title as result
from
    Movie_Rating
inner join
    Movies
on
    Movie_Rating.movie_id = Movies.movie_id
where
    month(created_at) = 2
group by Movies.title
order by avg(rating) desc , title
limit 1) as movie;