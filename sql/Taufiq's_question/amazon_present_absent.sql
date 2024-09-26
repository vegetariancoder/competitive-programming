use leetcode;
drop table if exists emp_attendance;
create table emp_attendance
(
	employee 	varchar(10),
	dates 		date,
	status 		varchar(20)
);
insert into emp_attendance values('A1', '2024-01-01', 'PRESENT');
insert into emp_attendance values('A1', '2024-01-02', 'PRESENT');
insert into emp_attendance values('A1', '2024-01-03', 'PRESENT');
insert into emp_attendance values('A1', '2024-01-04', 'ABSENT');
insert into emp_attendance values('A1', '2024-01-05', 'PRESENT');
insert into emp_attendance values('A1', '2024-01-06', 'PRESENT');
insert into emp_attendance values('A1', '2024-01-07', 'ABSENT');
insert into emp_attendance values('A1', '2024-01-08', 'ABSENT');
insert into emp_attendance values('A1', '2024-01-09', 'ABSENT');
insert into emp_attendance values('A1', '2024-01-010', 'PRESENT');
insert into emp_attendance values('A2', '2024-01-06', 'PRESENT');
insert into emp_attendance values('A2', '2024-01-07', 'PRESENT');
insert into emp_attendance values('A2', '2024-01-08', 'ABSENT');
insert into emp_attendance values('A2', '2024-01-09', 'PRESENT');
insert into emp_attendance values('A2', '2024-01-010', 'ABSENT');

SELECT * from emp_attendance;

with cte_1 as (
select
    *,
    row_number() over (partition by employee order by employee,dates) as rn
from
    emp_attendance),
cte_2 as (
select
    *,
    row_number() over (partition by employee order by employee,dates) as rn2
from
    cte_1
where
    status = 'PRESENT')
select
    employee,
    min(dates) as from_dt,
    max(dates) as to_dt
from
    cte_2
group by
    employee,rn-rn2;




with cte_1 as (
select
    *,
    row_number() over (partition by employee,status order by employee,dates) as rn
from
    emp_attendance),
cte_2 as (
select
    *,
    row_number() over (partition by employee order by employee,dates) as rn2
from
    cte_1)
select
    employee,
    status,
    min(dates) as from_dt,
    max(dates) as to_dt
from
    cte_2
group by
    employee,status,rn2-rn;



