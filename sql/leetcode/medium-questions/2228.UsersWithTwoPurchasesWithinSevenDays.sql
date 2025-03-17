use leetcode;

create table Purchases
(
    purchase_id int null,
    user_id        int null,
    purchase_date     date null
);

insert into Purchases (purchase_id,user_id,purchase_date) values (4,2,'2022-03-13'),
                                                                 (1,5,'2022-02-11'),
                                                                 (3,7,'2022-06-19'),
                                                                 (6,2,'2022-03-20'),
                                                                 (5,7,'2022-06-19'),
                                                                 (2,2,'2022-06-08');


select * from Purchases;


with answer as (
select
    *,
    datediff(lead(purchase_date) over (partition by user_id order by purchase_date),Purchases.purchase_date) as diff,
    lead(purchase_date) over (partition by user_id order by purchase_date) as ld
from
    Purchases
where
    user_id in (
select
    user_id
from
    Purchases
group by
    user_id
having
    count(*) >=2)
order by
    purchase_date)
select
    distinct user_id
from
    answer
where
    diff <= 7;