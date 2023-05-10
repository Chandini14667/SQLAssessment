use KeepNote 
select * from UserRecords 
select * from NoteRecords  
select * from CategoryRecords  
select * from ReminderRecords 
select * from NoteCategory  
select * from NoteReminder 

--Fetch the row from User table with Id=112233 and Password=’Maya1214’
select * from UserRecords where user_id='112233' and user_password='Maya1214'

--Fetch all the rows from Note table with note_creation_date=’01/31/2019’
select * from NoteRecords where note_creation_date='2019-01-31'

--Fetch all the Categories created after ‘01/22/2019’
select * from CategoryRecords where category_creation_date >'2019-01-22'

--Fetch all category details which belongs to note with note id=1........
select * from CategoryRecords where category_id = (select category_id from NoteRecords where note_id = 1 and category_creator = user_id )

--Fetch all the Notes from the Note table with userId=112244
select * from NoteRecords where user_id='112244'

--Fetch all the Notes from the Note table for category_id=1..........
select * from NoteRecords where  user_id = (select category_creator from CategoryRecords where category_id = 1)

--Fetch all the reminder details for note id=2.........
select * from ReminderRecords where  reminder_creator = (select user_id from NoteRecords where note_id = 2)

--Write a query to change the note_status to ‘Completed’ with note Id=3
update NoteRecords set note_status='Completed' where note_id=3

--Write a query to set a reminder of type ‘Personal Reminders’ for Note with note id=1. [Find reminder id based upon reminder_type]
update ReminderRecords
set reminder_type = 'Personal Reminder'
where reminder_creator = (select user_id from NoteRecords  where note_id = 1)

--Write a query to remove all reminders from Note with note_id=2......
delete from ReminderRecords where reminder_creator = (select user_id from NoteRecords where note_id = 2)