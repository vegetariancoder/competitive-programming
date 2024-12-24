use leetcode;
create table If Not Exists Sales (sales_id int, product_id int, year int, quantity int, price int);
insert into Sales (sales_id,product_id,year,quantity,price) values (1,100,2008,10,5000),
                                                              (2,100,2009,12,5000),
                                                              (7,200,2011,15,9000);


select * from Sales;


select
    product_id,
    year as first_year,
    quantity,
    price
from
    Sales
where
    (product_id,year) in (
select
    product_id,
    min(year) as year_value
from
    Sales
group by product_id);