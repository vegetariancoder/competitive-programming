use namastesql;

CREATE TABLE creators (
    creator_id INT PRIMARY KEY,
    creator_name VARCHAR(20),
    followers INT
);

CREATE TABLE posts (
    post_id VARCHAR(3) PRIMARY KEY,
    creator_id INT,
    publish_date DATE,
    impressions INT,
    FOREIGN KEY (creator_id) REFERENCES creators(creator_id)
);

INSERT INTO creators (creator_id, creator_name, followers) VALUES
(1, 'Pavitra Nataraj', 900),
(2, 'Ankit Bansal', 150000),
(3, 'Rahul Gupta', 70000),
(4, 'Shomil Sharma', 55000),
(5, 'Neha Verma', 10000),
(6, 'Arjun Mehta', 4500),
(7, 'Kavya Sharma', 25000),
(8, 'Rishi Kapoor', 300000),
(9, 'Aditi Kasture', 120000),
(10, 'Vikram Rao', 600),
(11, 'Namrata Joshi', 70000),
(12, 'Sameer Malhotra', 9000),
(13, 'Sonia Dutta', 34000),
(14, 'Karan Thakur', 52000),
(15, 'Rahul Singh', 95000);

INSERT INTO posts (creator_id, post_id, publish_date, impressions) VALUES
(1, 'p1', '2023-12-03', 120000),
(2, 'p2', '2023-12-02', 51000),
(2, 'p3', '2023-12-09', 39000),
(2, 'p4', '2023-12-20', 42000),
(3, 'p5', '2023-11-20', 22000),
(3, 'p6', '2023-12-04', 32000),
(3, 'p7', '2023-12-10', 22000),
(3, 'p8', '2023-12-01', 41000),
(4, 'p9', '2023-12-03', 41000),
(4, 'p10', '2023-12-04', 71000),
(5, 'p11', '2023-10-15', 8000),
(6, 'p12', '2023-12-21', 600),
(7, 'p13', '2023-12-19', 1500),
(8, 'p14', '2023-09-05', 95000),
(8, 'p15', '2023-12-07', 35000),
(8, 'p16', '2023-12-18', 42000),
(9, 'p17', '2023-12-25', 36000),
(9, 'p18', '2023-12-05', 45000),
(9, 'p19', '2023-12-14', 38000),
(9, 'p20', '2023-12-28', 42000),
(10, 'p21', '2023-11-30', 200),
(11, 'p22', '2023-12-06', 30000),
(11, 'p23', '2023-12-15', 42000),
(11, 'p24', '2023-12-22', 35000),
(12, 'p25', '2023-12-10', 900),
(13, 'p26', '2023-12-03', 1500),
(14, 'p27', '2023-12-09', 21000),
(15, 'p28', '2023-12-05', 48000),
(15, 'p29', '2023-12-12', 31000),
(15, 'p30', '2023-12-20', 40000);


select * from creators;

select * from posts;



with top_voice as (
select
    creators.creator_name,
    count(post_id) as no_of_posts,
    sum(impressions) as total_impressions
from
    creators
inner join
    posts
on
    posts.creator_id = creators.creator_id
where
    followers > 50000 and substring(publish_date, 1, 7) = '2023-12'
group by
    creators.creator_name)
select * from top_voice where total_impressions > 100000 and no_of_posts >= 3 order by total_impressions desc;