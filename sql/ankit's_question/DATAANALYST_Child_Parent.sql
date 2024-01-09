drop database online;
create database online;
use online;

create table people
(id int primary key not null,
 name varchar(20),
 gender char(2));

create table relations
(
    c_id int,
    p_id int,
    FOREIGN KEY (c_id) REFERENCES people(id),
    foreign key (p_id) references people(id)
);

insert into people (id, name, gender)
values
    (107,'Days','F'),
    (145,'Hawbaker','M'),
    (155,'Hansel','F'),
    (202,'Blackston','M'),
    (227,'Criss','F'),
    (278,'Keffer','M'),
    (305,'Canty','M'),
    (329,'Mozingo','M'),
    (425,'Nolf','M'),
    (534,'Waugh','M'),
    (586,'Tong','M'),
    (618,'Dimartino','M'),
    (747,'Beane','M'),
    (878,'Chatmon','F'),
    (904,'Hansard','F');

insert into relations(c_id, p_id)
values
    (145, 202),
    (145, 107),
    (278,305),
    (278,155),
    (329, 425),
    (329,227),
    (534,586),
    (534,878),
    (618,747),
    (618,904);

select * from people;
select * from relations;

with parent_child as (
select
    c_id,
    p_id,
    name,
    gender
from
    people
inner join
    relations
on
    people.id = relations.p_id),
father as (
select
    c_id,
    name as father
from
    parent_child
where
    gender = 'M'),
mother as (
    select
    c_id,
    name as mother
from
    parent_child
where
    gender = 'F'
)
select
    name,
    father,
    mother
from
    father
inner join
    mother
inner join
    people
on
    father.c_id = mother.c_id
and
    father.c_id = people.id;




with parent_child as (
select
    c_id,
    p_id,
    name,
    gender
from
    people
inner join
    relations
on
    people.id = relations.p_id)
select
    people.name as name,
    max(case
        when parent_child.gender ='M' then parent_child.name
    end) as 'Father',
    max(case
        when parent_child.gender ='F' then parent_child.name
    end) as 'Mother'
from
    parent_child
inner join
    people
on
    parent_child.c_id = people.id
group by
    name;
