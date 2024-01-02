use online;

create table source(id int, name varchar(5));

create table target(id int, name varchar(5));

insert into source values(1,'A'),(2,'B'),(3,'C'),(4,'D');

insert into target values(1,'A'),(2,'B'),(4,'X'),(5,'F');


select
    id,
    'New in Source' as comment
from
    source
where
    id not in (select id from target)
union
select
    id,
    'New in Target' as comment
from
    target
where
    id not in (select id from source)
union
select
    source.id,
    'Mismatch' as comment
from
    source
inner join
    target
on
    source.id = target.id
where
    source.name != target.name;