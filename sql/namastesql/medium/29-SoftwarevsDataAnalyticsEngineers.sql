use leetcode;

drop table if exists Employees;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    JoinDate DATE,
    JobTitle VARCHAR(100)
);

INSERT INTO Employees (EmployeeID, Name, JoinDate, JobTitle) VALUES
(1, 'John Doe', '2021-02-15', 'Software Engineer'),
(2, 'Jane Smith', '2022-03-20', 'Software Developer'),
(3, 'Alice Johnson', '2021-12-10', 'Software Engineer'),
(4, 'Bob Anderson', '2022-01-05', 'Project Manager'),
(5, 'Ella Williams', '2022-04-25', 'Software Engineer'),
(6, 'Michael Brown', '2022-03-10', 'Data Analyst'),
(7, 'Sophia Garcia', '2022-02-28', 'Software Engineer'),
(8, 'James Martinez', '2022-01-15', 'Project Manager'),
(9, 'Olivia Robinson', '2022-04-05', 'Software Engineer'),
(10, 'Liam Clark', '2022-03-01', 'Software Engineer'),
(11, 'Noah Thompson', '2022-05-10', 'Data Scientist'),
(12, 'Emma Lee', '2022-06-20', 'HR Manager'),
(13, 'Ava Lewis', '2022-07-15', 'Software Engineer'),
(14, 'Lucas Walker', '2022-08-10', 'Data Engineer'),
(15, 'Mia Hall', '2022-09-05', 'Software Engineer'),
(16, 'Ryan Foster', '2022-10-01', 'Operations Manager'),
(17, 'Charlie Adams', '2022-11-12', 'Business Analyst'),
(18, 'Grace Carter', '2022-11-20', 'Technical Writer'),
(19, 'Henry Wilson', '2022-12-01', 'QA Tester'),
(20, 'Ella Turner', '2023-01-05', 'UX Designer');

select * from Employees;

select
    sum(if(JobTitle like '%Software%', 1, 0)) as Software_Engineers,
    sum(if(JobTitle like '%Data%', 1, 0))        as Data_Professionals,
    sum(if(JobTitle like '%Manager%', 1, 0))    as Managers
from
    Employees