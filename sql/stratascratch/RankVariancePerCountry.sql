use leetcode;


CREATE TABLE fb_active_users (
    user_id INT,
    name VARCHAR(100),
    status VARCHAR(10),
    country VARCHAR(50)
);

INSERT INTO fb_active_users (user_id, name, status, country) VALUES
(33, 'Amanda Leon', 'open', 'Australia'),
(27, 'Jessica Farrell', 'open', 'Luxembourg'),
(18, 'Wanda Ramirez', 'open', 'USA'),
(50, 'Samuel Miller', 'closed', 'Brazil'),
(16, 'Jacob York', 'open', 'Australia'),
(25, 'Natasha Bradford', 'closed', 'USA'),
(34, 'Donald Ross', 'closed', 'China'),
(52, 'Michelle Jimenez', 'open', 'USA'),
(11, 'Theresa John', 'open', 'China'),
(37, 'Michael Turner', 'closed', 'Australia'),
(32, 'Catherine Hurst', 'closed', 'Mali'),
(61, 'Tina Turner', 'open', 'Luxembourg'),
(4, 'Ashley Sparks', 'open', 'China'),
(82, 'Jacob York', 'closed', 'USA'),
(87, 'David Taylor', 'closed', 'USA'),
(78, 'Zachary Anderson', 'open', 'China'),
(5, 'Tiger Leon', 'closed', 'China'),
(56, 'Theresa Weaver', 'closed', 'Brazil'),
(21, 'Tonya Johnson', 'closed', 'Mali'),
(89, 'Kyle Curry', 'closed', 'Mali'),
(7, 'Donald Jim', 'open', 'USA'),
(22, 'Michael Bone', 'open', 'Canada'),
(31, 'Sara Michaels', 'open', 'Denmark');


CREATE TABLE fb_comments_count (
    user_id INT,
    created_at DATE,
    number_of_comments INT
);

INSERT INTO fb_comments_count (user_id, created_at, number_of_comments) VALUES
(18, '2019-12-29', 1),
(25, '2019-12-21', 1),
(78, '2020-01-04', 1),
(37, '2020-02-01', 1),
(41, '2019-12-23', 1),
(99, '2020-02-02', 1),
(21, '2019-12-28', 1),
(18, '2020-01-31', 1),
(37, '2020-02-11', 1),
(58, '2020-01-26', 1),
(32, '2020-01-10', 1),
(24, '2020-02-03', 1),
(58, '2020-01-04', 1),
(8, '2020-02-10', 1),
(18, '2019-12-17', 1),
(18, '2019-12-30', 1),
(50, '2020-01-31', 1),
(82, '2019-12-22', 1),
(52, '2019-12-31', 1),
(78, '2020-02-10', 1),
(21, '2020-01-08', 1),
(4, '2019-12-22', 1),
(18, '2020-01-02', 1),
(89, '2019-12-25', 1),
(46, '2020-01-23', 1),
(32, '2020-01-17', 1),
(41, '2020-01-03', 1),
(8, '2020-02-05', 1),
(24, '2019-12-29', 2),
(56, '2019-12-25', 1),
(18, '2020-02-03', 1),
(56, '2019-12-21', 1),
(34, '2020-01-08', 1),
(27, '2020-01-10', 1),
(33, '2020-01-22', 1),
(78, '2020-01-07', 1),
(58, '2020-02-02', 1),
(82, '2019-12-30', 1),
(89, '2020-01-28', 1),
(46, '2019-12-23', 1),
(8, '2020-01-13', 1),
(9, '2020-02-02', 1),
(89, '2020-01-07', 1),
(87, '2020-01-08', 1),
(37, '2019-12-15', 1),
(95, '2020-02-10', 1),
(41, '2019-12-27', 1),
(82, '2020-01-16', 1),
(32, '2020-01-13', 1),
(99, '2020-01-05', 1),
(27, '2020-01-25', 1),
(52, '2020-01-01', 1),
(32, '2020-01-06', 1),
(56, '2019-12-19', 1),
(78, '2019-12-30', 1),
(33, '2020-01-28', 1),
(33, '2019-12-21', 1),
(32, '2020-01-04', 2),
(32, '2019-12-21', 1),
(89, '2020-01-16', 1),
(89, '2019-12-21', 1),
(52, '2019-12-20', 1),
(78, '2020-02-15', 1),
(32, '2019-12-23', 1),
(4, '2020-02-15', 1),
(99, '2020-02-03', 1),
(87, '2020-02-15', 1),
(34, '2020-01-15', 1),
(34, '2020-01-29', 1),
(32, '2019-12-18', 1),
(25, '2020-02-14', 1),
(89, '2020-01-05', 1),
(58, '2020-01-05', 1),
(46, '2020-01-29', 1),
(9, '2020-01-21', 1),
(9, '2020-01-06', 1),
(78, '2019-12-25', 1),
(46, '2019-12-29', 1),
(95, '2020-01-10', 1),
(95, '2020-01-17', 1),
(25, '2020-01-15', 1),
(87, '2019-12-25', 1),
(89, '2020-02-12', 1),
(25, '2020-01-20', 1),
(34, '2019-12-27', 1),
(27, '2019-12-21', 1),
(8, '2020-01-22', 1),
(37, '2020-01-19', 2),
(50, '2020-01-21', 1),
(18, '2019-12-27', 1),
(82, '2020-01-23', 1),
(21, '2019-12-24', 1),
(37, '2019-12-17', 1),
(33, '2019-12-31', 1),
(50, '2020-01-28', 1),
(32, '2019-12-19', 1),
(4, '2020-01-01', 1),
(22, '2020-02-15', 1),
(31, '2020-01-28', 1),
(22, '2020-04-04', 1),
(31, '2020-01-03', 1),
(22, '2019-12-19', 1),
(31, '2020-02-15', 1),
(22, '2019-12-01', 1),
(31, '2020-04-04', 1),
(16, '2019-12-27', 1),
(5, '2020-01-23', 1),
(7, '2019-12-24', 1),
(11, '2019-12-17', 1),
(61, '2019-12-31', 1),
(16, '2020-01-28', 1),
(5, '2019-12-19', 1),
(7, '2020-01-01', 1),
(11, '2020-02-15', 1),
(61, '2020-01-28', 1),
(11, '2020-04-04', 1),
(16, '2020-01-03', 1),
(5, '2019-12-19', 1),
(7, '2020-02-15', 1),
(11, '2019-12-01', 1),
(61, '2020-04-04', 1);

select * from fb_active_users limit 2;

select * from fb_comments_count limit 2;

with cte as (
select
    fb_active_users.country,
    month(created_at) as month_value,
    sum(number_of_comments) as total_comments
from
    fb_comments_count
inner join
    fb_active_users
on
    fb_comments_count.user_id = fb_active_users.user_id
where
    created_at >= '2019-12-01' and created_at < '2020-02-01'
group by fb_active_users.country,month_value),
main_cte as (
select
    *,
    dense_rank() over (partition by month_value order by total_comments desc ) as drnk
from
    cte),
december as (
select
    country,
    total_comments,
    drnk as dec_drnk
from
    main_cte
where
    month_value = 12),
january as (
select
    country,
    total_comments,
    drnk as jan_drnk
from
    main_cte
where
    month_value = 1)
select
    december.country
from
    december
inner join
    january
on
    december.country = january.country
where
    jan_drnk < dec_drnk;

