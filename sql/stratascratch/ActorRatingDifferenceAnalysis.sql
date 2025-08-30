use leetcode;

CREATE TABLE actor_rating_shift (
    actor_name VARCHAR(50),
    film_title VARCHAR(100),
    release_date DATE,
    film_rating DECIMAL(3,1)
);

INSERT INTO actor_rating_shift (actor_name, film_title, release_date, film_rating) VALUES
('Matt Damon','Equal Depths','2018-09-21',8.0),
('Matt Damon','Equal Heights','2015-06-15',8.0),
('Emma Stone','Quantum Fate','2003-08-31',8.1),
('Leonardo Dicaprio','Rebel Rising','2001-06-26',9.2),
('Alex Taylor','Shadow Realm','2002-02-06',8.2),
('Emma Stone','Eternal Bond','2008-07-05',6.5),
('Scarlett Johansson','Infinite Skies','2010-04-21',8.7),
('Scarlett Johansson','Silent Storm','2005-12-06',7.4),
('Jane Smith','Burning Hearts','2003-02-17',5.5),
('Leonardo Dicaprio','Eternal Bond','2020-06-24',6.4),
('Natalie Portman','Silent Storm','2003-03-16',8.4),
('Alex Taylor','Bright Lights','2000-09-17',7.7),
('Emma Stone','A Long Journey','2016-05-09',6.2),
('Will Smith','Rebel Rising','2006-03-27',6.6),
('Chris Evans','Lost Island','2008-07-09',5.4),
('Natalie Portman','Bright Lights','2005-07-13',6.9),
('John Doe','Bright Lights','2000-07-23',8.3),
('Angelina Jolie','Infinite Skies','2019-03-08',6.0),
('Matt Damon','Final Plateau','2020-03-01',8.0),
('Brad Pitt','Shadow Realm','2014-10-31',6.0),
('Scarlett Johansson','Bright Lights','2016-05-13',7.5),
('Leonardo Dicaprio','Cold War','2004-09-24',8.9),
('Emma Stone','Bright Lights','2005-06-28',9.2),
('Scarlett Johansson','Lost Island','2018-02-06',9.4),
('Jane Smith','Infinite Skies','2016-07-08',8.3),
('Will Smith','Quantum Fate','2010-03-03',6.7),
('Scarlett Johansson','Quantum Fate','2000-12-21',6.7),
('Will Smith','Dark Truth','2018-09-16',6.2),
('Emma Stone','Lost Island','2010-05-14',6.0),
('Chris Evans','Lost Island','2008-07-09',5.4),
('Will Smith','Infinite Skies','2014-04-04',5.9),
('Morgan Lee','Infinite Skies','2009-06-24',5.7),
('Alex Taylor','A Long Journey','2004-11-26',8.2),
('Alex Taylor','Eternal Bond','2009-06-18',6.0),
('Alex Taylor','Cold War','2000-09-01',7.5),
('Natalie Portman','Eternal Bond','2005-12-09',7.4),
('Natalie Portman','Lost Island','2003-02-17',8.4),
('Morgan Lee','Lost Island','2015-08-29',6.5),
('Will Smith','Dark Truth','2011-05-21',9.1),
('Leonardo Dicaprio','Shadow Realm','2018-11-16',7.9),
('Emma Stone','Bright Lights','2003-06-06',6.7),
('Alex Taylor','Burning Hearts','2021-05-21',8.5),
('Will Smith','A Long Journey','2013-06-07',6.5),
('John Doe','Infinite Skies','2020-11-02',6.6),
('Chris Evans','Bright Lights','2001-04-19',6.1),
('Emma Stone','Infinite Skies','2001-12-02',8.3),
('Jane Smith','Burning Hearts','2017-03-05',5.6),
('Leonardo Dicaprio','Cold War','2021-03-27',7.5),
('Chris Evans','Burning Hearts','2019-07-26',7.7),
('Morgan Lee','Burning Hearts','2016-12-09',8.3);

select * from actor_rating_shift;

with max_dates_actors as (
select
    actor_name,
    max(release_date) as latest_date
from
    actor_rating_shift
group by actor_name),
latest_ratings as (
select
    actor_name,
    film_rating as latest_rating
from
    actor_rating_shift
where
    (actor_name,release_date) in (select * from max_dates_actors)),
avg_rating as (
select
    actor_name,
    avg(film_rating) as avg_rating
from
    actor_rating_shift
where
    release_date not in (select latest_date from max_dates_actors)
group by
    actor_name)
select
    distinct actor_rating_shift.actor_name,
    round(latest_ratings.latest_rating,2) as latest_rating,
    round(ifnull(avg_rating.avg_rating,latest_ratings.latest_rating),2) as avg_rating,
    round(latest_ratings.latest_rating - ifnull(avg_rating.avg_rating,latest_ratings.latest_rating),2) as rating_difference
from
    actor_rating_shift
inner join
    latest_ratings
on actor_rating_shift.actor_name = latest_ratings.actor_name
left join
    avg_rating
on actor_rating_shift.actor_name = avg_rating.actor_name;
