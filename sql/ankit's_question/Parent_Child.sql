use leetcode;

CREATE TABLE Politician (
    pname VARCHAR(10) PRIMARY KEY,
    party CHAR(1)
);

CREATE TABLE Company (
    cname VARCHAR(10) PRIMARY KEY,
    revenue INT
);

CREATE TABLE Invested (
    pname VARCHAR(10),
    cname VARCHAR(10)
);

CREATE TABLE Subsidiary (
    parent VARCHAR(10),
    child VARCHAR(10)
);

-- Politicians
INSERT INTO Politician (pname, party) VALUES
('Don', 'R'),
('Ron', 'R'),
('Hil', 'D'),
('Bill', 'D');

-- Companies
INSERT INTO Company (cname, revenue) VALUES
('C1', 110),
('C2', 30),
('C3', 50),
('C4', 250),
('C5', 75),
('C6', 15);

-- Investments
INSERT INTO Invested (pname, cname) VALUES
('Don', 'C1'),
('Don', 'C4'),
('Ron', 'C1'),
('Hil', 'C3');

-- Subsidiary relationships
INSERT INTO Subsidiary (parent, child) VALUES
('C1', 'C2'),
('C2', 'C3'),
('C2', 'C5'),
('C4', 'C6');

with cte as (
select * from Invested i
join
    (select s1.parent as parent1,s2.child,i.pname as pname1 from subsidiary s1
    join subsidiary s2
    on s1.child = s2.parent
    join invested i on s2.child = i.cname) a
on i.cname = a.parent1)
select pname,pname1 from cte;


select
    s1.parent,
    s2.child
from
    Subsidiary s1
join
    Subsidiary s2
on
    s1.child = s2.parent;