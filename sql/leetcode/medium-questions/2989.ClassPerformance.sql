use leetcode;

-- Create the Scores table
CREATE TABLE Scores (
    student_id INT,
    student_name VARCHAR(50),
    assignment1 INT,
    assignment2 INT,
    assignment3 INT
);

-- Insert data into the Scores table
INSERT INTO Scores (student_id, student_name, assignment1, assignment2, assignment3)
VALUES
(309, 'Owen', 88, 47, 87),
(321, 'Claire', 98, 95, 37),
(338, 'Julian', 100, 64, 43),
(423, 'Peyton', 60, 44, 47),
(896, 'David', 32, 37, 50),
(235, 'Camila', 31, 53, 69);


select * from Scores;

with answer as (
select
    *,
    (assignment1+assignment2+assignment3) as total
from
    Scores)
select
    max(total) - min(total) as answer
from
    answer;
