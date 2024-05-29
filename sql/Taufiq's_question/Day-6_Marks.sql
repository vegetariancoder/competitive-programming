create table student_tests
(
	test_id		int,
	marks		int
);
insert into student_tests values(100, 55);
insert into student_tests values(101, 55);
insert into student_tests values(102, 60);
insert into student_tests values(103, 58);
insert into student_tests values(104, 40);
insert into student_tests values(105, 50);

select * from student_tests;

with cte as (
select
    *,
    ifnull(lead(marks) over (order by test_id),marks)as ld
from
    student_tests),
answer as (
select
    *,
    if(ld > marks,'Yes','No') as good_perf
from
    cte)
select
    student_tests.test_id,
    ld as marks
from
    answer
left join
    student_tests
on
    student_tests.marks = answer.ld
where
    good_perf = 'Yes';


select
    *,
    ifnull(lag(marks) over (order by test_id),marks) as lg
from
    student_tests;