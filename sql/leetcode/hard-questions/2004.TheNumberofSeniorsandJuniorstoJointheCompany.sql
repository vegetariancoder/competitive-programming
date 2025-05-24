drop database leetcode;
create database leetcode;
use leetcode;

create table Candidates
(
employee_id int,
experience Varchar(20),
salary int
);
INSERT INTO Candidates values(1,'Junior',10000);
INSERT INTO Candidates values(9,'Junior',10000);
INSERT INTO Candidates values(2,'Senior',20000);
INSERT INTO Candidates values(11,'Senior',20000);
INSERT INTO Candidates values(13,'Senior',50000);
INSERT INTO Candidates values(4,'Junior',40000);


# -- Create the table
# CREATE TABLE Candidates (
#     employee_id INT PRIMARY KEY,
#     experience ENUM('Junior', 'Senior'),
#     salary INT
# );
#
# -- Insert values
# INSERT INTO Candidates (employee_id, experience, salary) VALUES
# (1, 'Junior', 10000),
# (9, 'Junior', 10000),
# (2, 'Senior', 80000),
# (11, 'Senior', 80000),
# (13, 'Senior', 80000),
# (4, 'Junior', 40000);





with seniors as (
select
    *,
    sum(salary) over (order by salary rows between unbounded preceding and current row ) as sm,
    row_number() over (order by salary) as srnk,
    if(sum(salary) over (order by salary)>70000,'Yes','No') as exceed_s,
    70000-sum(salary) over (order by salary) as remaining
from
    Candidates
where
    experience='Senior'),
junior as (
select
    *,
    if(salary>if((select max(remaining) from seniors)<0,70000,(select max(remaining) from seniors)),'Yes','No') as exceed_j
from
    Candidates
where
    experience='Junior')
select
    experience,
    count(*) as cnt
from
    seniors
where
    exceed_s='No'
union
select
    experience,
    count(*) as cnt
from
    junior
where
    exceed_j='No';