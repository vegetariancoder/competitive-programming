use leetcode;

CREATE TABLE Members (
member_id int,
name varchar(100)
);

INSERT into Members values (9,'Alice'),
(11,'Bob'),
(3,'Winston'),
(8,'Hercy'),
(1,'Narihan');

CREATE TABLE Visits (
visit_id int,
member_id int,
visit_date date
);

INSERT into Visits values (22,11,'2021-10-28'),
(16,11,'2021-01-12'),
(18,9,'2021-12-10'),
(19,3,'2021-10-19'),
(12,11,'2021-03-01'),
(17,8,'2021-05-07'),
(21,9,'2021-05-12');



CREATE TABLE PurchasesMade (
visit_id int,
charged_amount int
);

INSERT into PurchasesMade values (12,2000),
(18,9000),
(17,7000);


with cte as (
select
    Visits.*,
    PurchasesMade.visit_id as v_id
from
    Visits
left join
    PurchasesMade
on
    Visits.visit_id = PurchasesMade.visit_id),
main_cte as (
select
    member_id,
    count(visit_id) as visit_cnt,
    count(v_id) as purchase_cnt,
    (100*count(v_id)/count(visit_id)) as con,
    case
        when (100*count(v_id)/count(visit_id)) >= 80 then 'Diamond'
        when (100*count(v_id)/count(visit_id)) >= 50 and (100*count(v_id)/count(visit_id)) < 80  then 'Gold'
        when (100*count(v_id)/count(visit_id)) < 50 then 'Silver'
    end as category
from
    cte
group by member_id)
select
    Members.member_id,
    Members.name,
    ifnull(main_cte.category,'Bronze') as category
from
    main_cte
right join
    Members
on
    main_cte.member_id = Members.member_id
order by
    member_id