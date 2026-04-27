use leetcode;

CREATE TABLE listings (
    listing_id INT PRIMARY KEY,
    host_id INT,
    location VARCHAR(50),
    room_type VARCHAR(50),
    price DECIMAL(10, 2),
    minimum_nights INT
);

INSERT INTO listings (listing_id, host_id, location, room_type, price, minimum_nights) VALUES
(1, 101, 'Downtown', 'Entire home/apt', 150.00, 2),
(2, 101, 'Downtown', 'Private room', 80.00, 1),
(3, 101, 'Downtown', 'Entire home/apt', 200.00, 3),
(4, 102, 'Downtown', 'Entire home/apt', 120.00, 2),
(5, 102, 'Downtown', 'Private room', 100.00, 1),
(6, 102, 'Midtown', 'Entire home/apt', 250.00, 2),
(7, 103, 'Midtown', 'Entire home/apt', 70.00, 1),
(8, 103, 'Midtown', 'Private room', 90.00, 1),
(9, 104, 'Midtown', 'Private room', 170.00, 1),
(10, 105, 'Uptown', 'Entire home/apt', 200.00, 2),
(11, 106, 'Downtown', 'Private room', 75.00, 1),
(12, 106, 'Midtown', 'Entire home/apt', 90.00, 2),
(13, 107, 'Midtown', 'Private room', 65.00, 1),
(14, 108, 'Downtown', 'Entire home/apt', 120.00, 2),
(15, 109, 'Uptown', 'Private room', 80.00, 1),
(16, 110, 'Queens', 'Entire home/apt', 110.00, 2),
(17, 110, 'Queens', 'Private room', 60.00, 1),
(18, 111, 'Brooklyn', 'Entire home/apt', 200.00, 3),
(19, 111, 'Brooklyn', 'Shared room', 40.00, 1),
(20, 112, 'Bronx', 'Private room', 55.00, 1);


CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    listing_id INT,
    checkin_date DATE,
    checkout_date DATE,
    FOREIGN KEY (listing_id) REFERENCES listings(listing_id)
);

INSERT INTO bookings (booking_id, listing_id, checkin_date, checkout_date) VALUES
(1, 1, '2023-01-05', '2023-01-10'),
(2, 1, '2023-01-11', '2023-01-13'),
(3, 2, '2023-01-15', '2023-01-25'),
(4, 3, '2023-01-10', '2023-01-17'),
(5, 3, '2023-01-19', '2023-01-21'),
(6, 3, '2023-01-22', '2023-01-23'),
(7, 4, '2023-01-03', '2023-01-05'),
(8, 5, '2023-01-10', '2023-01-12'),
(9, 6, '2023-01-15', '2023-01-19'),
(10, 6, '2023-01-20', '2023-01-22'),
(11, 7, '2023-01-25', '2023-01-29'),
(12, 8, '2023-01-05', '2023-01-17'),
(13, 9, '2023-01-10', '2023-01-12'),
(14, 10, '2023-01-05', '2023-01-09'),
(15, 10, '2023-01-12', '2023-01-17');

select * from listings;
select * from bookings;


with tbl as (
select
    bookings.listing_id as b_listing_id,
    listings.listing_id as l_listing_id,
    listings.location as location,
    listings.room_type as room_type,
    datediff(bookings.checkout_date, bookings.checkin_date) as days
from
    listings
inner join
    bookings
on
    listings.listing_id = bookings.listing_id),
answer as (
select
    location,
    room_type,
    sum(days) as total_days,
    count(distinct l_listing_id) as distinct_listings,
    sum(days)/(count(distinct l_listing_id)) as avg_book_days,
    row_number() over (partition by location order by sum(days)/(count(distinct l_listing_id)) desc ) as rno
from
    tbl
group by
    location,
    room_type)
select location,room_type,avg_book_days from answer where rno = 1 order by avg_book_days desc;