use leetcode;

CREATE TABLE titanic (
    passengerid INT PRIMARY KEY,
    survived TINYINT,
    pclass TINYINT,
    name TEXT,
    sex VARCHAR(10),
    age DECIMAL(4,2),
    sibsp INT,
    parch INT,
    ticket VARCHAR(50),
    fare DECIMAL(8,2),
    cabin VARCHAR(50),
    embarked CHAR(1)
);

INSERT INTO titanic (passengerid, survived, pclass, name, sex, age, sibsp, parch, ticket, fare, cabin, embarked) VALUES
(1, 0, 3, 'Braund, Mr. Owen Harris', 'male', 22, 1, 0, 'A/5 21171', 7.25, NULL, 'S'),
(2, 1, 1, 'Cumings, Mrs. John Bradley (Florence Briggs Thayer)', 'female', 38, 1, 0, 'PC 17599', 71.28, 'C85', 'C'),
(3, 1, 3, 'Heikkinen, Miss. Laina', 'female', 26, 0, 0, 'STON/O2. 3101282', 7.92, NULL, 'S'),
(4, 1, 1, 'Futrelle, Mrs. Jacques Heath (Lily May Peel)', 'female', 35, 1, 0, '113803', 53.10, 'C123', 'S'),
(5, 0, 3, 'Allen, Mr. William Henry', 'male', 35, 0, 0, '373450', 8.05, NULL, 'S'),
(6, 0, 3, 'Moran, Mr. James', 'male', NULL, 0, 0, '330877', 8.46, NULL, 'Q'),
(7, 0, 1, 'McCarthy, Mr. Timothy J', 'male', 54, 0, 0, '17463', 51.86, 'E46', 'S'),
(8, 0, 3, 'Palsson, Master. Gosta Leonard', 'male', 2, 3, 1, '349909', 21.07, NULL, 'S'),
(9, 1, 3, 'Johnson, Mrs. Oscar W (Elisabeth Vilhelmina Berg)', 'female', 27, 0, 2, '347742', 11.13, NULL, 'S'),
(10, 1, 2, 'Nasser, Mrs. Nicholas (Adele Achem)', 'female', 14, 1, 0, '237736', 30.07, NULL, 'C');


with first as (
select
    survived,
    count(*) as first_class
from
    titanic
where
    pclass = 1
group by
    survived),
second as (
    select
    survived,
    count(*) as second_class
from
    titanic
where
    pclass = 2
group by
    survived
),
third as (
    select
    survived,
    count(*) as third_class
from
    titanic
where
    pclass = 3
group by
    survived
)

select
       first.survived,
       ifnull(first_class,0) as first_class,
       ifnull(second_class,0) as second_class,
       ifnull(third_class,0) as third_class
from
     first left join second on first.survived = second.survived
left join third on second.survived = third.survived;



