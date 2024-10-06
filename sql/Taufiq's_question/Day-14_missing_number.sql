drop table if exists invoice;
create table invoice
(
	serial_no		int
);
insert into invoice values (330115);
insert into invoice values (330120);
insert into invoice values (330121);
insert into invoice values (330122);
insert into invoice values (330125);

select * from invoice;


with recursive cte as (
    select (select min(invoice.serial_no) from invoice) as all_invoice
    union
    select all_invoice+1 from cte where all_invoice < (select max(serial_no) from invoice)
)
select
    *
from
    cte
where
    all_invoice not in (select invoice.serial_no from invoice);