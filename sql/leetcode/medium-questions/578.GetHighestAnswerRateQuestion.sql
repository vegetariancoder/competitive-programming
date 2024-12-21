use leetcode;
CREATE TABLE IF NOT EXISTS SurveyLog (id int, action varchar(100), question_id int, answer_id int, q_num int, timestamp_vals int);
insert into SurveyLog (id, action,question_id,answer_id,q_num,timestamp_vals) values (5,'show',285,null,1,123);
insert into SurveyLog (id, action,question_id,answer_id,q_num,timestamp_vals) values (5,'answer',285,124124,1,124);
insert into SurveyLog (id, action,question_id,answer_id,q_num,timestamp_vals) values (5,'show',369,null,2,125);
insert into SurveyLog (id, action,question_id,answer_id,q_num,timestamp_vals) values (5,'skip',369,null,2,126);


select*
from SurveyLog;

with cte as (
select
    SurveyLog.question_id,
    sum(case
        when action = 'show' then 1 else 0
    end) as show_count,
    sum(case
        when action = 'answer' then 1 else 0
    end) as answered,
    (sum(case
        when action = 'show' then 1 else 0
    end)/sum(case
        when action = 'answer' then 1 else 0
    end)) as answer_rate
from
    SurveyLog
group by question_id),
answer as (
select
    *,
    dense_rank() over (order by answer_rate desc , question_id desc ) as drnk
from
    cte)
select
    question_id
from
    answer
where
    drnk=1;

