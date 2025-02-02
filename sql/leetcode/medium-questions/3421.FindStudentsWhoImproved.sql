use leetcode;

CREATE TABLE Scores (
    student_id INT,
    subject VARCHAR(50),
    score INT,
    exam_date DATE
);

INSERT INTO Scores (student_id, subject, score, exam_date) VALUES
(101, 'Math', 70, '2023-01-15'),
(101, 'Math', 85, '2023-02-15'),
(101, 'Physics', 65, '2023-01-15'),
(101, 'Physics', 60, '2023-02-15'),
(102, 'Math', 80, '2023-01-15'),
(102, 'Math', 85, '2023-02-15'),
(103, 'Math', 90, '2023-01-15'),
(104, 'Physics', 75, '2023-01-15'),
(104, 'Physics', 85, '2023-02-15');


select * from Scores;

with right_Student as (
select
    student_id
from
    Scores
group by
    student_id
having
    count(distinct exam_date) >=2),
rnks_info as (
select
    *,
    dense_rank() over (partition by student_id,subject order by exam_date) as first_exam_drnk,
    dense_rank() over (partition by student_id,subject order by exam_date desc ) as last_exam_drnk
from
    Scores
where
    student_id in (select student_id from right_Student)),
last_dates as (
select
    student_id,
    subject,
    score,
    exam_date
from
    rnks_info
where
    last_exam_drnk = 1),
first_dates as (
select
    student_id,
    subject,
    score,
    exam_date
from
    rnks_info
where
    first_exam_drnk = 1),
filtered_data as (
select
    *
from
    first_dates
union
select
    *
from
    last_dates
order by
    student_id,subject),
answer as (
select
    *,
    lead(score) over (partition by student_id,subject order by student_id,subject) as next_score
from
    filtered_data)
select
    student_id,
    subject,
    score as first_score,
    next_score as latest_score
from
    answer
where
    next_score > score;

