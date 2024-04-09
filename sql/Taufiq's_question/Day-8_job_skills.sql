drop table if exists job_skills;
create table job_skills
(
	row_id		int,
	job_role	varchar(20),
	skills		varchar(20)
);
insert into job_skills values (1, 'Data Engineer', 'SQL');
insert into job_skills values (2, null, 'Python');
insert into job_skills values (3, null, 'AWS');
insert into job_skills values (4, null, 'Snowflake');
insert into job_skills values (5, null, 'Apache Spark');
insert into job_skills values (6, 'Web Developer', 'Java');
insert into job_skills values (7, null, 'HTML');
insert into job_skills values (8, null, 'CSS');
insert into job_skills values (9, 'Data Scientist', 'Python');
insert into job_skills values (10, null, 'Machine Learning');
insert into job_skills values (11, null, 'Deep Learning');
insert into job_skills values (12, null, 'Tableau');

select * from job_skills;

with answer as (
select
    row_id,
    job_role,
    skills,
    count(job_role) over (order by row_id) as cnt
from
    job_skills)
select
    row_id,
    first_value(job_role) over (partition by cnt order by cnt) as job_role,
    skills
from
    answer;



CREATE TABLE Employee (
    name VARCHAR(50),
    age INT,
    salary DECIMAL(10,2)
);

INSERT INTO Employee (name, age, salary) VALUES
('abc', 12, 1000),
('xyz', 13, 2000),
('def', 14, 3000);


select * from Employee;



with cte as (
select
    *,
    dense_rank() over (order by salary desc ) as salary_rnk
from
    Employee)
select
    *
from
    cte
where
    salary_rnk = 2;

select
    *
from
    (
select
    *,
    dense_rank() over (order by salary desc ) as salary_rnk
from
    Employee) as tb
where
    salary_rnk = 2;


