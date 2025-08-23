use leetcode;

-- Create the students table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(255),
    major VARCHAR(255)
);

-- Insert data into the students table
INSERT INTO students (student_id, name, major) VALUES
(1, 'Alice', 'Computer Science'),
(2, 'Bob', 'Computer Science'),
(3, 'Charlie', 'Mathematics'),
(4, 'David', 'Mathematics');

-- Create the courses table
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    name VARCHAR(255),
    credits INT,
    major VARCHAR(255),
    mandatory VARCHAR(3)
);

-- Insert data into the courses table
INSERT INTO courses (course_id, name, credits, major, mandatory) VALUES
(101, 'Algorithms', 3, 'Computer Science', 'yes'),
(102, 'Data Structures', 3, 'Computer Science', 'yes'),
(103, 'Calculus', 4, 'Mathematics', 'yes'),
(104, 'Linear Algebra', 4, 'Mathematics', 'yes'),
(105, 'Machine Learning', 3, 'Computer Science', 'no'),
(106, 'Probability', 3, 'Mathematics', 'no'),
(107, 'Operating Systems', 3, 'Computer Science', 'no'),
(108, 'Statistics', 3, 'Mathematics', 'no');


-- Create the enrollments table
CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    semester VARCHAR(255),
    grade VARCHAR(2),
    GPA DECIMAL(3, 1),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Insert data into the enrollments table
INSERT INTO enrollments (student_id, course_id, semester, grade, GPA) VALUES
(1, 101, 'Fall 2023', 'A', 4.0),
(1, 102, 'Spring 2023', 'A', 4.0),
(1, 105, 'Spring 2023', 'A', 4.0),
(1, 107, 'Fall 2023', 'B', 3.5),
(2, 101, 'Fall 2023', 'A', 4.0),
(2, 102, 'Spring 2023', 'B', 3.0),
(3, 103, 'Fall 2023', 'A', 4.0),
(3, 104, 'Spring 2023', 'A', 4.0),
(3, 106, 'Spring 2023', 'A', 4.0),
(3, 108, 'Fall 2023', 'B', 3.5),
(4, 103, 'Fall 2023', 'B', 3.0),
(4, 104, 'Spring 2023', 'B', 3.0);

select * from students;
select * from courses;
select * from enrollments;


with mandatory_pass_student as (
select
    enrollments.student_id,
    sum(if(courses.mandatory = 'yes' and enrollments.grade = 'A',1,0)) as mandatory_pass,
    sum(if(courses.mandatory ='yes',1,0)) as total_mandatory,
    sum(if(courses.mandatory ='no',1,0)) as total_non_mandatory,
    avg(enrollments.GPA) as avg_GPA
from
    courses
inner join
    enrollments
on
    courses.course_id = enrollments.course_id
group by
    enrollments.student_id),
answer as (
select
    enrollments.student_id,
    enrollments.grade,
    enrollments.GPA,
    courses.name,
    courses.credits,
    courses.major,
    courses.mandatory,
    if(mandatory = 'no' and grade in ('A','B'),1,0) + if(mandatory = 'yes' and grade in ('A'),1,0) as total_score
from
    enrollments
inner join
    courses
on
    courses.course_id = enrollments.course_id
where
    student_id in (select student_id from mandatory_pass_student where mandatory_pass = total_mandatory and avg_GPA >= 2.5 and total_non_mandatory = 2))
select
    distinct
    student_id
from
    answer
where
    total_score = 1;

