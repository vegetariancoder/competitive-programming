use leetcode;
create table If Not Exists Sales (sale_date date, fruit varchar(100), sold_num int);
insert into Sales (sale_date,fruit,sold_num) values ('2020-05-01','apples',10),
                                                    ('2020-05-01','oranges',8),
                                                    ('2020-05-02','apples',15),
                                                    ('2020-05-02','oranges',15),
                                                    ('2020-05-03','apples',20),
                                                    ('2020-05-03','oranges',0),
                                                    ('2020-05-04','apples',15),
                                                    ('2020-05-04','oranges',16);

select * from Sales;


with apple_sale_tb as (
select
    sale_date,
    sum(sold_num) as apple_sale
from
    Sales
where
    fruit = 'apples'
group by sale_date)
, orange_sale_tb as (
select
    sale_date,
    sum(sold_num) as orange_sale
from
    Sales
where
    fruit = 'oranges'
group by sale_date)
select
    apple_sale_tb.sale_date as sale_date,
    apple_sale-orange_sale as diff
from
    apple_sale_tb
inner join
    orange_sale_tb
on
    apple_sale_tb.sale_date = orange_sale_tb.sale_date;