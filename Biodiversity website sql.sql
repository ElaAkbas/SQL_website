
use website 


create table customer (
id int, --join to account.customer_id
first_name varchar(50),
last_name varchar(50),
age int, 
email varchar(50),
gender char(1)  --F for female, M for male (O for other)
)

create table account (
id int, --join to files.account_id and feedback.account_id
employee_id int,--join to employee.id
customer_id int, --join to customer.id
[password] varchar(50),
islogin bit, --we will turn this off for pushing features (CI/CD concept), prediction? chose bit because it is yes or no
lastupdated datetime, --when password changed
lastupdatedreason varchar, --change password/username
lastupdatedby int --employee id
)

create table files(
id int, 
file_path varchar(max), --path to find file
file_type varchar(50), --sound, image, image_pp
date_time datetime, --when is file created
account_id int --join to account.id
)


create table feedback(
id int, 
account_id int, --join to account.id
feedback_type varchar, --button or text, is it also varchar for the button type?
issue varchar, --'in progress' 'solved' or 'cancelled' (could not find anything to just store three options? so varchar is the best option I think)
solved_by varchar --join to employee.id
)

create table employee(
id int, 
first_name varchar(50),
last_name varchar(50),
age int, 
email varchar(60),
gender char(1),
position varchar(30)
)

create table issue(
id int, 
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


--add info test
select * from customer 
insert into customer values (1,'Martk','Kleinsma',23,'Marklein@gmail.com','M')


