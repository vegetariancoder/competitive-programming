use leetcode;

CREATE TABLE Candidates (
    candidate_id INT,
    skill VARCHAR(50),
    proficiency INT
);

INSERT INTO Candidates (candidate_id, skill, proficiency) VALUES
(101, 'python', 5),
(101, 'Tableau', 3),
(101, 'PostgreSQL', 4),
(101, 'TensorFlow', 2),
(102, 'python', 4),
(102, 'Tableau', 5),
(102, 'PostgreSQL', 4),
(102, 'R', 4),
(103, 'python', 3),
(103, 'Tableau', 5),
(103, 'PostgreSQL', 5),
(103, 'Spark', 4);


CREATE TABLE Projects (
    project_id INT,
    skill VARCHAR(50),
    importance INT
);


INSERT INTO Projects (project_id, skill, importance) VALUES
(501, 'python', 4),
(501, 'Tableau', 3),
(501, 'PostgreSQL', 5),
(502, 'python', 3),
(502, 'Tableau', 4),
(502, 'R', 2);


with calculations as (select candidate_id,
                             Projects.skill,
                             proficiency,
                             project_id,
                             importance,
                             case
                                 when proficiency > importance then 10
                                 when proficiency = importance then 0
                                 else -5 end as scoring
                      from Candidates
                               inner join
                           Projects
                           on
                               Candidates.skill = Projects.skill
                      order by project_id),
     answer as (select project_id,
                       candidate_id,
                       sum(scoring) + 100                                                                         as score,
                       dense_rank() over (partition by project_id order by sum(scoring) + 100 desc,candidate_id ) as drnk
                from calculations
                group by project_id, candidate_id)
select project_id,
       candidate_id,
       score
from answer
where drnk = 1;





