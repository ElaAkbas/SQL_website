create database website
use website 

create database website1


ALTER DATABASE website1
SET MULTI_USER; -- set database to multi-user so everyone can see the same result 

CREATE LOGIN Frederic   
    WITH PASSWORD = '123';  
CREATE USER Frederic FOR LOGIN Frederic;  -- admin is one who created them
CREATE LOGIN Kyriakos   
    WITH PASSWORD = '123';  
CREATE USER Kyriakos FOR LOGIN Kyriakos;  -- admin is one who created them
CREATE LOGIN Ege   
    WITH PASSWORD = '123';  
CREATE USER Ege FOR LOGIN Ege;  -- admin is one who created them
CREATE LOGIN Jason   
    WITH PASSWORD = '123';  
CREATE USER Jason FOR LOGIN Jason;  -- admin is one who created them
CREATE LOGIN Ela   
    WITH PASSWORD = '123';  
CREATE USER Ela FOR LOGIN Ela;  -- admin is one who created them
drop login Frederic -- testing to drop users 
drop user Frederic 


IF EXISTS(SELECT 1 FROM sys.Objects
WHERE Object_id = OBJECT_ID(N'customer')
AND Type = N'U')
BEGIN
PRINT 'Table exists.'
END

ELSE
BEGIN
create table customer(
id int primary key identity(1,1), --join to account.customer_id
first_name varchar(50),
last_name varchar(50),
[password] varchar(400),
age int, 
email varchar(50) unique,
gender varchar(20)  --F for female, M for male (O for other)
)
END

IF EXISTS(SELECT 1 FROM sys.Objects
WHERE Object_id = OBJECT_ID(N'account')
AND Type = N'U')
BEGIN
PRINT 'Table exists.'
END

ELSE
BEGIN
create table account(
id int primary key identity(1,1), --join to files.account_id and feedback.account_id
employee_id int,--join to employee.id
customer_id int, --join to customer.id
islogin bit, --we will turn this off for pushing features (CI/CD concept), prediction? chose bit because it is yes or no
lastupdated datetime, --when password changed
lastupdatedreason varchar, --change password/username
lastupdatedby int, --employee id
prediction varchar(50) --predict uploaded image, will show most recent prediction
)
END

IF EXISTS(SELECT 1 FROM sys.Objects
WHERE Object_id = OBJECT_ID(N'files')
AND Type = N'U')
BEGIN
PRINT 'Table exists.'
END

ELSE
BEGIN
create table files(
id int primary key identity(1,1), 
file_path varchar(max), --path to find file
file_type varchar(50), --sound, image, image_pp
date_time datetime, --when is file created
account_id int --join to account.id
)
END

IF EXISTS(SELECT 1 FROM sys.Objects
WHERE Object_id = OBJECT_ID(N'feedback')
AND Type = N'U')
BEGIN
PRINT 'Table exists.'
END

ELSE
BEGIN
create table feedback(
id int primary key identity(1,1), 
account_id int, --join to account.id
feedback_button varchar(20), 
feedback_text varchar(200), 
issue varchar(50), --'in progress' 'solved' or 'cancelled' (could not find anything to just store three options? so varchar is the best option I think)
solved_by int--join to employee.id
)
END

IF EXISTS(SELECT 1 FROM sys.Objects
WHERE Object_id = OBJECT_ID(N'employee')
AND Type = N'U')
BEGIN
PRINT 'Table exists.'
END

ELSE
BEGIN
create table employee(
id int primary key identity(1,1), 
first_name varchar(50),
last_name varchar(50),
age int, 
email varchar(60) unique,
gender char(1),
position varchar(30)
)
END

IF EXISTS(SELECT 1 FROM sys.Objects
WHERE Object_id = OBJECT_ID(N'issue')
AND Type = N'U')
BEGIN
PRINT 'Table exists.'
END

ELSE
BEGIN
create table issue(
id int primary key identity(1,1), 
issue_ varchar(200),
[type] varchar(20), --banned or deleted?
solution_by int --join to employee.id
)
END

drop table customer
drop table account
drop table files
drop table feedback
drop table employee
drop table issue


create table customer (
id int primary key identity(1,1), --join to account.customer_id
first_name varchar(50),
last_name varchar(50),
[password] varchar(400),
age int, 
email varchar(50) unique,
gender varchar(20)  --F for female, M for male (O for other)
)

select * from customer
select * from account
select * from feedback
 

create table account (
id int primary key identity(1,1), --join to files.account_id and feedback.account_id
employee_id int,--join to employee.id
customer_id int, --join to customer.id
islogin bit, --we will turn this off for pushing features (CI/CD concept), prediction? chose bit because it is yes or no
lastupdated datetime, --when password changed
lastupdatedreason varchar, --change password/username
lastupdatedby int, --employee id
prediction varchar(50) --predict uploaded image, will show most recent prediction
)


create table files(
id int primary key identity(1,1), 
file_path varchar(max), --path to find file
file_type varchar(50), --sound, image, image_pp
date_time datetime, --when is file created
account_id int --join to account.id
)


create table feedback(
id int primary key identity(1,1), 
account_id int, --join to account.id
feedback_button varchar(20), 
feedback_text varchar(200), 
issue varchar(50), --'in progress' 'solved' or 'cancelled' (could not find anything to just store three options? so varchar is the best option I think)
solved_by int--join to employee.id
)


create table employee(
id int primary key identity(1,1), 
first_name varchar(50),
last_name varchar(50),
age int, 
email varchar(60) unique,
gender char(1),
position varchar(30)
)

create table issue(
id int primary key identity(1,1), 
issue_ varchar(200),
[type] varchar(20), --banned or deleted?
solution_by int --join to employee.id
)
/* -- This is not needed at this point since we do not yet have any data, joining on the tables will return empty results 
select * 
from customer as c
left join account as a
on c.id = a.customer_id


select * 
from account as a
left join files as f 
on a.id = f.account_id
left join feedback as fb
on a.id = fb.account_id


select *
from employee as e
left join account as a
on e.id = a.employee_id
left join feedback as fb
on e.id = fb.solved_by
left join issue as i
on e.id = i.solution_by
*/ 

-- Commit messages: Added primary key constraint to all Id columns. Inserted synthetic data into tables for testing and wrote all necessary queries for features in our website. Also added addition columns that are missing such as feedback_and issue_.

--add info test
drop database website 
delete customer; 
select * from customer, account -- default is cross apply on everything 
insert into customer values ('zero','zero_',23,'zero@gmail.com','M') -- https://community.atlassian.com/t5/Bitbucket-questions/If-a-pull-request-is-not-yet-closed-can-I-create-one-more-pull/qaq-p/1345302
insert into customer values ('one','one_',23,'one@gmail.com','M')
insert into customer values ('two','two_',23,'two@gmail.com','M')

insert into account values (NULL,1,'adsf',0,getdate(),NULL,NULL)
insert into account values (NULL,2,'adsf',0,getdate(),NULL,NULL)
insert into account values (NULL,3,'adsf',0,getdate(),NULL,NULL)
insert into account values (NULL,4,'adsf',0,getdate(),NULL,NULL)

insert into employee values ('ezero','ezero_',23,'ezero@gmail.com','M','software engineer') 
insert into employee values ('eone','eone_',23,'eone@gmail.com','M','cloud engineer')
insert into employee values ('etwo','etwo_',23,'etwo@gmail.com','M','data scientist')

insert into feedback values (1,'review','I like this website',NULL,NULL)
insert into feedback values (2,'review','I dislike this website',NULL,NULL)

insert into files values ('/user/123.png','image',getdate(),1)
insert into files values ('/user/100.png','image',getdate(),2)
insert into files values ('/user/123.wav','sound',getdate(),3)

insert into issue values ('account id 1 has been banned due to innapropriate use','banned',null)
insert into issue values ('account id 2 has been banned due to spamming','banned',null)
insert into issue values ('account id 3 has been deleted as per user''s request','deleted',null) -- escape ' with '' 

select * from customer 
select * from account 
select * from employee 
select * from files  
select * from feedback
select * from issue 

select * from customer c join account a on c.id = a.customer_id 

