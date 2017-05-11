/*Alter table to change coursedate to text*/
ALTER TABLE courses ALTER COLUMN coursedate TYPE varchar;
select from courses where courseid = 1;
update courses set coursedate = '6/22/2017-6/23/2017' where courseid = 1;
select from courses where courseid = 1;
/*-------------------------------*/