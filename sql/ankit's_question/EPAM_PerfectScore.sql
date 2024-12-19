use leetcode;

create table assessments
(
id int,
experience int,
sqlsubject int,
algo int,
bug_fixing int
);

insert into assessments values
(1,3,100,null,50),
(2,5,null,100,100),
(3,1,100,100,100),
(4,5,100,50,null),
(5,5,100,100,100)

select * from assessments;


select
    experience,
    sum(IF(mod(ifnull(sqlsubject, 0) + ifnull(algo, 0) + ifnull(bug_fixing, 0), 100) = 0, 1, 0)) as perfect,
    count(*) as cnt
from
    assessments
group by experience
order by
    experience;