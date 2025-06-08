select * from facebook_complaints;


select
    type,
    round(sum(if(processed=1,1,0))/count(*),2) as processed_rate
from
facebook_complaints
group by
    type;
