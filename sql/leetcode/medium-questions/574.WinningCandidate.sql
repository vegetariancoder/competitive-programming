use leetcode;

Create table If Not Exists Candidate (id int, Name varchar(255));
Create table If Not Exists Vote (id int, CandidateId int);

Truncate table Candidate;
insert into Candidate (id, Name) values ('1', 'A');
insert into Candidate (id, Name) values ('2', 'B');
insert into Candidate (id, Name) values ('3', 'C');
insert into Candidate (id, Name) values ('4', 'D');
insert into Candidate (id, Name) values ('5', 'E');

Truncate table Vote;
insert into Vote (id, CandidateId) values ('1', '2');
insert into Vote (id, CandidateId) values ('2', '4');
insert into Vote (id, CandidateId) values ('3', '3');
insert into Vote (id, CandidateId) values ('4', '2');
insert into Vote (id, CandidateId) values ('5', '5');

with answer as (
select
    Candidate.Name,
    dense_rank() over (order by count(*) desc ) as drnk
from
    Candidate
inner join
    Vote
on
    Candidate.id = Vote.CandidateId
group by Candidate.Name)
select  Name from answer where drnk = 1;