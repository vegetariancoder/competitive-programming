use leetcode;


-- Create Schools table
CREATE TABLE Schools (
    school_id INT PRIMARY KEY,
    capacity INT NOT NULL
);

-- Insert data into Schools table
INSERT INTO Schools (school_id, capacity)
VALUES
    (11, 151),
    (5, 48),
    (9, 9),
    (10, 99);

-- Create Exam table
CREATE TABLE Exam (
    score INT NOT NULL,
    student_count INT NOT NULL
);

-- Insert data into Exam table
INSERT INTO Exam (score, student_count)
VALUES
    (975, 10),
    (966, 60),
    (844, 76),
    (749, 76),
    (744, 100);

select * from Schools;

select * from Exam;


select
    school_id,
    ifnull(min(score),-1) as score
from
    Schools
left join
    Exam
on
    Schools.capacity >= Exam.student_count
group by school_id;
