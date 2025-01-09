use leetcode;


create table Boxes
(
box_id int null,
chest_id int null,
apple_count int null,
orange_count int
);

insert into Boxes (box_id,chest_id,apple_count,orange_count) values (2,null,6,15),
(18,14,4,15),
(19,3,8,4),
(12,2,19,20),
(20,6,12,9),
(8,6,9,9),
(3,14,16,7);

create table Chests
(
chest_id int null,
apple_count int null,
orange_count int null
);

insert into Chests (chest_id,apple_count,orange_count) values (6,5,6),
                                                                     (14,20,10),
                                                                     (2,8,8),
                                                                     (3,19,4),
                                                                     (16,19,19);

select
    Boxes.box_id,
    Boxes.chest_id,
    Boxes.apple_count as box_apple,
    Boxes.orange_count as box_orange,
    Chests.apple_count as chest_apple,
    Chests.orange_count as chest_orange
from
    Boxes
left join
    Chests
on
    Boxes.chest_id = Chests.chest_id;



select
    sum(ifnull(Boxes.apple_count,0) + ifnull(Chests.apple_count,0)) as apple_count,
    sum(ifnull(Boxes.orange_count,0) + ifnull(Chests.orange_count,0)) as orange_count
from
    Boxes
left join
    Chests
on
    Boxes.chest_id = Chests.chest_id;