use leetcode;

create table booking_table (
    booking_id varchar(10),
    booking_date date,
    user_id varchar(10),
    line_of_business varchar(20)
);

insert into booking_table (booking_id, booking_date, user_id, line_of_business) values
('b1',  '2022-03-23', 'u1', 'Flight'),
('b2',  '2022-03-27', 'u2', 'Flight'),
('b3',  '2022-03-28', 'u1', 'Hotel'),
('b4',  '2022-03-31', 'u4', 'Flight'),
('b5',  '2022-04-02', 'u1', 'Hotel'),
('b6',  '2022-04-02', 'u2', 'Flight'),
('b7',  '2022-04-06', 'u5', 'Flight'),
('b8',  '2022-04-06', 'u6', 'Hotel'),
('b9',  '2022-04-06', 'u2', 'Flight'),
('b10', '2022-04-10', 'u1', 'Flight'),
('b11', '2022-04-12', 'u4', 'Flight'),
('b12', '2022-04-16', 'u1', 'Flight'),
('b13', '2022-04-19', 'u2', 'Flight'),
('b14', '2022-04-20', 'u5', 'Hotel'),
('b15', '2022-04-22', 'u6', 'Flight'),
('b16', '2022-04-26', 'u4', 'Hotel'),
('b17', '2022-04-28', 'u2', 'Hotel'),
('b18', '2022-04-30', 'u1', 'Hotel'),
('b19', '2022-05-04', 'u4', 'Hotel'),
('b20', '2022-05-06', 'u1', 'Flight');

create table user_table (
    user_id varchar(10),
    segment varchar(10)
);

insert into user_table (user_id, segment) values
('u1', 's1'),
('u2', 's1'),
('u3', 's1'),
('u4', 's2'),
('u5', 's2'),
('u6', 's3'),
('u7', 's3'),
('u8', 's3'),
('u9', 's3'),
('u10', 's3');

select * from booking_table;

select * from user_table;

select
    total_cnt.segment,
    total_cnt.total_user_count,
    apr_2022_cnt.total_user_count_apr_2022
from
    (
select
    segment,
    count(user_id) as total_user_count
from
    user_table
group by
    segment) as total_cnt
inner join
(
select
    user_table.segment,
    count(distinct booking_table.user_id) as total_user_count_apr_2022
from
    booking_table
right join
    user_table
on user_table.user_id = booking_table.user_id
where
    month(booking_date) = 4 and year(booking_date) = 2022
group by
    user_table.segment) apr_2022_cnt
on
    total_cnt.segment = apr_2022_cnt.segment;



select
    user_table.segment,
    count(distinct user_table.user_id) as total_user_count,
    count(distinct (if(month(booking_date) = 4 and year(booking_date) = 2022,user_table.user_id,null))) as total_user_count_apr_2022
from
    booking_table
right join
    user_table
on
    user_table.user_id = booking_table.user_id
group by
    user_table.segment;


select * from booking_table;

select
    *
from
    booking_table
where
    (user_id,booking_date) in (select user_id,min(booking_date) from booking_table group by user_id) and line_of_business = 'Hotel';


select
    user_id,
    datediff(max(booking_date),min(booking_date)) as total_days
from
    booking_table
where
    user_id = 'u1';