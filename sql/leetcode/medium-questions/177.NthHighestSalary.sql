use leetcode;

select * from Employee;
DELIMITER $$

CREATE PROCEDURE GetNthHighestSalary(IN n INT)
BEGIN
    WITH answer as (
        SELECT
            *,
            RANK() OVER (ORDER BY salary DESC) as rnk
        FROM
            Employee
    )
    SELECT
        salary
    FROM
        answer
    WHERE
        rnk = n;
END$$

DELIMITER ;