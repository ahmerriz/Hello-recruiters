create database StudentRecords
go
create schema school
create table school.tasks (Id Int not null, Name varchar (40) not null)
create table school.reports (Id int not null, task_ID int not null, candidate varchar (40) not null, score int not null)
 
insert into school.tasks values (101,'MiniDist')
insert into school.tasks values (102,'Equi')
insert into school.tasks values (103,'Median')
insert into school.tasks values (104,'Tricoloring')
insert into school.tasks values (105,'WordSearch')
insert into school.tasks values (106,'Counterstrike')
insert into school.tasks values (107,'Mario')
insert into school.tasks values (108,'Flappybird')
insert into school.tasks values (109,'PubG')
insert into school.tasks values (110,'Chess')


select * from school.reports
select * from school.tasks
delete from school.reports where ID=8
insert into school.reports values (1,101,'John',100)
insert into school.reports values (2,102,'Delaney',75)
insert into school.reports values (3,103,'Monroe',55)
insert into school.reports values (4,104,'Stanley',49)
insert into school.reports values (5,105,'Tanner',18)
insert into school.reports values (6,106,'Lara',24)
insert into school.reports values (7,107,'Peter',0)
insert into school.reports values (8,108,'Rick',34)
insert into school.reports values (9,109,'Patrick',44)
insert into school.reports values (10,110,'Ryan',89)

select 
CASE when avg (score)  > 60 then 'Easy' when avg (score) between 20 and 60 then 'Medium' when avg (score) < 20 then 'Hard' 
End as Difficulty,
sr.task_ID, avg (sr.score) as Average, st.Name from school.reports as sr
join school.tasks as st on sr.task_ID=st.ID
group by sr.task_ID, st.Name
order by sr.task_ID asc
