use leetcode;

CREATE TABLE employee_actions (
    emp_id INT,
    action VARCHAR(3),
    created_at DATETIME
);

INSERT INTO employee_actions (emp_id, action, created_at) VALUES
(1,  'in',  '2019-04-01 12:00:00'),
(1,  'out', '2019-04-01 15:00:00'),
(1,  'in',  '2019-04-01 17:00:00'),
(1,  'out', '2019-04-01 21:00:00'),
(2,  'in',  '2019-04-01 10:00:00'),
(2,  'out', '2019-04-01 16:00:00'),
(3,  'in',  '2019-04-01 19:00:00'),
(3,  'out', '2019-04-02 05:00:00'),
(4,  'in',  '2019-04-01 10:00:00'),
(4,  'out', '2019-04-01 20:00:00'),
(5,  'in',  '2019-04-01 18:00:00'),
(5,  'out', '2019-04-01 22:00:00'),
(6,  'in',  '2019-04-01 06:00:00'),
(6,  'out', '2019-04-01 08:00:00'),
(7,  'in',  '2019-04-01 08:30:00'),
(7,  'out', '2019-04-01 12:00:00'),
(8,  'in',  '2019-04-01 21:10:00'),
(8,  'out', '2019-04-02 02:00:00'),
(9,  'in',  '2019-03-31 14:00:00'),
(9,  'out', '2019-03-31 20:00:00'),
(10, 'in',  '2019-04-02 09:00:00'),
(10, 'out', '2019-04-02 17:00:00'),
(11, 'in',  '2019-04-03 10:00:00'),
(11, 'out', '2019-04-03 18:00:00'),
(12, 'in',  '2019-04-01 05:00:00'),
(12, 'out', '2019-04-01 07:00:00'),
(13, 'in',  '2019-04-01 22:30:00'),
(13, 'out', '2019-04-02 04:00:00'),
(14, 'in',  '2019-04-01 04:00:00'),
(14, 'out', '2019-04-01 06:00:00');

select * from employee_actions;

select
    *,
    date(created_at) as dt
from
    employee_actions
where
    action = 'out' and created_at > '2019-04-01 19:05:00' and date(created_at) = '2019-04-01';


select
    count(distinct emp_id) as no_of_emp_inside
from
    employee_actions
where
    employee_actions.action = 'in' and created_at < '2019-04-01 19:05:00' and date(created_at) = '2019-04-01' and emp_id in (select emp_id from employee_actions where action = 'out' and created_at > '2019-04-01 19:05:00' );


select
    *
from
    employee_actions as ea1
join
    employee_actions as ea2
where
    ea1.emp_id = 2;

