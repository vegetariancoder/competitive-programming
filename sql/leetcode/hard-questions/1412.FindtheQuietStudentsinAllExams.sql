use leetcode;

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100)
);

CREATE TABLE Exam (
    exam_id INT,
    student_id INT,
    score INT,
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);


-- Insert into Student table
INSERT INTO Student (student_id, student_name) VALUES
(1, 'Daniel'),
(2, 'Jade'),
(3, 'Stella'),
(4, 'Jonathan'),
(5, 'Will');

-- Insert into Exam table
INSERT INTO Exam (exam_id, student_id, score) VALUES
(10, 1, 70),
(10, 2, 80),
(10, 3, 90),
(20, 1, 80),
(30, 1, 70),
(30, 3, 80),
(30, 4, 90),
(40, 1, 60),
(40, 2, 70),
(40, 4, 80);


with answer as (
select
    *,
    dense_rank() over (partition by exam_id order by score) as drnk
from
    Exam),
main_answer as (
select
    student_id,
    min(drnk) as min_id,
    max(drnk) as max_id
from
    answer
group by student_id)
select
    *
from
    Student
where
    student_id in (select student_id from main_answer where main_answer.student_id = main_answer.min_id and main_answer.student_id = main_answer.max_id and main_answer.min_id != 1);