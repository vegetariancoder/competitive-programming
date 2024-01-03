use online;

create table company_revenue
(
company varchar(100),
year int,
revenue int
);

insert into company_revenue values
('ABC1',2000,100),('ABC1',2001,110),('ABC1',2002,120),('ABC2',2000,100),('ABC2',2001,90),('ABC2',2002,120)
,('ABC3',2000,500),('ABC3',2001,400),('ABC3',2002,600),('ABC3',2003,800);

select * from company_revenue;

# first method
with answer as (
select
    *,
    case
        when revenue > lag(revenue,1,0) over (partition by company order by (select null)) then 1 else -1
    end as flag
from
    company_revenue)
select
    distinct company
from
    company_revenue
where
    company not in (select company from answer where flag = -1);

# second method
with answer as (
select
    *,
    if(row_number() over (partition by company order by year)=dense_rank() over (partition by company order by revenue),'1',-1) as flag
from
    company_revenue)
select
    distinct company
from
    company_revenue
where
    company not in (select company from answer where flag = -1);

