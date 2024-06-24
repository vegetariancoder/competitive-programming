use leetcode;


CREATE TABLE ParkingTransactions (
    lot_id INT,
    car_id INT,
    entry_time DATETIME,
    exit_time DATETIME,
    fee_paid DECIMAL(5, 2)
);



INSERT INTO ParkingTransactions (lot_id, car_id, entry_time, exit_time, fee_paid)
VALUES
    (1, 1001, '2023-06-01 08:00:00', '2023-06-01 10:30:00', 5.00),
    (1, 1001, '2023-06-02 11:00:00', '2023-06-02 12:45:00', 3.00),
    (2, 1001, '2023-06-01 10:45:00', '2023-06-01 12:00:00', 6.00),
    (2, 1002, '2023-06-01 09:00:00', '2023-06-01 11:30:00', 4.00),
    (3, 1001, '2023-06-03 07:00:00', '2023-06-03 09:00:00', 4.00),
    (3, 1002, '2023-06-02 12:00:00', '2023-06-02 14:00:00', 2.00);


select * from ParkingTransactions;
with time_diff as (
select
    *,
    time_to_sec(timediff(exit_time, entry_time)) / 3600 as diff,
    rank() over (partition by car_id order by (time_to_sec(timediff(exit_time, entry_time)) / 3600) desc ) as rnk
from
    ParkingTransactions),
total_cte as (
select
    car_id,
    round(sum(fee_paid),2) as total_fee_paid,
    round(sum(fee_paid)/sum(diff),2) as avg_hourly_fee
from
    time_diff
group by
    car_id)
select
    total_cte.car_id,
    total_cte.total_fee_paid,
    total_cte.avg_hourly_fee,
    time_diff.lot_id as most_time_lot
from
    total_cte
inner join
    time_diff
on
    total_cte.car_id = time_diff.car_id
where
    time_diff.rnk = 1;
