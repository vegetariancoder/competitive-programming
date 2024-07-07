use leetcode;

CREATE TABLE Salesperson (
    salesperson_id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    salesperson_id INT,
    FOREIGN KEY (salesperson_id) REFERENCES Salesperson(salesperson_id)
);

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

INSERT INTO Salesperson (salesperson_id, name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Jerry');

INSERT INTO Customer (customer_id, salesperson_id) VALUES
(1, 1),
(2, 1),
(3, 2);

INSERT INTO Sales (sale_id, customer_id, price) VALUES
(1, 2, 892),
(2, 1, 354),
(3, 3, 988),
(4, 3, 856);

with total_sales_cte as (
select
    Salesperson.name,
    Salesperson.salesperson_id,
    sum(price) as total
from
    Sales
inner join
    Customer
on
    Sales.customer_id = Customer.customer_id
inner join
    Salesperson
on
    Salesperson.salesperson_id = Customer.salesperson_id
group by
    Salesperson.name, Salesperson.salesperson_id)
select
    Salesperson.salesperson_id,
    Salesperson.name,
    ifnull(total_sales_cte.total,0) as total
from
    total_sales_cte
right join
    Salesperson
on
    total_sales_cte.salesperson_id = Salesperson.salesperson_id;

