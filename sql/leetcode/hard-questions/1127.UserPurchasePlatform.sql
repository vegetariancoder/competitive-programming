drop database leetcode;
create database leetcode;
use leetcode;
Create table If Not Exists Spending (user_id int, spend_date date , platform varchar(100), amount int);
insert into Spending (user_id,spend_date,platform,amount) value (1,'2019-07-01','mobile',100);
insert into Spending (user_id,spend_date,platform,amount) value (1,'2019-07-01','desktop',100);
insert into Spending (user_id,spend_date,platform,amount) value (2,'2019-07-01','mobile',100);
insert into Spending (user_id,spend_date,platform,amount) value (2,'2019-07-02','mobile',100);
insert into Spending (user_id,spend_date,platform,amount) value (3,'2019-07-01','desktop',100);
insert into Spending (user_id,spend_date,platform,amount) value (3,'2019-07-02','desktop',100);


select * from Spending;

with dates_platform as (
    select distinct spend_date, 'desktop' as platform from Spending
    union
    select distinct spend_date, 'mobile' as platform from Spending
    union
    select distinct spend_date, 'both' as platform from Spending
),
sum_info as (
    select
        user_id,
        spend_date,
        if(count(distinct platform) = 1, min(platform), 'both') as platforms,
        sum(amount) as sm
    from
        Spending
    group by user_id, spend_date
)
select
    dp.spend_date,
    dp.platform,
    si.user_id,
    si.sm
from
    dates_platform dp
left join
    sum_info si
on
    dp.spend_date = si.spend_date and dp.platform = si.platforms
order by dp.spend_date, dp.platform;
