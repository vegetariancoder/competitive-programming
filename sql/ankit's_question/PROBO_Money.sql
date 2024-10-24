use leetcode;
create table polls
(
user_id varchar(4),
poll_id varchar(3),
poll_option_id varchar(3),
amount int,
created_date date
);
-- Insert sample data into the investments table
INSERT INTO polls (user_id, poll_id, poll_option_id, amount, created_date) VALUES
('id1', 'p1', 'A', 200, '2021-12-01'),
('id2', 'p1', 'C', 250, '2021-12-01'),
('id3', 'p1', 'A', 200, '2021-12-01'),
('id4', 'p1', 'B', 500, '2021-12-01'),
('id5', 'p1', 'C', 50, '2021-12-01'),
('id6', 'p1', 'D', 500, '2021-12-01'),
('id7', 'p1', 'C', 200, '2021-12-01'),
('id8', 'p1', 'A', 100, '2021-12-01'),
('id9', 'p2', 'A', 300, '2023-01-10'),
('id10', 'p2', 'C', 400, '2023-01-11'),
('id11', 'p2', 'B', 250, '2023-01-12'),
('id12', 'p2', 'D', 600, '2023-01-13'),
('id13', 'p2', 'C', 150, '2023-01-14'),
('id14', 'p2', 'A', 100, '2023-01-15'),
('id15', 'p2', 'C', 200, '2023-01-16');

create table poll_answers
(
poll_id varchar(3),
correct_option_id varchar(3)
);

-- Insert sample data into the poll_answers table
INSERT INTO poll_answers (poll_id, correct_option_id) VALUES
('p1', 'C'),('p2', 'A');

select
    *
from
    polls;

select
    *
from
    poll_answers;

with main_cte as (
select
    polls.user_id,
    polls.poll_id,
    polls.poll_option_id,
    poll_answers.correct_option_id,
    polls.amount,
    case
        when poll_option_id = correct_option_id then 'Yes'
    else 'No' end as correct_or_not
from
    polls
left join
    poll_answers
on
    polls.poll_id = poll_answers.poll_id),
total_incorrect_sum as (
select
    poll_id,
    sum(amount) as total_sum
from
    main_cte
where
    correct_or_not = 'No'
group by poll_id),
total_correct_sum as (
select
    poll_id,
    sum(amount) as total_correct_sum
from
    main_cte
where
    correct_or_not = 'Yes'
group by poll_id)
select
    main_cte.user_id,
    main_cte.poll_id,
    round(total_incorrect_sum.total_sum*(amount/total_correct_sum),0) as testing2
from
    main_cte
inner join
    total_incorrect_sum
on
    main_cte.poll_id = total_incorrect_sum.poll_id
inner join
    total_correct_sum
on
    main_cte.poll_id = total_correct_sum.poll_id
where
    correct_or_not = 'Yes';
