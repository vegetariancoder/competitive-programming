use leetcode;

-- Create the Tree table
CREATE TABLE Tree (
    N INT,
    P INT
);

-- Insert data into the Tree table
INSERT INTO Tree (N, P) VALUES
(1, 2),
(3, 2),
(6, 8),
(9, 8),
(2, 5),
(8, 5),
(5, NULL);

-- Optional: Verify the data insertion
SELECT * FROM Tree;

select
    distinct t1.N,
    if(t1.P is null,'root',if(t2.P is null ,'leaf','inner')) as Type
from
    Tree t1
left join
    Tree t2
on
    t1.N = t2.P;


select
    N,
    case
        when P is null then 'root'
        when N in (select P from Tree where P not in (select N from Tree where P is null)) then 'inner'
    else 'Leaf' end  as Type
from
    Tree;
