use leetcode;

CREATE TABLE Candidates (
candidate_id int,
name varchar(100),
years_of_exp int,
interview_id int
);

INSERT into Candidates values (11,'Atticus',1,101),
(9,'Ruben',6,104),
(6,'Aliza',10,109),
(8,'Alfredo',0,107);

CREATE TABLE Rounds (
interview_id int,
round_id int,
score int
);

INSERT into Rounds values (109,3,4),
                              (101,2,8),
                              (109,4,1),
                              (107,1,3),
                              (104,3,6),
                              (109,1,4),
                              (104,4,7),
                              (104,1,2),
                              (109,2,1),
                              (104,2,7),
                              (107,2,3),
                              (101,1,8);


with sm_Score as (
select
    interview_id,
    sum(score) as sm,
    dense_rank() over (order by sum(score) desc ) as drnk
from
    Rounds
group by
    interview_id)
select
    candidate_id
from
    Candidates
where
    interview_id = (select interview_id from sm_Score where drnk=1) and years_of_exp > 2;
