use namastesql;


select
    case
        when price < 100 then 'Low Price'
        when price > 100 and price <= 500 then 'Medium Price'
        when price > 500 then 'High Price'
    end as category,
	count(*) as no_of_products
from
    Products
group by
	category
order by
	no_of_products desc;

