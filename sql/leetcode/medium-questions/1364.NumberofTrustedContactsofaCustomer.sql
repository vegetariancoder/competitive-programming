drop database leetcode;
create database leetcode;
use leetcode;
SET GLOBAL time_zone = '+3:00';


CREATE TABLE IF NOT EXISTS Customers (
    customer_id int,
    customer_name varchar(100),
    email varchar(100));

insert into Customers (customer_id,customer_name,email) values (1,'Alice','alice@leetcode.com');
insert into Customers (customer_id,customer_name,email) values (2,'Bob','bob@leetcode.com');
insert into Customers (customer_id,customer_name,email) values (13,'John','john@leetcode.com');
insert into Customers (customer_id,customer_name,email) values (6,'Alex','alex@leetcode.com');

CREATE TABLE IF NOT EXISTS Contacts (
    user_id int,
    contact_name varchar(100),
    contact_email varchar(100));

insert into Contacts (user_id,contact_name,contact_email) values (1,'Bob','bob@leetcode.com');
insert into Contacts (user_id,contact_name,contact_email) values (1,'John','john@leetcode.com');
insert into Contacts (user_id,contact_name,contact_email) values (1,'Jal','jal@leetcode.com');
insert into Contacts (user_id,contact_name,contact_email) values (2,'Omar','omar@leetcode.com');
insert into Contacts (user_id,contact_name,contact_email) values (2,'Meir','meir@leetcode.com');
insert into Contacts (user_id,contact_name,contact_email) values (6,'Alice','alice@leetcode.com');


CREATE TABLE IF NOT EXISTS Invoices (
    invoice_id int,
    price int,
    user_id int);

insert into Invoices (invoice_id,price,user_id) values (77,100,1);
insert into Invoices (invoice_id,price,user_id) values (88,200,1);
insert into Invoices (invoice_id,price,user_id) values (99,300,2);
insert into Invoices (invoice_id,price,user_id) values (66,400,2);
insert into Invoices (invoice_id,price,user_id) values (55,500,13);
insert into Invoices (invoice_id,price,user_id) values (44,60 ,6);

select * from Contacts;

with calc as (
select
   Customers.customer_id,
   Customers.customer_name,
   count(*) as contacts_cnt,
   sum(case
        when contact_name in (select customer_name from Customers) then 1 else 0
    end) as trusted_contacts_cnt
from
    Contacts
right join
    Customers
on
    Contacts.user_id = Customers.customer_id
group by Customers.customer_id, Customers.customer_name )
select
    Invoices.invoice_id,
    calc.customer_name,
    Invoices.price,
    calc.contacts_cnt,
    calc.trusted_contacts_cnt
from
    calc
right join
    Invoices
on
    calc.customer_id = Invoices.user_id
order by
    invoice_id;