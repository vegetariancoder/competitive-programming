use leetcode;

-- Create the Tweets table
CREATE TABLE Tweets (
    user_id INT,
    tweet_id INT,
    tweet VARCHAR(255),
    tweet_date DATE
);

-- Insert data into the Tweets table
INSERT INTO Tweets (user_id, tweet_id, tweet, tweet_date) VALUES
(135, 13, 'Enjoying a great start to the day! #HappyDay', '2024-02-01'),
(136, 14, 'Another #HappyDay with good vibes!', '2024-02-03'),
(137, 15, 'Productivity peaks! #WorkLife', '2024-02-04'),
(138, 16, 'Exploring new tech frontiers. #TechLife', '2024-02-04'),
(139, 17, 'Gratitude for today''s moments. #HappyDay', '2024-02-05'),
(140, 18, 'Innovation drives us. #TechLife', '2024-02-07'),
(141, 19, 'Connecting with nature''s serenity. #Nature', '2024-02-09');

-- Optional: Verify the data insertion
SELECT * FROM Tweets;

select
    regexp_substr(tweet,'#\\w+') as hashtag,
    count(*) as hashtag_cnt
from
    Tweets
group by hashtag
order by 2 desc , 1 desc
limit 3;