drop table if exists Q4_data;
create table Q4_data
(
	id			int,
	name		varchar(20),
	location	varchar(20)
);
insert into Q4_data values(1,null,null);
insert into Q4_data values(2,'David',null);
insert into Q4_data values(3,null,'London');
insert into Q4_data values(4,null,null);
insert into Q4_data values(5,'David',null);

select * from Q4_data;


with main_table as (
select
    id,
    first_value(name) over (order by name desc ) as name,
    first_value(location) over (order by location desc ) as location
from
    Q4_data),
min_id as (
    select
        id,
        name,
        location
from
    main_table
where
    id = (select min(id) from main_table)
),max_id as (
    select
        id,
        name,
        location
from
    main_table
where
    id = (select max(id) from main_table)
)
select
    *
from
    max_id
union
select
    *
from
    min_id;

