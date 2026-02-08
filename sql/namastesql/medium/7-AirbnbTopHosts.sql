use leetcode;

-- Table for Listings
CREATE TABLE listings (
    listing_id INT PRIMARY KEY,
    host_id INT,
    neighborhood VARCHAR(50),
    room_type VARCHAR(50),
    price DECIMAL(10, 2),
    minimum_nights INT
);

-- Table for Reviews
CREATE TABLE reviews (
    review_id INT PRIMARY KEY,
    listing_id INT,
    review_date DATE,
    rating INT,
    FOREIGN KEY (listing_id) REFERENCES listings(listing_id)
);

INSERT INTO listings (listing_id, host_id, neighborhood, room_type, price, minimum_nights) VALUES
(1, 101, 'Downtown', 'Entire home/apt', 150.00, 2),
(2, 101, 'Downtown', 'Private room', 80.00, 1),
(3, 101, 'Downtown', 'Entire home/apt', 200.00, 3),
(4, 102, 'Downtown', 'Entire home/apt', 120.00, 2),
(5, 102, 'Downtown', 'Private room', 100.00, 1),
(6, 102, 'Midtown', 'Entire home/apt', 250.00, 2),
(7, 103, 'Midtown', 'Private room', 70.00, 1),
(8, 103, 'Queens', 'Private room', 90.00, 1),
(9, 104, 'Midtown', 'Private room', 170.00, 1);


INSERT INTO reviews (review_id, listing_id, review_date, rating) VALUES
(1, 1, '2023-01-05', 4),
(2, 1, '2023-01-10', 5),
(3, 2, '2023-01-15', 4),
(4, 3, '2023-01-20', 5),
(5, 3, '2023-01-25', 3),
(6, 3, '2023-01-30', 4),
(7, 4, '2023-02-05', 5),
(8, 5, '2023-02-10', 4),
(9, 6, '2023-02-15', 5),
(10, 6, '2023-02-20', 4),
(11, 7, '2023-02-25', 5),
(12, 8, '2023-03-05', 5),
(13, 9, '2023-03-05', 5);


select * from listings;
select * from reviews;



select
    host_id,
    count(distinct listings.listing_id) as no_of_listings,
    round(avg(rating),2) as avg_rating
from
    listings
inner join
    reviews
on listings.listing_id = reviews.listing_id
group by
    host_id
having
    no_of_listings >= 2
order by
    avg_rating desc limit 2;