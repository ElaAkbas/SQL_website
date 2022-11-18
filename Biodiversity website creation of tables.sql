create database website
use website 



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
-- drop login Frederic -- testing to drop users 
-- drop user Frederic 


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


create table customer (
id int primary key identity(1,1), --join to account.customer_id
first_name varchar(50),
last_name varchar(50),
[password] varchar(400),
age int, 
email varchar(50) unique,
gender varchar(20)  --F for female, M for male (O for other)
)

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
