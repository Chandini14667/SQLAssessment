create database KeepNote
use KeepNote 
Create Table UserRecords 
(
user_id varchar(6) primary key, 
user_name varchar(20),
user_added_date date,
user_password varchar(20),
user_mobile varchar(10)
)
Create Table NoteRecords 
(
note_id int primary key, 
note_title varchar(50),
note_content varchar(100),
note_status varchar(30),
note_creation_date date,
user_id varchar(6) references UserRecords(user_id)
)
Create Table CategoryRecords 
(
category_id int primary key, 
category_name varchar(50),
category_descr varchar(100),
category_creation_date date,
category_creator varchar(6) references UserRecords(user_id)
)
Create Table ReminderRecords 
(
reminder_id int primary key, 
reminder_name varchar(50),
reminder_descr varchar(100),
reminder_type varchar(50),
reminder_creation_date date,
reminder_creator varchar(6) references UserRecords(user_id)
)
Create Table NoteCategory
(
notecategory_id int primary key,
note_id int references NoteRecords(note_id),
category_id int references CategoryRecords(category_id)
)
Create Table NoteReminder
(
notereminder_id int,
note_id int references NoteRecords(note_id),
reminder_id int references ReminderRecords(reminder_id)
)
Insert into UserRecords values ('112233', 'Maya', '2019-01-02', 'Maya1214', '8012345679'),('112244', 'Nair', '2019-01-11', 'Welcome', '9023778467')
select * from UserRecords
Insert into NoteRecords values (1, 'Today Tasks', '1.Check emails and reply to them 2.Start the pro...', 'InProgress','2019-01-21', '112233'),(2, 'Training to plan', '1.Application related 2.Technical related', 'YetToStart','2019-01-31', '112244'),(3, 'Things to have today', '1.Friuts 2.More water', 'InProgress','2019-01-25', '112244')
select * from NoteRecords 
Insert into CategoryRecords values (1, 'Offical', 'Office related notes', '2019-01-21', '112233'),(2, 'Diet', 'Health related notes', '2019-01-24', '112244')
select * from CategoryRecords 
Insert into ReminderRecords values (1, 'KT reminder', 'Session on technical queries','Office Reminders', '2019-02-12', '112233'),(2, 'Personal reminder', 'Pick children', 'Personal Reminders','2019-02-14', '112244')
select * from ReminderRecords 
Insert into NoteCategory values (1,1,1),(2,2,1),(3,3,2)
select * from NoteCategory 
Insert into NoteReminder values (1,3,2),(2,2,1)
select * from NoteReminder 
