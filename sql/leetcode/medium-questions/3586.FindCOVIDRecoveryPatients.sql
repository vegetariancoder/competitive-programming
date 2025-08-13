use leetcode;

CREATE TABLE patients (
    patient_id INT,
    patient_name VARCHAR(255),
    age INT
)
CREATE TABLE covid_tests (
    test_id INT,
    patient_id INT,
    test_date DATE,
    result VARCHAR(50)
)

insert into patients (patient_id, patient_name, age) values ('1', 'Alice Smith', '28')
insert into patients (patient_id, patient_name, age) values ('2', 'Bob Johnson', '35')
insert into patients (patient_id, patient_name, age) values ('3', 'Carol Davis', '42')
insert into patients (patient_id, patient_name, age) values ('4', 'David Wilson', '31')
insert into patients (patient_id, patient_name, age) values ('5', 'Emma Brown', '29')

insert into covid_tests (test_id, patient_id, test_date, result) values ('1', '1', '2023-01-15', 'Positive')
insert into covid_tests (test_id, patient_id, test_date, result) values ('2', '1', '2023-01-25', 'Negative')
insert into covid_tests (test_id, patient_id, test_date, result) values ('3', '2', '2023-02-01', 'Positive')
insert into covid_tests (test_id, patient_id, test_date, result) values ('4', '2', '2023-02-05', 'Inconclusive')
insert into covid_tests (test_id, patient_id, test_date, result) values ('5', '2', '2023-02-12', 'Negative')
insert into covid_tests (test_id, patient_id, test_date, result) values ('6', '3', '2023-01-20', 'Negative')
insert into covid_tests (test_id, patient_id, test_date, result) values ('7', '3', '2023-02-10', 'Positive')
insert into covid_tests (test_id, patient_id, test_date, result) values ('8', '3', '2023-02-20', 'Negative')
insert into covid_tests (test_id, patient_id, test_date, result) values ('9', '4', '2023-01-10', 'Positive')
insert into covid_tests (test_id, patient_id, test_date, result) values ('10', '4', '2023-01-18', 'Positive')
insert into covid_tests (test_id, patient_id, test_date, result) values ('11', '5', '2023-02-15', 'Negative')
insert into covid_tests (test_id, patient_id, test_date, result) values ('12', '5', '2023-02-20', 'Negative');

select * from patients;
select * from covid_tests;

with first_positive as (
select
    patient_id,
    min(test_date) as first_positive_date
from
    covid_tests
where
    result = 'Positive'
group by patient_id),
first_negative as (
select
    first_positive.patient_id,
    min(covid_tests.test_date) as first_negative_test
from
    first_positive
left join
    covid_tests
on
    first_positive.patient_id = covid_tests.patient_id and first_positive.first_positive_date < covid_tests.test_date
where
    covid_tests.result = 'Negative'
group by first_positive.patient_id),
result as (
select
    first_negative.patient_id,
    first_positive_date,
    first_negative_test
from
    first_positive
inner join
    first_negative
on first_positive.patient_id = first_negative.patient_id)
select
    result.patient_id,
    patients.patient_name,
    patients.age,
    datediff(result.first_negative_test,result.first_positive_date) as recovery_time
from
    result
inner join
    patients
on result.patient_id = patients.patient_id
order by recovery_time,patient_name;

