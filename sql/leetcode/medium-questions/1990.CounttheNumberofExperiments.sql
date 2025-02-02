use leetcode;
Create table If Not Exists Experiments (experiment_id int, platform varchar(100) , experiment_name varchar(100));

insert into Experiments (experiment_id,platform,experiment_name) value (4,'IOS','Programming');
insert into Experiments (experiment_id,platform,experiment_name) value (13,'IOS','Sports');
insert into Experiments (experiment_id,platform,experiment_name) value (14,'Android','Reading');
insert into Experiments (experiment_id,platform,experiment_name) value (8,'Web','Reading');
insert into Experiments (experiment_id,platform,experiment_name) value (12,'Web','Reading');
insert into Experiments (experiment_id,platform,experiment_name) value (18,'Web','Programming');


select
    *
from
    Experiments;



with platform_name as (
select
    'Android' as platform
union
select
    'IOS' as platform
union
select
    'Web' as platform),
e_name as (
select
    'Reading' as experiment_name
union
select
    'Sports' as experiment_name
union
select
    'Programming' as experiment_name)
, results as (
select
    platform,
    experiment_name,
    count(*) as cnt
from
    Experiments
group by platform, experiment_name),
combined as (
select
    *
from
    platform_name,e_name)
select
    combined.platform,
    combined.experiment_name,
    ifnull(results.cnt,0) as num_experiments
from
    results
right join
    combined
using (platform, experiment_name);