use leetcode;

CREATE TABLE Subscriptions (
  account_id int,
  start_date date,
  end_date date
);

INSERT into Subscriptions values (9,'2020-02-18','2021-10-30'),
                                (3,'2021-09-21','2021-11-13'),
                                (11,'2020-02-28','2020-08-18'),
                                (13,'2021-04-20','2021-09-22'),
                                (4,'2020-10-26','2021-05-08'),
                                (5,'2020-09-11','2021-01-17');


CREATE TABLE Streams (
  session_id int,
  account_id int,
  stream_date date
);

INSERT into Streams values (14,9,'2020-05-16'),
                                (16,3,'2021-10-27'),
                                (18,11,'2020-04-29'),
                                (17,13,'2021-08-08'),
                                (19,4,'2020-12-31'),
                                (13,5,'2021-01-05');



select
    count(distinct account_id) as accounts_count
from
    Subscriptions
left join
    Streams
using (account_id)
where
    Year(Subscriptions.start_date) <= 2021 and Year(Subscriptions.end_date) >=2021 and (YEAR(stream_date) != 2021);