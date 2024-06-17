use leetcode;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    major VARCHAR(255) NOT NULL
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    credits INT NOT NULL,
    major VARCHAR(255) NOT NULL
);

CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    semester VARCHAR(255) NOT NULL,
    grade CHAR(1) NOT NULL
);

-- Insert data into students table
INSERT INTO students (student_id, name, major) VALUES
(1, 'Alice', 'Computer Science'),
(2, 'Bob', 'Computer Science'),
(3, 'Charlie', 'Mathematics'),
(4, 'David', 'Mathematics');


-- Insert data into courses table
INSERT INTO courses (course_id, name, credits, major) VALUES
(101, 'Algorithms', 3, 'Computer Science'),
(102, 'Data Structures', 3, 'Computer Science'),
(103, 'Calculus', 4, 'Mathematics'),
(104, 'Linear Algebra', 4, 'Mathematics');

-- Insert data into enrollments table
INSERT INTO enrollments (student_id, course_id, semester, grade) VALUES
(1, 101, 'Fall 2023', 'A'),
(1, 102, 'Fall 2023', 'A'),
(2, 101, 'Fall 2023', 'B'),
(2, 102, 'Fall 2023', 'A'),
(3, 103, 'Fall 2023', 'A'),
(3, 104, 'Fall 2023', 'A'),
(4, 103, 'Fall 2023', 'A'),
(4, 104, 'Fall 2023', 'B');


select * from courses;

select * from enrollments;

select * from students;

with enrollment_tbl as (
select
    enrollments.student_id,
    enrollments.course_id,
    enrollments.semester,
    enrollments.grade,
    count(enrollments.student_id) over(partition by enrollments.student_id) as enr_cnt
from
    enrollments)
, courses_tbl as (
select
    *,
    count(major) over (partition by major) as major_cnt
from
    courses),
answer as (
select
    enrollment_tbl.*,
    courses_tbl.major_cnt,
    count(student_id) over (partition by student_id) as final_std_cnt
from
    enrollment_tbl
inner join
    courses_tbl
on
    enrollment_tbl.course_id = courses_tbl.course_id
where
    grade = 'A' and enr_cnt = major_cnt
)
select
    distinct student_id
from
    answer
where
    major_cnt = final_std_cnt;
