use online;

-- Create Contacts table
CREATE TABLE Contacts (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- Insert data into Contacts table
INSERT INTO Contacts (id, first_name, last_name) VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'Alice', 'Johnson'),
(4, 'Michael', 'Brown'),
(5, 'Emily', 'Davis');

-- Create Calls table
CREATE TABLE Calls (
    contact_id INT,
    type VARCHAR(10),
    duration INT,
    FOREIGN KEY (contact_id) REFERENCES Contacts(id)
);

-- Insert data into Calls table
INSERT INTO Calls (contact_id, type, duration) VALUES
(1, 'incoming', 120),
(1, 'outgoing', 180),
(2, 'incoming', 300),
(2, 'outgoing', 240),
(3, 'incoming', 150),
(3, 'outgoing', 360),
(4, 'incoming', 420),
(4, 'outgoing', 200),
(5, 'incoming', 180),
(5, 'outgoing', 280);


select * from Calls;

select * from Contacts;

with answer as (
select
    Calls.contact_id,
    Contacts.first_name,
    Calls.type,
    Calls.duration,
    dense_rank() over (partition by Calls.type order by duration desc ) as ranks
from
    Contacts
inner join
    Calls
on Contacts.id = Calls.contact_id)
select
    first_name,
    type,
    sec_to_time(duration) as duration_formatted
from
    answer
where
    ranks <=3;
