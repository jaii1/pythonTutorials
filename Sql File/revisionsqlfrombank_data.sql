use naya_1;
select * from bank2;
show tables;
select * from bank_info;
desc bank2;
select * from bank2
where salary>30000;
-- 1st highest salary from bank2
select * from bank2
order by salary desc limit 1;

-- 2nd Highest salary
select * from bank2
order by salary desc limit 1,1;

select * from bank_info;
-- we want records showing city gurgaon and salary more than 50000
select * from bank_info
where city='Gurgaon' and salary>50000;

desc bank_info; 
-- 3RD highest salary
select * from bank_info
order by salary desc limit 2,1;
-- now only 3rd highest salary &country
select salary,country from bank_info
order by salary desc limit 2,1;

-- Q--- show first 3 highest salary only
select salary from bank_info
order by salary desc limit 3;
select * from bank_info;
-- Q--- update country india to india1 in bankinfo where client 2&5
update bank_info
set country ='India2'
where client_id = 2 and 5;
-- again back to india
update bank_info
set country = 'India'
where client_id=2;
-- Q--- entire records from city 'panipat'&'sonipat'
select * from bank_info where city in('Panipat','Sonipat');
-- Q--- We want entire first and the last records from bank_info table 
(select * from bank_info order by client_id asc limit 1) 
union 
(select * from bank_info order by client_id desc limit 1);

-- Q-- highest salary for city Gurgaon
select max(salary) as MaxGurgaonSalary,city  from bank_info
where city ='Gurgaon'; 
-- similarly minimum
select min(salary) as MinGurgaonSalary ,city from bank_info
where city = 'Gurgaon';
show index from bank_info;
desc bank2;
-- --Q- Adding unique key constraint to city column of bank2 table
select * from bank2;
update bank2
set city ='Lucknow' 
where client_id=4 ;

update bank2
set city ='Ambala'
where client_id=7;

-- --Q-now adding unique constraint to city column in bank2 table 
alter table bank2
add unique(city);
desc bank2; 
show index from bank2; 
-- Q-now if we want to remove unique constraint from city column from bank2 table then see below 
alter table bank2
drop index city;
desc bank2; 
show index from bank2;
select * from bank2;
-- we can create multiple unique constraint in a table but only one primary key(which is unique and not null) 
-- IMPORTANT TAKEAWAY REGARDING UNIQUE CONSTRAINT
-- While creating table if we want to add unique constraint then
-- suppose adding unique on 1 column(city)
--  unique(city);
-- adding unique on multiple column of a table(city,person)
-- constraint uc_person unique(person,city);

-- Q-now again implementing unique constraint on table bank2 but on 2 columns i.e on city and salary
desc bank2; 
alter table bank2
add constraint uc_person unique(salary,city);

-- Q-now dropping unique from both colums
alter table bank2
drop index uc_person;
desc bank2; 
show index from bank2; 

-- NOTE BELOW:-
-- To drop primary key from bank2 table, we use
-- alter table bank2
-- drop primary key

-- creating new table corolwood_detail 
create table corolwood(
block_id int,
block_name varchar(50) not null,
size int not null,
city varchar(60) default 'Gurgaon',
manegers varchar(255),
primary key(block_id)
);
select * from corolwood; 
desc corolwood;
show index from corolwood; 
insert into corolwood(block_id,block_name,size,manegers)
values(1,'A',200,'jaiTiwari'),
(2,'B',300,'jaiKishore');

-- After creating table now if again want block_id 3&4 then we use insert command, see below
insert into corolwood(block_id,block_name,size,manegers)
values(3,'C',500,'RaviTiwari'),
(4,'D',340,null);

-- Q-find size where there is no maneger
select size from corolwood
where manegers IS NULL;

select * from corolwood;
use naya_1;
show tables; 
desc corolwood; 
show index from corolwood;

-- Q- Now dropping default constraint from city column from corolwood table, ok 

-- ---dropping default constraint from column city from corolwood table 
alter table corolwood
alter city drop default; 
desc corolwood;
select * from corolwood;

-- now  again adding default constraint to the table corolwood city column through alter command; 

alter table corolwood
alter city set default 'Lucknow'; 
select * from corolwood;
-- remember date is string in yyyy-mm-dd and in numbers like yyyymmdd

insert into corolwood(block_id,block_name,size,manegers)
values(5,'E',500,'Sam');
desc corolwood; 
show index from corolwood; 

-- Q-- vehicle start with m in bank_info; 
select * from bank_info
where vehicle LIKE 'm%'; 
-- Q-- vehicle start with mah in bank_info; 

select * from bank_info
where vehicle LIKE 'mah%';
-- Q-- vehicle end  with 't' in bank_info; 
select * from bank_info
where vehicle LIKE '%t'; 

select * from bank_info; 
-- Q-- vehicle name contains 'on' in bank_info; 
select * from bank_info
where vehicle LIKE '%on%';
select * from bank2; 
-- Q-table name changed to bank21 

alter table bank2
rename to bank21;
select * from bank21;

-- adding column product and price to the bank21 table 
alter table bank21
add column product varchar(200) not null,
add column price int; 
select * from bank21;

-- give product name =laptop where client_id is 4&7;(bank21)

update bank21
set product ="Laptop" where client_id IN(4,7);
select * from bank21;
update bank21
set product = "Eardopes"
where client_id=1;

update bank21
set price = 45000
where client_id=4;
select * from bank21; 
update bank21
set price =50000
where client_id=7;
update bank21
set price=1600
where client_id=1;

-- finding min,max avg,sum of salary from bank21
select min(salary) as min_salary from bank21;
select max(salary) as max_salary from bank21;
select sum(salary)as total_salary from bank21;
select avg(salary) as avg_salary from bank21;

desc bank21;
-- Q now we are changing varchar from 200to 100  and constraint  not null to null of product column from bank21 table]
alter table bank21
modify column product varchar(100) null; 
desc naya_1;
-- Again modifying same column with 150 varchar and not null 
use hungry;
alter table bank21
modify column product varchar(150) not null;
desc bank21;
show index from bank21;
select * from bank_info; 
-- Q-find avg of salary from india from bank_info table 
select avg(salary) as AvgIndiaSalary from bank_info
where country ='India';

-- Q-we want each country and their average salary from bank_info table 
select country, avg(salary) as Avg_Salary from bank_info 
group by country
order by avg(salary) desc;
drop table bank_info1;
-- Q-We want all records where email having null values 
select * from bank_info 
where email IS NULL;

-- Q- we want each city and its average salary
select city,avg(salary) as Avg_City_Salary from bank_info
group by city
order by avg(salary) desc;

-- Q-Now we want avg salary by each city in decending order and too greater than 40000;
select city,avg(salary) as Avg_City_Salary 
from bank_info
group by city
having avg(salary) >40000
order by avg(salary) desc;

-- Q-We want all email with  null value
select * from bank_info
where email IS NULL;

-- - Q-We want all country where email is null; 
select country, email from bank_info
where email IS NULL; 
-- now finding person in each department with highest salary(IMPORTANT)
select * from someemployeedetails; 
-- first of all dept with highest salary 
select * from someemployeedetails D join
(select department, max(salary)salary from someemployeedetails
group by department)E 
on D.department = E.department and
D.salary = E.salary;
use naya_1; 
show tables;
-- Q-FINDING HIGHEST SALARY BY USING VARIOUS METHODS
-- Now we want to, find out here, highest salary(suppose here 3rd highest) by using various methods
-- 1)limit
-- 2)max() method
-- 3)self join
-- 4)dense_rank()
 
-- --Now By using max() method we are finding second & third highest salary  
select firstname,max(salary) as max_salary from someemployeedetails
where salary<(select max(salary) from someemployeedetails);
--  Now 3rd highest salary

select max(salary) as max_salary from someemployeedetails
where salary<(select max(salary) from someemployeedetails where salary<(select max(salary) from someemployeedetails));

-- by using limit we are finding 3rd highest salary

select firstname,salary from someemployeedetails 
order by salary desc 
limit 2,1; 

-- By using self join we are finding 3rd highest salary 

select salary from someemployeedetails e1 where 3-1 = (select count(distinct salary) from someemployeedetails e2
where e1.salary < e2.salary);

-- By using dense_rank() method
select * from
(select firstname, salary,dense_rank() over(order by salary desc) as salary_rank
from someemployeedetails) as temp
where salary_rank =3;

#with respect to each departments(dimension table) we want total number of employees21(fact table) dept_id common column
use jai_84;
show tables;
select * from employees21;
select * from departments; 
select departments.Department_Name, count(employees21.EmployeeName) as Total_Employees
from departments inner join employees21 
On departments.departmentId = employees21.departmentId 
group by Department_Name
having count(employees21.EmployeeName)>3
order by Total_Employees desc;

-- now we only want Department Name with highest number of employees

show tables;
select departments.Department_Name
from departments inner join employees21 
on departments.DepartmentID = employees21.DepartmentID 
group by Department_Name
having count(employees21.EmployeeName)>3
order by count(employees21.EmployeeName) desc
limit 1;

-- FINDING DUPLICATES FROM TABLE COLUMNS BY USING VARIOUS METHODS(BY tech TFQ youtube channel, sample data is there) 
use naya_1;
show tables; 
create table if not exists cars(
id int,
model varchar(50) not null,
brand varchar(40),
color varchar(30),
make int not null,
primary key(id)
);

desc cars; 
insert into cars(id,model,brand,color,make)
values(1, 'Model S', 'Tesla', 'Blue', 2018),
(2, 'EQS', 'Mercedes-Benz', 'Black', 2022),
(3, 'iX', 'BMW', 'Red', 2022),
(4, 'Ioniq 5', 'Hyundai', 'White', 2021),
(5, 'Model S', 'Tesla', 'Silver', 2018),
(6, 'Ioniq 5', 'Hyundai', 'Green', 2021);

select * from cars;
-- now we can see there are duplicate value are there in model and brand column of cars table, so we will remove it 
-- 1)by using unique Identifier

select model, brand, count(*) from cars
group by model,brand;

-- now we take more than 1 count of model&brand bcoz they are duplicates
use naya_1;
select model, brand, count(*) from cars
group by model,brand
having count(*)>1; 

-- finding id of those counts more than 1

select model,brand,max(id)
from cars
group by model,brand
having count(*)>1;

select max(id) from cars
group by model,brand
having count(*)>1;

delete from cars where id in(select max(id) from cars group by model,brand having count(*)>1);

-- 2)By using self join removing duplicate records see below
 select * from cars; 
 -- Now performing self join
 select * from cars c1 inner join cars c2
 on c1.model =c2.model and
 c1.brand= c2.brand; 
 -- now see below 
 select * from cars c1 
 inner join cars c2
 on c1.model = c2.model and
 c1.brand = c2.brand 
where c1.id < c2.id;

-- again all records take from any1 table (suppose c2 table)
select c2.* from cars c1
inner join cars c2
on c1.model= c2.model
and c1.brand =c2.brand 
where c1.id < c2.id; 

-- now we will take only id from table c2
select c2.id from cars c1
inner join cars c2 
on c1. model = c2.model and
c2.brand =c2.brand 
where c1.id < c2.id; 

-- now deleting this above duplicate id's that is 5&6 

delete from cars
where id in (
              select c2.id 
              from cars c1 
              join cars c2 on c1.model = c2.model and c1.brand = c2.brand 
              where c1.id < c2.id);

 -- now check the table again cars table 
 
--  3)Now using min() method for removing duplicates values 
use naya_1;
show tables;

select model,brand, count(*) from cars
group by model,brand;
-- now use min(id) to get first id 

select model,brand,min(id) from cars
group by model,brand; 

select min(id) from cars
group by model,brand;

-- now removes others higher  id 
delete from cars
where id not in (
				   select min(id)
                   from cars
                   group by model,brand);


-- By using Windows function(row_number())

select * from cars; 
-- first see duplicate records 
select model,brand,count(*)
from cars
group by model,brand; 

select *,row_number() over(partition by model, brand) as rn
from cars;

select * from 
(select *,row_number() over(partition by model,brand) as rn
from cars) as temp
where temp.rn>1; 

select id from
(select *,row_number() over(partition by model,brand)as rn
from cars) as temp 
where temp.rn>1;

delete from cars
where id in (
               select id from
               (select *,row_number() 
                over(partition by model,brand) as rn
				from cars) as temp 
				where temp.rn>1); 
                
select * from cars; 
select model,brand,count(*)
from cars
group by model,brand;

-- again we add duplicate in the cars table 
insert into cars
values(5, 'Model S', 'Tesla', 'Silver', 2018),
(6, 'Ioniq 5', 'Hyundai', 'Green', 2021); 

select * from cars; 
select model,brand,count(*)
from cars
group by model,brand; 

-- char,varchar,text,int,float,double,decimal,boolean,datetime,date,time 
 use naya_1; 
 create table kudvenEmployees(
 id int,
 FirstName varchar(50) not null,
 LastName varchar(90) not null,
 Gender varchar(100),
 salary int not null,
 Hiredate date not null,
 primary key(id)); 
 
 select * from KudvenEmployees;
 desc KudvenEmployees; 
 show index from KudvenEmployees; 
 alter table KudvenEmployees 
 modify column id int auto_increment;

Insert into KudvenEmployees(FirstName,LastName,Gender,Salary,Hiredate) 
values('Mark','Hastings','Male',60000,'2014-05-10'),
('Steve','Pound','Male',45000,'2014-04-20'),
('Ben','Hoskins','Male',70000,'2014-04-05'),
('Philip','Hastings','Male',45000,'2014-03-11'),
('Mary','Lambeth','Female',30000,'2014-03-10'),
('Valarie','Vikings','Female',35000,'2014-02-09'),
('John','Stanmore','Male',80000,'2014-02-22'),
('Able','Edward','Male',5000,'2014-01-22'),
('Emma','Nan','Female',5000,'2014-01-14'),
('Jd','Nosin','Male',6000,'2013-01-10'),
('Todd','Heir','Male',7000,'2013-02-14'),
('San','Hughes','Male',7000,'2013-03-15'),
('Nico','Night','Male',6500,'2013-04-19'),
('Martin','Jany','Male',5500,'2013-05-23'),
('Mathew','Mann','Male',4500,'2013-06-23'),
('Baker','Barn','Male',3500,'2013-07-23'),
('Mosin','Barn','Male',8500,'2013-08-21'),
('Rachel','Aril','Female',6500,'2013-09-14'),
('Pameela','Son','Female',4500,'2013-10-14'),
('Thomas','Cook','Male',3500,'2013-11-14'),
('Malik','Md','Male',6500,'2013-12-14'),
('Josh','Anderson','Male',4900,'2014-05-01'),
('Geek','Ging','Male',2600,'2014-04-01'),
('Sony','Sony','Male',2900,'2014-04-30'),
('Aziz','Sk','Male',3800,'2014-03-01'),
('Amit','Naru','Male',3100,'2014-03-31'); 

select * from KudvenEmployees; 

-- How many employees hired in  last 3 month 

select *, TIMESTAMPDIFF(month,Hiredate,current_date()) as datval
from KudvenEmployees 
order by Hiredate desc;
-- in the three month
select *,timestampdiff(month,Hiredate,current_date())  as dateval
from kudvenemployees
where timestampdiff(month,Hiredate,current_date()) between 1 and 3
order by Hiredate desc;

-- in last 2 yrars 
use naya_1;
select *,timestampdiff(year,hiredate,curdate()) as dtediff
from kudvenemployees
where timestampdiff(year,hiredate,curdate()) between 0 and 1
order by hiredate desc;
-- hired in last 30 days
  select *, datediff(curdate(),hiredate) as datdff
  from kudvenemployees
  where datediff(curdate(),Hiredate)  between 1 and 40 
  order by Hiredate desc;
  use classicmodels;
  show tables; 
  -- --Q Finding Employees and their Managers name from employees Table from classicmodels database
  use classicmodels;
  select * from employees e1 
  join employees e2
  on e1.reportsTo = e2.employeeNumber;
  
--   again now taking name and their manegars 
select e1.firstName as employeeName,e2.firstName as Maneger from employees e1
join employees e2
on e1.reportsTo = e2.employeeNumber;
use naya_1;
  
-- suppose we want employees who have earn more salary than their manegers 
use naya_1;
-- we create new  table here in naya_1 database for this query 
create table nayaemployee(
id int,
name varchar(45) not null,
salary int not null,
manegarId int,
primary key(id));
select * from nayaemployee;
desc nayaemployee; 
insert into nayaemployee(id,name,salary,manegarID)
values(1,'jaiTiwari',45000,2),
(2,'SamTiwari',24000,3),
(3,'RinkiTiwari',12000,1),
(4,'PinkiTiwari',47000,1),
(5,'AtharvTiwari',21000,2),
(6,'ShivaChandra',51000,4);

select * from nayaemployee; 
-- your answer should be jai,,pinki
-- see we are asking, like from nayaemployee table some employee have same manegarId like pinki tiwari has 1 manegarId and jai tiwari has 2 manegarId
-- and similarly , rinki tiwari has 1 manegarId, and athrv tiwari has 2 manegarId, but which employee has greater salary than its manegar
-- so here answer is jai&pinki has higher salary than their manegar and rinki&atharv has less salary than their manegar
select * from nayaemployee;
select * from nayaemployee e1,nayaemployee e2
where e1.manegarId = e2.manegarId
and e1.salary>e2.salary;

-- Q- we want only records from employeedetails table and not  from employeessalary 
-- here we use  Hungry database for this query 
use hungry; 
show tables;
-- we first perform left join in left join we get all records from left and common from right 
select * from employeesdetails as a left join employeessalary as b 
on a.empid =b.empid;

-- but we want records only on left table(employeesdetails) side and not even the common values from right table(employeessalary) 
select * from employeesdetails  as a left join employeessalary as b
on a.empid = b.empid 
where b.empid IS NULL;

select a.* from employeesdetails as a left join employeessalary as b
on a.empid =b.empid 
where b.empid IS NULL;

-- Q- customers who never orders
-- here, first we create table customersdetails and invoice in hungry datbase

create table customerdetails(
custid int,
customerName varchar(50) not null,
Address varchar(90) not null,
primary key(custid)); 

create table invoicedetails(
invoiceid int,
customerid int,
receiveddate date not null,
primary key(invoiceid)); 

insert into customerdetails
values(1,'jaiTiwari','Gurgaon'),
(2,'RaviTiwari','Noida'),
(3,'samTiwari','Lucknow'),
(4,'vijay','Narnol'),
(5,'jack','NewDelhi'); 

select * from customerdetails;
desc invoicedetails; 
insert into invoicedetails
values(100,1,'2022-10-02'),
(101,2,'2022-09-11');

select * from invoicedetails;

-- here we create left join 
select * from customerdetails c left join invoicedetails i
on c.custid = i.customerid; 

-- again
select * from customerdetails c left join invoicedetails i
on c.custid = i.customerid
where customerid IS NULL; 

select c.* from customerdetails c left join invoicedetails i
on c.custid = i.customerid
where customerid IS NULL;

-- Q-Find out Employees from employees table,  who are also Manegers.
-- take classicmodels database and employees table name

use classicmodels; 
show tables; 
select * from employees; 
--  Diane Murthy, Anthony bow, mary patterson , gerard bondur ,william patterson,mami nishi include answer 

select * from employees a join employees b 
on a.employeeNumber = b.reportsTo;

select distinct a.employeeNumber,a.firstname,a.lastname as employee from employees a
join employees b 
on a.employeeNumber =b.reportsTo;

-- SQL Query to find Manager with at least 3 employees reporting to him
create table clasemployee(
id int,
Name varchar(90) not null,
Department varchar(50) not null,
ManegarID int,
primary key(id)
);

insert into clasemployee(id,Name,Department,ManegarID)
values(101,'John','A',null),
(102,'Dan','A',101),
(103,'James','A',101),
(104,'Amy','A',102),
(105,'Anne','A',101),
(106,'Ron','B',102);

select * from clasemployee; 
-- SQL Query to find Manager with at least 3 employees reporting to him 
-- John will be answer 
select manegarid,count(*) from clasemployee
group by manegarid
having count(*)>2;

select Name from clasemployee where id in(
select manegarid from clasemployee
group by manegarid
having count(*) >2); 

-- Q-Name employees from table who salary continuously increases from 3 years (very imp)
-- first we create the table named empdetail in naya_1 database 
use naya_1; 
show tables;
create table empdetail(
id int,
salary int not null,
year int,
primary key(id)
);
-- first we are droping primary key from table
desc empdetail;
alter table empdetail
drop primary key;
insert into empdetail
values(1,10000,2020),
(1,15000,2021),
(1,20000,2022),
(2,40000,2020),
(2,50000,2021),
(2,48000,2022),
(3,90000,2020),
(3,92000,2021),
(3,95000,2022);

select * from empdetail;
select temp.id from
(select id,salary,year, LEAD(salary,1,0) over (partition by id order by year desc) as prev_salary
from empdetail)temp
where temp.salary >temp.prev_salary
group by id
having count(*) >=3;

 use naya_1; 
 create table something(
 name varchar(90) not null,
 value varchar(100) not null,
 id int );
 select * from something; 
 insert into something(name,value,id)
 value('name','Adam',1),
 ('Gender','male',1),
 ('salary',5000,1); 
 desc something;
select * from something; 
select id,
max(case when name='name' then value else '' end) as name,
max(case when name = 'Gender' then value else '' end)as Gender,
max(case when name = 'salary' then value else '' end) as salary
from something
group by id; 

use naya_1;
-- Q-Name the department that having only male employees;
-- first here we use database naya_1 and someemployeedetails table here
select * from someemployeedetails; 
desc someemployeedetails;
-- first we insert some values in a table
insert into someemployeedetails(employeeid,firstname,lastname,email,manegarid,department,dateofjoining,salary,gender)
values(10,'Anaisha','Chaubey','anaisha@gmail.com',6,'Finance','2012-03-11',18000,'f'),
(11,'Rinni','Chaubey','Rinni@gmail.com',2,'Finance','2019-05-18',24000,'f');

-- first we find with respect to each gender we count gender
select department,gender,count(*) from someemployeedetails
group by department,gender;

-- But we want only department name which male employee i.e Sales&HR right 
select department from someemployeedetails
group by department,gender
having gender= 'm';

-- Q-show department name from table  only having female employees
-- first here we find each department name with their gender count 

select department,gender,count(*)  from someemployeedetails
group by department,gender;

select department
from someemployeedetails
group by department,gender
having gender = 'f';

use naya_1; 
update someemployeedetails
set salary = 56000
where EmployeeId =6;
select * from someemployeedetails;

-- Q-Now we want employees from the table  with same salary 
select * from someemployeedetails e join someemployeedetails e1
on e.EmployeeId <> e1.EmployeeId and e.salary =e1.salary;

-- we want only name of those employees with same salary 
select e.firstName,e.Lastname, e.salary from someemployeedetails e join someemployeedetails e1
on e.employeeid <>e1.employeeid and e.salary =e1.salary;
-- Q- wat is the difference between row_number(),rank() and dense_rank()
use naya_1;
create table knowemployee(
employeeid int,
name varchar(90) not null,
deptid int,
salary int,
primary key(employeeid)
); 

insert into knowemployee(employeeid,name,deptid,salary)
Values(1,'mia',5,50000),
(2,'Adam',2,50000),
(3,'Sean',5,60000),
(4,'Robert',2,50000),
(5,'Jack',2,45000),
(6,'Neo',5,60000),
(7,'Jennifer',2,55000),
(8,'Lisa',2,85000),
(9,'Martin',2,35000),
(10,'Terry',5,90000),
(12,'David',5,60000);
  
select * from knowemployee; 
select *,row_number() over(partition by deptid order by salary asc) as rank1,
rank() over(partition by deptid order by salary asc) as rank2,
dense_rank() over(partition by deptid order by salary asc) as rank3
from knowemployee;

-- Q--- here wat we get below  output from table(src_dest_distance) we have just created  that is src_distance_distance,table is created below
-- Important interview question(from youtube techTFQ)

-- -- INPUT:
-- SRC         DEST        DISTANCE
-- Bangalore	Hyderbad	400
-- Hyderbad	Bangalore	400
-- Mumbai	    Delhi	    400
-- Delhi	    Mumbai	    400
-- Chennai	    Pune	    400
-- Pune        Chennai	    400

-- -- EXPECTED OUTPUT we want like this below output
-- SRC         DEST        DISTANCE
-- Bangalore	Hyderbad	400
-- Mumbai	    Delhi	    400
-- Chennai	    Pune	    400

use  hungry;
-- first we are creating the table

create table src_dest_diatance(
source  varchar(50) not null,
destination varchar(60),
distance int 
);
alter table src_dest_diatance
rename to src_dest_distance;

insert into src_dest_distance 
values ('Bangalore', 'Hyderbad', 400),
('Hyderbad', 'Bangalore', 400),
('Mumbai', 'Delhi', 400),
('Delhi', 'Mumbai', 400),
('Chennai', 'Pune', 400),
('Pune', 'Chennai', 400);

select * from src_dest_distance;
-- now above table content,  which we get from table ,we have to convert this to expected output  that is shown above.

-- IMPORTANT NOTES;_
-- so by looking at output , we clearly understand that we have to remove duplicate values here
-- we can do so, by applying self join here and self join required id from table
-- which is not there in the table , So we use here row_number()
-- which gives unique number(rank) to each row even if it contains dulicates values
-- and row_number is used on both table , so we use here CTE function, ok

with cte as(
select *,row_number() over() as id
from src_dest_distance)
select * from cte t1 join cte t2
on t1.source =t2.destination
and t1.id<t2.id; 

with cte as(
select *,row_number() over() as id
from src_dest_distance)
select t1.source,t1.destination,t1.distance from cte t1 join cte t2
on t1.source =t2.destination
and t1.id < t2.id;
use hungry;
create table travel_items
(
id              int,
item_name       varchar(50),
total_count     int
);
insert into travel_items values
(1, 'Water Bottle', 2),
(2, 'Tent', 1),
(3, 'Apple', 4); 

select * from travel_items;
desc travel_items; 
show index from  travel_items;
-- we want expected output like this see below
-- ID    ITEM_NAME
-- 1	  Water Bottle
-- 1	  Water Bottle
-- 2	  Tent
-- 3	  Apple
-- 3	  Apple
-- 3	  Apple
-- 3	  Apple

-- Remember below syntax for recursive
-- with recursive cte as
-- (base query
-- union
-- recursive query)
-- select * from cte;

with recursive cte as
(select id,item_name,total_count,1 as level 
from travel_items
union
 select cte.id,cte.item_name,cte.total_count-1,(level+1) as level
 from cte
 join travel_items t on t.id = cte.id and t.item_name = cte.item_name
 where cte.total_count>1) 
 select id,item_name from
 cte
 order by id;
 
 -- Q-Write SQL Query to find the average distance between the locations?

-- INPUT:
-- SRC       DEST    DISTANCE
-- A	      B	      21
-- B	      A	      28
-- A	      B	      19
-- C	      D	      15
-- C	      D	      17
-- D	      C	      16.5
-- D	      C	      18

-- -- EXPECTED OUTPUT:
-- SRC       DEST    DISTANCE
-- A	      B	      22.66
-- C	      D	      16.62
 
 create table src_dest_distance_2
(
    src         varchar(20),
    dest        varchar(20),
    distance    float
);
insert into src_dest_distance_2 values ('A', 'B', 21);
insert into src_dest_distance_2 values ('B', 'A', 28);
insert into src_dest_distance_2 values ('A', 'B', 19);
insert into src_dest_distance_2 values ('C', 'D', 15);
insert into src_dest_distance_2 values ('C', 'D', 17);
insert into src_dest_distance_2 values ('D', 'C', 16.5);
insert into src_dest_distance_2 values ('D', 'C', 18);

 
 select * from src_dest_distance_2;  
 
--  first total distances between src&dest
 select src,dest,sum(distance) as Total_distance,count(1) as no_of_routes
 from src_dest_distance_2
 group by src,dest;
  -- now we use row_number()
  
  select src,dest,sum(distance)as Total_distance,count(1) as no_of_route 
  ,row_number() over(order by src)as id
  from src_dest_distance_2
  group by src,dest;
  
  

 with cte as(
select src,dest,sum(distance) as total_distance,count(1) as no_of_route,
row_number() over(order by src asc) as id
from src_dest_distance_2
group by src,dest)
select t1.src,t1.dest,round((t1.total_distance+t2.total_distance)/(t1.no_of_route+t2.no_of_route),2) as avg_distance from cte t1 join cte t2
on t1.id<t2.id and
t1.src =t2.dest;
  
--  Q-Write an SQL query to display the correct message (meaningful message) from the input
-- comments_and_translation table. */


create table comments_and_translations
(
	id				int,
	comment			varchar(100),
	translation		varchar(100)
);

insert into comments_and_translations values
(1, 'very good', null),
(2, 'good', null),
(3, 'bad', null),
(4, 'ordinary', null),
(5, 'cdcdcdcd', 'very bad'),
(6, 'excellent', null),
(7, 'ababab', 'not satisfied'),
(8, 'satisfied', null),
(9, 'aabbaabb', 'extraordinary'),
(10, 'ccddccbb', 'medium');
use hungry;
select * from comments_and_translations;

select case when translation is null then comment else translation
end as 'order'
from comments_and_translation;

use naya_1;
--  solving some case statements scenarios
select firstname,lastname,salary,
case when salary >70000 then 'salary is greater than 70k'
when salary =40000 then 'salary is equal to 40k'
else 'salary is less than 60k'
end as 'salary_status'
from someemployeedetails;

-- 2)select name,city,country from customers
-- order by(case when city is null then country ele city  end );

/*Q-suppose we want only those suppliers name  whose product price are lesser than 50
Here we have suppliername in suppliers table and product detail in product table
so here we use two tables and supplierid is common column between them*/

select supplierName from suppliers where exists(select productName from Products where products.supplierID =suppliers.SupplierID and price<50);

-- MULTIPLE LINE COMMENT IS START FROM /* AND ENDS WITH */  and single line comment in  --
-- anyting start with s we use s% ,for end with s we use %s 

-- i need student batch map,attendence,sessions, 

 -- Q-Find the attendance percentage for each session for each batch. Also mention the batch name and users name who has conduct that session
-- with students_in_batch as
-- first creating some tables in hungry database below
use hungry; 
-- active(boolean to check if user is active)
create table users(
id int,
name varchar(70) not null,
active boolean not null default true,
primary key(id)
); 

drop table users;

insert into users values (1, 'Rohit', true);
insert into users values (2, 'James', true);
insert into users values (3, 'David', true);
insert into users values (4, 'Steven', true);
insert into users values (5, 'Ali', true);
insert into users values (6, 'Rahul', true);
insert into users values (7, 'Jacob', true);
insert into users values (8, 'Maryam', true);
insert into users values (9, 'Shwetha', false);
insert into users values (10, 'Sarah', true);
insert into users values (11, 'Alex', true);
insert into users values (12, 'Charles', false);
insert into users values (13, 'Perry', true);
insert into users values (14, 'Emma', true);
insert into users values (15, 'Sophia', true);
insert into users values (16, 'Lucas', true);
insert into users values (17, 'Benjamin', true);
insert into users values (18, 'Hazel', false);

select * from users;
select * from users where active =0;

-- active(boolean to check if batch is active)

create table batches(
id int,
name varchar(100) not null,
active boolean not null default true,
primary key(id)
);

insert into batches values (1, 'Statistics', true);
insert into batches values (2, 'Mathematics', true);
insert into batches values (3, 'Physics', false);

select * from batches;
-- this table is a mapping of the student and his batch 

CREATE TABLE student_batch_maps(
stu_id int,
user_id int,
batch_id int,
active boolean not null default true,
primary key(stu_id),
foreign key(user_id) references users(id),
foreign key(batch_id) references batches(id)
);

insert into student_batch_maps values (1, 1, 1, true);
insert into student_batch_maps values (2, 2, 1, true);
insert into student_batch_maps values (3, 3, 1, true);
insert into student_batch_maps values (4, 4, 1, false);
insert into student_batch_maps values (5, 5, 2, true);
insert into student_batch_maps values (6, 6, 2, true);
insert into student_batch_maps values (7, 7, 2, true);
insert into student_batch_maps values (8, 8, 2, true);
insert into student_batch_maps values (9, 9, 2, false);
insert into student_batch_maps values (10, 10, 3, true);
insert into student_batch_maps values (11, 11, 3, true);
insert into student_batch_maps values (12, 12, 3, false);
insert into student_batch_maps values (13, 13, 3, true);
insert into student_batch_maps values (14, 14, 3, true);
insert into student_batch_maps values (15, 4, 2, true);
insert into student_batch_maps values (16, 9, 3, false);
insert into student_batch_maps values (17, 9, 1, true);
insert into student_batch_maps values (18, 12, 1, true);

select * from student_batch_maps;

create table sessions(
session_id int,
conducted_by int,
batch_id int,
primary key(session_id),
foreign key(conducted_by) references users(id),
foreign key(batch_id) references batches(id)
); 

insert into sessions values (1, 15, 1);
insert into sessions values (2, 16,2);
insert into sessions values (3, 17, 3);
insert into sessions values (4, 15, 1);
insert into sessions values (5, 16, 2);
insert into sessions values (6, 18, 2);

select * from sessions; 

create table attendances(
student_id int not null,
session_id int,
rating float not null,
foreign key(student_id) references users(id),
foreign key(session_id)references sessions(session_id)
);

drop table attendances;
insert into attendances values (1, 1, 8.5);
insert into attendances values (2, 1, 7.5);
insert into attendances values (3, 1, 6.0);
insert into attendances values (5, 2, 8.5);
insert into attendances values (6, 2, 7.5);
insert into attendances values (7, 2, 6.0);
insert into attendances values (8, 2, 6.0);
insert into attendances values (10, 3, 9.5);
insert into attendances values (11, 3, 7.0);
insert into attendances values (13, 3, 8.0);
insert into attendances values (14, 3, 6.0);
insert into attendances values (1, 4, 7.0);
insert into attendances values (2, 4, 5.5);
insert into attendances values (5, 5, 5.0);
insert into attendances values (5, 6, 6.0);
insert into attendances values (9, 2, 4.0);
insert into attendances values (12, 3, 5.0);

select * from attendances; 

--  Q-Find the attendance percentage for each session for each batch. Also mention the batch name and users name who has conduct that session
-- -- with students_in_batch as 
-- --SOLVING PROBLEN
/*to create atendance % for each session, we have to first find 
total student who have attended session/Total number of student in session/each batch*/  
--  first find Total number of student in a batch/session 


-- Q-Now finding total student who attended each session 
select batch_id,count(stu_id) as Total_number_student_per_batch
from student_batch_maps
where active=1
group by batch_id;
select session_id, count(student_id) as Total_student_per_session
from attendances
group by session_id;

with Total_number_of_student_per_batch as(
select batch_id,count(stu_id) as Total_number_student_per_batch from 
student_batch_maps
where active = 1
group by batch_id),
Total_Number_of_student_attended_the_session as(
select session_id,count(student_id) as Total_student_per_session
from attendances
group by session_id)

select s.session_id,b.name as batch_name,u.name as user_name,Total_number_student_per_batch,Total_student_per_session,
round((Total_student_per_session/Total_number_student_per_batch)*100,2) as attendence_prcnt
from sessions s
join Total_number_of_student_per_batch t on s.batch_id = t.batch_id
join Total_Number_of_student_attended_the_session ss on ss.session_id  = s.session_id
join users u on u.id =s.conducted_by
join batches b on b.id = s.batch_id;

select * from student_batch_maps active
join student_batch_maps inactive
on active.user_id =inactive.user_id ;

select * from student_batch_maps active
join student_batch_maps inactive
on active.user_id =inactive.user_id
where active.active =1 and inactive.active =0;

select active.user_id as student_id1,active.batch_id as activebatch,inactive.batch_id as inactivebatch from student_batch_maps active
join student_batch_maps inactive
on active.user_id =inactive.user_id 
where active.active =1 and inactive.active =0;

-- now

with Total_number_of_student_per_batch as(
select batch_id,count(stu_id) as Total_number_student_per_batch from 
student_batch_maps
where active = 1
group by batch_id),
multiple_batch_students as(
select active.user_id as student_id1,active.batch_id as activebatch,inactive.batch_id as inactivebatch
 from student_batch_maps active
join student_batch_maps inactive
on active.user_id =inactive.user_id 
where active.active =1 and inactive.active =0),
Total_Number_of_student_attended_the_session as(
select session_id,count(student_id) as Total_student_per_session
from attendances a 
join sessions s on a.session_id = s.session_id
where(a.student_id,s.batch_id) not in(select studentid1,inactivebatch from
multiple_batch_students)
group by session_id)

select s.session_id,b.name as batch_name,u.name as user_name,Total_number_student_per_batch,Total_student_per_session,
round((Total_student_per_session/Total_number_student_per_batch)*100,2) as attendence_prcnt
from sessions s
join Total_number_of_student_per_batch t on s.batch_id = t.batch_id
join Total_Number_of_student_attended_the_session ss on ss.session_id  = s.session_id
join users u on u.id =s.conducted_by
join batches b on b.id = s.batch_id; 


-- now we join these two tables but we do not have common column between them right, so we use here session table , ok 
 -- Find the attendance percentage for each session for each batch. Also mention the batch name and users name who has conduct that session

select a.session_id, b.name as batch, u.name as teacher, round(avg(a.rating),2) as avg_rating
from attendances a 
join sessions s on a.session_id = s.session_id
join batches b on b.id = s.batch_id
join users u on u.id = s.conducted_by
group by a.session_id, b.name, u.name;
-- why sesionid taken from attendence table

/*Calculate the average rating given by students to each teacher for each session created.
 Also, provide the batch name for which session was conducted.*/ 
 
 select u.name as Teachers,b.name as batch_name,a.session_id,round(avg(a.rating),2) as Avg_Rating_of_each_teacher 
 from attendances a join sessions s
 on a.session_id =s.session_id
 join users u on u.id= s.conducted_by
 join  batches b on b.id = s.batch_id
 group by a.session_id,b.name,u.name
 order by u.name asc;
 
create table tests(
id int ,
batch_id  int,
created_by int,
TotalMarks int not null,
primary key(id),
foreign key(batch_id) references batches(id),
foreign key(created_by) references users(id)
);
insert into tests values (1, 1, 15, 100);
insert into tests values (2, 2, 16, 100);
insert into tests values (3, 3, 17, 100);
insert into tests values (4, 2, 18, 100);
insert into tests values (5, 1, 15, 50);
insert into tests values (6, 1, 15, 25);
insert into tests values (7, 1, 15, 25);
insert into tests values (8, 2, 16, 50);
insert into tests values (9, 3, 17, 50);
select * from tests;

create table test_scores(
test_id int,
user_id1 int,
score int not null,
foreign key(test_id)references tests(id),
foreign key(user_id1)references users(id)
);
insert into test_scores values (1, 1, 80);
insert into test_scores values (1, 2, 60);
insert into test_scores values (1, 3, 30);
insert into test_scores values (2, 5, 80);
insert into test_scores values (2, 6, 35);
insert into test_scores values (2, 7, 38);
insert into test_scores values (2, 8, 90);
insert into test_scores values (3, 10, 65);
insert into test_scores values (3, 11, 85);
insert into test_scores values (3, 13, 95);
insert into test_scores values (3, 14, 100);
insert into test_scores values (5, 1, 40);
insert into test_scores values (5, 2, 35);
insert into test_scores values (5, 3, 45);
insert into test_scores values (6, 1, 22);
insert into test_scores values (6, 2, 12);
insert into test_scores values (7, 1, 16);
insert into test_scores values (7, 3, 10);
insert into test_scores values (8, 5, 15);
insert into test_scores values (8, 6, 20);
insert into test_scores values (9, 13, 25);
insert into test_scores values (9, 14, 35); 
select * from test_scores;

/*Q- A student is passed when he scores 40 percent of total marks in a test. Find out how many students
 passed in each test. Also mention the batch name for that test.*/ 
 
 select ts.test_id, b.name as batch, count(created_by) as students_passed
from tests t
 left join test_scores ts on t.id = ts.test_id
join users u on u.id = ts.user_id1
join batches b on b.id = t.batch_id
where ((ts.score/TotalMarks)*100) >= 40
group by ts.test_id,b.name;


/*Q- A student is passed when he scores 40 percent of total marks in a test. Find out how many students
 passed in each test. Also mention the batch name for that test.*/ 
 select ts.test_id, b.name as batch_name,count(t.created_by) as Total_number_of_student_passed
 from tests t join test_scores ts on t.id =ts.test_id
 join batches b on b.id =t.batch_id
 where ((ts.score/t.TotalMarks)*100)>=40
 group by b.name,ts.test_id;
 
 -- SQL with Clause(Sql CTE) BY techTFQ(you tube channel)
 use hungry;
create table emp(
emp_ID int,
emp_NAME varchar(50),
SALARY int);

insert into emp values(101, 'Mohan', 40000);
insert into emp values(102, 'James', 50000);
insert into emp values(103, 'Robin', 60000);
insert into emp values(104, 'Carol', 70000);
insert into emp values(105, 'Alice', 80000);
insert into emp values(106, 'Jimmy', 90000);

select * from emp;

create table sales
(
	store_id  		int,
	store_name  	varchar(50),
	product			varchar(50),
	quantity		int,
	cost			int
);
 
 insert into sales values
(1, 'Apple Originals 1','iPhone 12 Pro', 1, 1000),
(1, 'Apple Originals 1','MacBook pro 13', 3, 2000),
(1, 'Apple Originals 1','AirPods Pro', 2, 280),
(2, 'Apple Originals 2','iPhone 12 Pro', 2, 1000),
(3, 'Apple Originals 3','iPhone 12 Pro', 1, 1000),
(3, 'Apple Originals 3','MacBook pro 13', 1, 2000),
(3, 'Apple Originals 3','MacBook Air', 4, 1100),
(3, 'Apple Originals 3','iPhone 12', 2, 1000),
(3, 'Apple Originals 3','AirPods Pro', 3, 280),
(4, 'Apple Originals 4','iPhone 12 Pro', 2, 1000),
(4, 'Apple Originals 4','MacBook pro 13', 1, 2500);

select * from sales;  
select * from emp;

-- fetch employees who earn more than average salary of all employees 

select emp_name, salary from emp where salary >(select avg(salary) from emp); 
select avg(salary) from emp;

-- ANOTHER USECASE 
-- Q-find stores whoes sales are better than average sales of entire stores 
-- so first here,  we will find  each store and their total sales 
-- we will use clause here(with clause) 

WITH TotalSales_pershop (store_id,Total_sales_per_store) as
(select store_id, sum(cost) as Total_sales_per_store
from sales 
group by store_id),
Overall_Avg (over_all_avg_of_allshop) as
(select avg(Total_sales_per_store)as over_all_avg_of_allshop
from TotalSales_pershop)
select * from TotalSales_pershop ts
join
 Overall_Avg oa
 on ts.Total_sales_per_store > oa.over_all_avg_of_allshop;

-- Another query(from javapoint website)

-- Q-suppose there is a table called employee , where we want clause  employeee from california and
-- then we want all emp from calofornia of age greater than 32 and city

-- WITH employee_in_california as
-- (select * from employees where city = 'California')
-- select emp_name,age,city from  employee_in_california
-- where emp_age>32
-- order by emp_name;


use hungry;
-- we have drop table because we have created it in the hundry database, we have to create it in the joinwala database
-- to drop table first drop employee11,then managers then departments11, ok
use joinwala;
drop table departments11;
drop table managers;
drop table employee11;

 create table departments11(
 dept_id int,
 dept_name varchar(45) not null,
 primary key(dept_id)
 );
 alter table departments11
 modify column dept_id varchar(20) not null;
 desc departments11; 
 show index from employees11;
 
 insert into departments11(dept_id,dept_name)
 values('D1','IT'),
 ('D2','HR'),
 ('D3','Finance'),
 ('D4','Admin'); 
 
 create table Managers(
 manager_id varchar(30) not null,
 manager_name varchar(90) not null,
 dept_id varchar(20),
 primary key(manager_id),
 foreign key(dept_id) references departments11(dept_id)
 ); 
 
 insert into Managers(manager_id,manager_name,dept_id)
 values('M1','Prem','D3'),
 ('M2','Shripadh','D4'),
 ('M3','Nick','D1'),
 ('M4','Cory','D1'); 
 
 create table employee11(
 emp_id varchar(34),
 emp_name varchar(56) not null,
 salary int not null,
 dept_id varchar(20) not null,
 manager_id varchar(30),
 primary key(emp_id),
 foreign key(dept_id) references departments11(dept_id),
 foreign key(manager_id) references managers(manager_id)
 ); 
 
 alter table employee11
 rename to employee111;
 
 insert into employee111(emp_id,emp_name,salary,dept_id,manager_id)
 values('E1','Rahul',15000,'D1','M1'),
 ('E2','Manoj',15000,'D1','M1'),
 ('E3','James',55000,'D2','M2'),
 ('E4','Michael',25000,'D2','M2'),
 ('E5','Ali',20000,'D3','M3'),
 ('E6','Robin',35000,'D1','M3');
 
 show tables;
 
 create table projects(
 project_id varchar(90) not null,
 project_name varchar(100) not null,
 team_member_id varchar(90) not null,
 foreign key(team_member_id) references employee111(emp_id),
 foreign key(team_member_id) references managers(manager_id)
 );
 
 insert into projects(project_id,project_name,team_member_id)
 values('P1','Data Migration','E1'),
 ('P1','Data Migration','E2'),
 ('P1','Data Migration','M3'),
 ('P2','ETL tool','E1'),
 ('P2','ETL tool','M4');
 
/*some important concept like windows,sqlCTE,views,stored procedure,indexes,triggers,typeofjoins,aggregatefunctions,groupby concept

1)windows function(Analytic function)in sql(row_number(),rank,lag(),lead())
by techTFQ(youtube.com)*/ 

create database windowfun; 
use windowfun;
create table employee_info24(
emp_id int,
emp_name varchar(67) not null,
deptname varchar(100) not null,
salary int,
primary key(emp_id)
); 

insert into employee_info24 values(101, 'Mohan', 'Admin', 4000);
insert into employee_info24 values(102, 'Rajkumar', 'HR', 3000);
insert into employee_info24 values(103, 'Akbar', 'IT', 4000);
insert into employee_info24 values(104, 'Dorvin', 'Finance', 6500);
insert into employee_info24 values(105, 'Rohit', 'HR', 3000);
insert into employee_info24 values(106, 'Rajesh',  'Finance', 5000);
insert into employee_info24 values(107, 'Preet', 'HR', 7000);
insert into employee_info24 values(108, 'Maryam', 'Admin', 4000);
insert into employee_info24 values(109, 'Sanjay', 'IT', 6500);
insert into employee_info24 values(110, 'Vasudha', 'IT', 7000);
insert into employee_info24 values(111, 'Melinda', 'IT', 8000);
insert into employee_info24 values(112, 'Komal', 'IT', 10000);
insert into employee_info24 values(113, 'Gautham', 'Admin', 2000);
insert into employee_info24 values(114, 'Manisha', 'HR', 3000);
insert into employee_info24 values(115, 'Chandni', 'IT', 4500);
insert into employee_info24 values(116, 'Satya', 'Finance', 6500);
insert into employee_info24 values(117, 'Adarsh', 'HR', 3500);
insert into employee_info24 values(118, 'Tejaswi', 'Finance', 5500);
insert into employee_info24 values(119, 'Cory', 'HR', 8000);
insert into employee_info24 values(120, 'Monica', 'Admin', 5000);
insert into employee_info24 values(121, 'Rosalin', 'IT', 6000);
insert into employee_info24 values(122, 'Ibrahim', 'IT', 8000);
insert into employee_info24 values(123, 'Vikram', 'IT', 8000);
insert into employee_info24 values(124, 'Dheeraj', 'IT', 11000);

select * from employee_info24; 
-- suppose max salary with respect to each department then 
select deptname, max(salary) as max_salary_by_each_department
from employee_info24
group by deptname
order by max(salary) desc;

-- now using condition clause with group by that is having clause 

select deptname, max(salary) as max_salary_by_each_department
from employee_info24
group by deptname
having max(salary)>5000
order by max(salary) desc;

-- showing table and max salary column also which showing max salary in each row(this is kind of windows function)
select e.*, max(salary) over() as max_salary
from employee_info24 e; 

-- now suppose max salary across each department through windows function 

select e.*, max(salary) over(partition by deptname) as Max_salary_per_department
from employee_info24 e;  

/*ROW_NUMBER():- it is basically useed for ranking for cataforical column(like deptname,empid).It is used to give unique rank/value
for each value in a row, also used when when we are table as self join and this table do not contains id column*/

-- Here, suppose we are giving rank or number with respect to departmentname

select e.*,row_number() over(partition by deptname) as row_id
from employee_info24 e; 

-- Q-fetch first 2 employees from each department to join the company; 

-- for above query,  first use windows function row_number() 
select e.*, row_number() over(partition by deptname order by emp_id asc) as rn
from employee_info24 e;

-- now we want only first two employeee from each department
select * from
(select e.*,row_number() over(partition by deptname order by emp_id asc) as rn
from employee_info24 e)x 
where x.rn<3;

 -- Rank() FUNCTION
--  rank function give rank to each row , but it give same rank to rows with duplicate values and skip the
--  next ranking for each duplicate values
--  rank_dense() is also same but do not skip the ranking for duplicate values

-- Q- we have required to fetch first 3 employee with highest salary in each department(we use here windowsfunction (rank() function) 

select e.*,rank() over(partition by deptname order by salary desc) as rnk
from employee_info24 e;

select * from
(select e.*,rank() over(partition by deptname order by salary desc) as rnk
from employee_info24 e)x
where x.rnk<4;

-- top employee  salary with other dtails in each department 
select * from
(select e.*,rank() over(partition by deptname order by salary desc) as rnk
from employee_info24 e)x
where x.rnk<2;

-- top employee name only  with salary in each department 
select emp_name from(
select e.*,rank() over(partition by deptname order by salary desc) as rnk
from employee_info24 e)x
where x.rnk<2;

-- NOW WE ARE USING RANK(),DENSE_RANK() AND ROW_NUMBER() TOGETHER on salary for each department

select e.*,
row_number() over(partition by deptname order by salary desc) as rw_rnk,
rank() over(partition by deptname order by salary desc)as rnk,
dense_rank() over(partition by deptname order by salary desc) as dens_rnk
from employee_info24 e;

-- MOVING ON LAG AND LEAD FUNCTIONS IN SQL 

-- LAG() WINDOWS FUNCTION 
-- Suppose we want to fetch a query to check if the salary of a employee is greater or equal or less than previous employee salary
-- here we are talking about previous employee so here we use lag() function
 
select e.*, lag(salary) over(partition by deptname order by emp_id) as prev_emp_salary
from employee_info24 e;

-- if checkig previous 2 records to the curent one then 

select e.*,lag(salary,2,0) over(partition by deptname order by emp_id asc) as prev_emp_salary
from employee_info24 e;

--  Suppose we want to fetch a query to check if the salary of a employee is greater or equal or less than next employee salary
-- we use here lead() function 

select e.*,lead(salary) over(partition by deptname order by emp_id asc) as nxt_emp_salary
from employee_info24 e;

-- now coming back to first question 

-- Suppose we want to fetch a query to check if the salary of a employee is greater or equal or less than previous employee salary
select e.*,lag(salary) over(partition by deptname order by emp_id asc)as prev_emp_salary,
case when
e.salary > lag(salary) over(partition by deptname order by emp_id asc) then 'current salary higher than prevoius salary'
when e.salary < lag(salary) over(partition by deptname order by emp_id asc) then 'current salary is lower than previous salary'
when e.salary =lag(salary) over(partition by deptname order by emp_id asc) then 'current salary is equal to previous salary'
end as 'salary_range'
from employee_info24 e;

-- group by function in sql
-- code era channel(you tube)
use windowfun;
create table if not exists employee_info(
id int,
name varchar(90) not null,
email varchar(89) not null,
department varchar(100) not null,
salary int,
primary key(id)
); 
alter table employee_info
modify column department varchar(45) null;


INSERT INTO employee_info (`Id`, `name`, `email`, `department`, `salary`)
 VALUES('1', 'Karan Mehta', 'Karan@gmail.com','HR', '300000'),
('2', 'Rohit Sharma', 'Rohit@gmail.com','Admin', '75000'),
('3', 'Ankush Rajput', 'Ankush@gmail.com','Accounts',NULL),
('4', 'Priyanshi Sharma', 'Priyanshi@gmail.com','HR', '500000'),
('5', 'Sanket Gupta', 'Sanket@gmail.com','Developer', '100000'),
('6', 'Shruti Kapoor', 'Shruti@gmailcom','Admin', '80000'),
('7', 'Raj Kumar', 'Raj@gmail.com',NULL,'62000'),
('8', 'Suraj Roy','Suraj@gmail.com', NULL, '25000'),
('9', 'Geet Gour','Geet@gmail.com', 'Tester', '17000');

 

select * from employee_info; 

create table students(
id int,
subject varchar(80),
semester int not null,
name varchar(70) not null,
primary key(id)
);

select * from students; 


insert into students values
(1,'ITB001',1,'Robert'),
(2,'ITB001',1,'Bob'),
(3,'ITB001',1,'Lisa'),
(4,'ITB001',2,'Sam'),
(5,'ITB001',2,'Maria'),
(6,'ECB130',1,'John'),
(7,'ECB130',1,'Robert'),
(8,'ECB130',2,'Mickey'); 

select * from students; 
-- - Q- sum of salary with respect to each department 

select department, sum(salary) as max_salary
from employee_info
group by department
order by sum(salary) desc; 

-- order by departmentname

select department, sum(salary) as max_salary
from employee_info
group by department
order by department asc; 

-- sum of salary for each department where sum of salary is greater than 17000 
select department, sum(salary) as Max_salary
from employee_info
group by department
having sum(salary) >17000
order by sum(salary) desc;

-- IMPORTANT QUESTION ON GROUP BY BELOW 
-- total salary with respect to each departmentt except for 'Admin' department and where salary is greater than 17000 and in higher to lower order 
select department, sum(salary) as Total_salary_per_Department
from employee_info 
where department<>'Admin'
group by department
having sum(salary)>17000
order by sum(salary) desc; 

-- within same subject and same semester, number of count
select subject,semester,count(*)
from students
group by subject,semester;

-- SOVING TRICKY QUESTIONS INTERMEDIATE SQL (techTFQ)37.22 duration wala video 
/* There are 10 IPL team. write an sql query such that each team play with every other team just once. */ 

create table teams
    (
        team_code       varchar(10),
        team_name       varchar(40)
    );
    
    

insert into teams values ('RCB', 'Royal Challengers Bangalore');
insert into teams values ('MI', 'Mumbai Indians');
insert into teams values ('CSK', 'Chennai Super Kings');
insert into teams values ('DC', 'Delhi Capitals');
insert into teams values ('RR', 'Rajasthan Royals');
insert into teams values ('SRH', 'Sunrisers Hyderbad');
insert into teams values ('PBKS', 'Punjab Kings');
insert into teams values ('KKR', 'Kolkata Knight Riders');
insert into teams values ('GT', 'Gujarat Titans');
insert into teams values ('LSG', 'Lucknow Super Giants');

select * from teams; 

-- we perform self join here to find result 
select team.team_name as team, opponent.team_name as opponent from teams team join teams opponent
on team.team_name <> opponent.team_name;

-- but here if we see, output every team is playing with another team twice, but we want only one team playing with other team only once 
use windowfun;
-- so we create unique id for each team 
select row_number() over(order by team_name) as id,team_code,team_name from teams t; 

-- now we now we have to use self join here so we use both side id column , ok so we use here 'With clause' 

with matches as(
select row_number() over(order by team_name) as id,team_code,team_name
from teams t)

select team.team_name as team, opponent.team_name as opponent from matches team join matches opponent
on team.id < opponent.id;

-- TRIGGERS IN SQL 

-- Triggers are stored procedure/program which are automatically executed or fired when some event occur
-- 1)data manipulation like insert,update or delete
-- 2)DDL operation like create,alter,drop
-- 3)logon,logoff,logdown etc
-- benifits
-- 1)get strong control over security
-- 2)preventing invalid transaction  

-- SYNTAX FOR Triggers 
-- CREATE[REPLACE] Trigger trigger_name
-- {Before|After}
-- {INSERT[OR]|UPDATE[OR]|DELETE}
-- on table_name
-- [for each row]

-- declare
-- declare statement
-- statement
-- end; 

-- create or replace trigger salary_difference
-- before
-- insert,update or delete on employees
-- for each row

-- declare
-- salary_difference number;
-- begin
-- salary_difference: = :new.salary-:old.salary

use windowfun; 
create table salary_detail(
id int,
name varchar(90) not null,
salary int not null,
primary key(id)
); 
insert into salary_detail(id,name,salary)
values(1,'jai',34000),
(2,'sam',23000),
(3,'tam',67000),
(4,'ram',12000); 
select * from salary_detail; 
desc salary_detail;

-- NOW CREATING TRIGGERS 
- /*create trigger salary_difference
-- before 
-- insert on salary_detail
-- for each row
-- begin
-- salary_difference:= :new.salary-:old.salary;
-- not working above code*/

CREATE TABLE employee121(  
    name varchar(45) NOT NULL,    
    occupation varchar(35) NOT NULL,    
    working_date date,  
    working_hours int
);  

INSERT INTO employee121 VALUES    
('Robin', 'Scientist', '2020-10-04', 12),  
('Warner', 'Engineer', '2020-10-04', 10),  
('Peter', 'Actor', '2020-10-04', 13),  
('Marco', 'Doctor', '2020-10-04', 14),  
('Brayden', 'Teacher', '2020-10-04', 12),  
('Antonio', 'Business', '2020-10-04', 11);  

-- now creating triggers
-- Next, we will create a BEFORE INSERT trigger. This trigger is invoked automatically insert the working_hours = 0 
-- if someone tries to insert working_hours <0
create trigger insertbefore_hours
before insert on employee121 
for each row
if NEW.working_hours < 0 THEN SET NEW.working_hours = 0;


use windowfun; 
create table t1( 
id int,
salary int not null,
primary key(id)
);

insert into t1(id,salary)
values(1,45000),
(2,23000),
(3,12000),
(4,19000),
(5,67000),
(6,54000); 
-- now creating trigger 

create table backup(
id int,
salary int not null,
primary key(id)
); 
/*EXAMPLE2*/

-- Now, I want ki before deleting records from  table1(name of table), all data get inserted into new backup table(table name backup)
 /*create trigger t1
 before delete on t1 for each row
 begin
 insert into backup values(:old.id,:old.salary);
 end if;
 end;*/
--  now delete value from table t1 
delete from t1 where id=1;
select * from t1;
 -- now check in backup table deleted records must be there
 
 select * from backup;
 /*EXAMPLE3-*/
 
 /*suppose from passenger table(which we create),  if someone try to enter any charges then it will get reduced by 20000
 create trigger on that*/
 
 create table passengers(
 id int,
 Name varchar(70) not null,
 address varchar(70) not null,
 charges int unique,
 primary key(id)
 ); 
 
 insert into passengers(id,Name,address,charges)
 values(1,'jai','ggn',5000),
 (2,'vijay','Chennai',7000),
 (3,'sam','Haryana',12000),
 (4,'ravi','Punjab',11000); 
 
 create trigger remove_records
 before insert
 on passengers
 for each row
 set new.charges = new.charges-2000;
 /*to show trigger*/
 show triggers;
/*now inserting any charges in passenger table*/
insert into passengers values(5,'tam','Mumbai',15000); 
select * from passengers;
 /*EXAMPLE-4 the moment you insert record in colleage_student ,the record get inserted in coleage_audit*/
 create table colleage_student(
 id int,
 name varchar(56) not null,
 age int not null,
 primary key(id)
 );
 
 create table colleage_audit(
 id int,
 audit_description varchar(90),
 primary key(id)
 );
 create trigger afterval
 after insert on 
 colleage_student
 for each row
 insert into colleage_audit values(1,'new record  get  entered');
select * from colleage_audit;
select * from colleage_student; 
insert into colleage_student values(1,'niki',23);
select * from colleage_audit;
 
 
 

 
-- update function by steve griffth you tube channel
use windowfun;
drop table movies;
drop table genres;

CREATE TABLE movies1(
  movie_id int NOT NULL,
  movie_title varchar(100) NOT NULL,
  director varchar(50) NOT NULL,
  year int NOT NULL, 
  genre_id int NULL,
  primary key(movie_id)
  );
  
  INSERT INTO movies1 (`movie_id`, `movie_title`, `director`, `year`, `genre_id`) VALUES
(1, 'Labyrinth', 'Jim Henson', 1986, 1),
(2, 'Highlander', 'Russell Mulcahy', 1986, 1),
(3, 'Alien', 'Ridley Scott', 1979, 2),
(4, 'Conan the Barbarian', 'John Milius', 1982, 1),
(5, 'The Hobbit: An Unexpected Journey', 'Peter Jackson', 2012, 1),
(6, 'The Dark Crystal', 'Jim Henson', 1982, 1),
(7, 'Star Wars: A New Hope', 'George Lucas', 1977, 2),
(8, 'Harry Potter and the Order of the Phoenix', 'David Yates', 2007, 1),
(9, 'Fantastic Beasts and Where to Find Them ', 'David Yates', 2016, 1),
(10, 'Excalibur', 'John Boorman', 1981, 1),
(11, 'Time Bandits', 'Terry Gilliam', 1981, 1),
(12, 'Pan\'s Labyrinth', 'Guillermo Del Toro', 2006, 1),
(13, 'Blade Runner', 'Ridley Scott', 1982, 2),
(14, 'Interstellar', 'Christopher Nolan', 2014, 2),
(15, 'A.I. Artificial Intelligence', 'Steven Spielberg', 2001, 2),
(16, 'The Matrix', 'The Wachowskis', 1999, 2),
(17, 'Gattaca', 'Andrew Niccol', 1997, 2),
(18, 'Avatar', 'James Cameron', 2009, 2),
(19, 'Moon', 'Duncan Jones', 2009, 2),
(20, 'Galaxy Quest', 'Dean Parisot', 1999, 2),
(21, 'The Fifth Element', 'Luc Besson', 1997, 2),
(22, 'Inception', 'Christopher Nolan', 2010, 2),
(23, 'District 9', 'Neill Blokamp', 2009, 2),
(24, 'Her', 'Spike Jonez', 2013, 2),
(25, 'Pulp Fiction', 'Quentin Tarantino', 1994, 5),
(26, 'Reservoir Dogs', 'Quentin Tarantino', 1992, 5),
(27, 'Transcendence', 'George Lucas', 2014, 2),
(28, 'Contact', 'Steven Speilberg', 1997, 2);
  
  
CREATE TABLE genres1 (
  genre_id int NOT NULL,
  genre_title varchar(30) NOT NULL,
  primary key(genre_id)
  );
 
 INSERT INTO genres1 values
(1, 'Fantasy'),
(2, 'Sci-Fi'),
(3, 'Action'),
(4, 'Comedy'),
(5, 'Drama'),
(6, 'Horror'),
(7, 'Romance'),
(8, 'Family');

create table if not exists people(
email varchar(45) not null,
FirstName varchar(90) not null,
LastName varchar(90) not null,
CommonName varchar(100) not null); 
select * from people;
INSERT INTO people (email, firstname, lastname, commonName) VALUES
('arya@stark.org', 'Arya', 'Stark', ''),
('brandon@stark.org', 'Brandon', 'Stark', 'Bran'),
('bronn@blackwater.info', 'Bronn', 'Blackwater', ''),
('cersei@lannister.com', 'Cersei', 'Lannister', ''),
('daenerys@dragonstone.org', 'Daenerys', 'Targaryen', ''),
('davos@seaworth.org', 'Davos', 'Seaworth', 'The Onion Knight'),
('gregor@clegane.org', 'Gregor', 'Clegane', ''),
('jaime@lannister.org', 'Jaime', 'Lannister', ''),
('jon@snow.org', 'Jon', 'Snow', 'King Jon the First'),
('samwell@nights-watch.org', 'Samwell', 'Tarley', ''),
('sandor@clegane.org', 'Sandor', 'Clegane', ''),
('sansa@stark.org', 'Sansa', 'Stark-Bolton', '');

select * from people;

-- Q-change director name ='jaitiwari'
-- where , genre_id ='Action'
-- and movie is contact an dyear 1997
drop table movies1;
 select * from movies1;
 select * from genres1; 
 update movies1
 set director = "Jai Tiwari",
  genre_id = (select genre_id from genres1 where genre_title = 'Action' limit 1)
 where movie_title = 'Contact' and year =1997;

update movies1
set director ="Atharv",
genre_id = (select genre_id from genres1 where genre_title = "Fantasy")
where movie_title ='transcendence' and year =2014;
 
update movies1
set director = "Atharv Tiwari",genre_id = (select genre_id from genres1 where genre_title = 'Comedy')
where movie_title ='Pulp Fiction' and year = 1994;

select * from movies1;
select movie_id, movie_title,director from movies1
where movie_id= 12; 

-- Q-moviename end with letter 'T'&year&director
select movie_title,director, year from movies1
where movie_title like '%t';

-- Q-movie end with 't' but director name should stat with jai 
select movie_title,year,director from movies1
where movie_title like '%t' and director like 'jai%';

-- Q-we want movie,director,year and movie end with 'e' and director can be jai or dean and in ascending order for year 
select movie_title,director,year from movies1
where movie_title like '%t' and (director like 'jai%' or director like 'd%')
order by year asc; 
-- order by year and director from decending to ascending
select movie_title, director,year
from movies1
order by year asc, director desc;
--  Q- I want moviename,director,genre condition is moviename contains 'n' 
select * from movies1;
select movie_title as MovieName, Director as Dir,Genre_id as Genre_category
from movies1
where movie_title like '%n%';
-- Q-count of movies where moviename contain 'n'
select count(*) as Total_movies_containing_n
from movies1
where movie_title like '%n%';
-- Q-I want top 5 movies after 2007 
select * from movies1;
select movie_title as movie_name,year
from movies1
where year>2007
order by year desc
limit 5;

-- Q-starting from position 6 we ant next 5 records for movie_id,name and year
select * from movies1;
select movie_id,movie_title,year 
from movies1
limit 5,5;
-- record from 11to 15 for moviename
select movie_id, movie_title
from movies1
limit 10,5;
-- Q-- -Suppose we only want movieName and year from genre 'Action' &'Horror'

select  * from movies1
where genre_id in(select genre_id from genres1 where genre_title in ('Horror','action','Comedy'));

-- insering values in movies1 table 
insert into movies1(movie_id,movie_title,director,year,genre_id)
values(29,'Vudh','JaiTiwari',2022,6);

-- Again inserting value and taking genre_td where their type is 'Action' 
select * from movies1; 
insert into movies1(movie_id,movie_title,director,year,genre_id)
values(30,'Kantara','Rishab Shetty',2022,(select genre_id from genres1 where genre_title= "Horror"));
-- deleting record
delete from movies1 where movie_id =30;
-- -- delete from movies1 where movie_id>12;
-- delete from movies1 where movie_id between 4 and 8;

-- take all genre_id from movies1 and genres1 table

(select genre_id from movies1)
union 
(select genre_id from genres1);
-- CREATING DUPLICATE OF MOVIES1 TABLE

create table movies_duplicate1 as
select movie_id, movie_title, director,year,genre_id from movies1
where movie_id <15;
select * from movies_duplicate1;

drop table movies_duplicate;
select * from movies_duplicate;
-- Only CREATING ANOTHER TABLE THAT CONTAINS STRUCTURE OF MOVIES1 TABLE
create table movie_wala_structure as
select * from movies1
where 1=0;
select * from movie_wala_structure;

-- HOW TO ADD AUTO_INCREMENT IN GENRE_ID IN GENRES1 TABLE
desc genres1; 
show index from genres1; 

-- creating duplicate structure in genres2 table from genres1 table 

create table genres2 as
select * from genres1
where 1=0;
desc genres2;
-- IMPORTANT NOTES
-- now adding auto_increment in genre_id column of genres2 table also we have to include primary key if it is not there.
alter table genres2
modify column genre_id int auto_increment primary key;

-- we want Moviename,Director,year and Genre type for year less than 2000 
select m.movie_title,m.director,m.year,g.genre_title
from movies1 m inner join genres1 g 
on m.genre_id = g.genre_id
where m.year<2000;

select count(movie_id) as Total_movies
from movies1;

select count(genre_title) as Total_genre_type from genres1;

insert into movies1
values(31,'Conjuring','BenStroke',2020,6);
-- SUPPOSE I WANT to oldest YEAR, movie name especially FOR GENTE TYPE HORROR
-- - here year,moviename from movies1 and genre_title is from genres1

-- Q-HOW MANY MOVIES EACH DIRECTOR MADE SO FAR
select director,count(movie_title) as No_of_movies
from movies1
group by director
order by count(movie_title)desc;

select year, count(movie_title) as totalmovies
from movies1
group by year
order by count(movie_title)desc;

-- Total movies by each genre 
select g.genre_title, count(m.movie_title) as Total_movies_per_genre
from movies1 as m inner join genres1 g 
on m.genre_id = g.genre_id
where g.genre_title<>'Action'
group by g.genre_title
having count(m.movie_title)>4
order by count(m.movie_title)desc;
-- Q-Genre with highest number of movies under it
select g.genre_title
from movies1 as m inner join genres1 g 
on m.genre_id = g.genre_id
where g.genre_title<>'Action'
group by g.genre_title
having count(m.movie_title)>4
order by count(m.movie_title)desc
limit 1;

-- Q-Total number of movies by genre and director
select m.director, g.genre_title,count(m.movie_title) as TotalMovies
from movies1 m inner join genres1 g 
on m.genre_id =g.genre_id
group by m.director,g.genre_title
order by TotalMovies desc;


-- not answer this question
-- --above query is wrong because we cannot use another column with aggregate function like here min()

-- Q-SQL Query to Find Names of the Employees Whose Department Have Number of Employees Less than 2(Geeksforgeeks)

CREATE TABLE COMPANY(
EMPLOYEE_ID INT PRIMARY KEY,
EMPLOYEE_NAME VARCHAR(10),
DEPARTMENT_NAME VARCHAR(10),
SALARY INT);

INSERT INTO COMPANY VALUES(1,'RAM','HR',10000);
INSERT INTO COMPANY VALUES(2,'AMRIT','MRKT',20000);
INSERT INTO COMPANY VALUES(3,'RAVI','HR',30000);
INSERT INTO COMPANY VALUES(4,'NITIN','MRKT',40000);
INSERT INTO COMPANY VALUES(5,'VARUN','IT',50000); 
select * from company; 

select employee_name, department_name from company where department_name in(
select department_name
from company
group by department_name
having count(*)<2);

-- Q-TRIMMING NAME VALUE

select trim(' jai ');
select rtrim(' kac ') as new ;

-- Q-EXTRACTING FIRST 6 CHARACTER FROM Director column from table

select director as director_Name,substring(director,1,6) as First_6_character_name  from movies1;

-- from  moviename 5 leftmost characters

select left(movie_title,3) as new_name from movies1;

select left(movie_title, 3) as new from movies1;
-- TO GET DIRECTOR LAST NAME FROM ITS ENTIRE NAME WE USE SUBSTRING_INDEX() FUNCTION
select director as Director_Name, substring_index(director,' ',-1) as Director_Last_Name from movies1;
-- TO GET DIRECTOR FIRST NAME FROM ITS ENTIRE NAME WE USE SUBSTRING_INDEX() FUNCTION
select director as director_name, substring_index(director,' ',1) as first_director_name from movies1;
-- select director as director_name,substring_index2(director,' ',1) as n from movies1;

select round(rand()) as num from movies1;
select ceiling(rand()) as num from movies1;
select floor(rand()) as num;
select ceiling(rand()) as num;
select power(genre_id, 2) as new from movies1;
select power(genre_id, 3) as new_num from movies1;
use windowfun; 

-- INDEXES IN SQL 
-- We can create indexes on tables
-- with indexes, we cam perform fast retrieval of the data from the database.we cannot see indexes it just fast up the queries than usual
-- But updating table having indexes usually takes more time than table without indexes

-- CREATING INDEX ON PASSENGERS TABLE(Name column)
create index name_index
on passengers(Name);

-- CREATING INDEX ON FIRST&LAST NAME COLUMNS ON DIMEMPLOYEES
create index namedetail_index
on dimemployee(fname,lname);

-- NOW DROPPING INDEX FROM TABLE
alter table passengers
drop index name_index;

-- DROPPING INDEX FROM DIMEMPLOYEE TABLE 
alter table dimemployee
drop index namedetail_index;

-- REMEMBER SOME BELOW GIVEN POINTS

-- TO DROP FOREIGN KEY

-- alter table xys
-- drop foreign key abx_foreign;

-- TO DROP CHECK CONTRAINT SUPPOSE ON 2 COLUMNS

-- alter table xyz
-- drop check doublechk_detail

-- TO DROP PRIMARY KEY FROM TABLE

-- alter table xyz
-- drop primary key;

-- TO DROP INDEX FROM ANY TABLE(INDEX CREATED FOR TABLE ONLY)

-- alter table xyz
-- drop index name_index;

-- TO DROP UNIQUE CONSTRAINT ON TABLE (suppose from city)

-- alter table xyz
-- drop index city;

-- TO DROP UNIQUE CONSTRAINT ON TABLE (from multiple column, like lastname&firstname)

-- alter table xyz
-- drop index uc_person;

-- CREATE DEFAULT CONSTRAINT ON TABLE(SUPPOSE ON CITY COLUMN) 

-- alter table xyz
-- alter city set default 'Gurgaon';

-- DROP DEFAULT CONSTRAINT FROM CITY COLUMN

-- alter table xyz
-- alter city drop default;

-- ADDING NOT NULL OR NULL CONSTRAINT TO ANY COLUMN SUPPOSE FIRSTNAME OF ANY TABLE

-- alter table xyz
-- modify column firstname varchar(90) not null,
-- modify column firstname varchar(80) null;

-- ADDING AUTO_INCREMENT WITH ID COLUMN AND ,IF PRIMARY IS THERE ON ID column , 
-- THEN NO PROBLEM, BUT IF NO PRIMARY KEY THEN WE HAVE TO INCLUDE PRIMARY 
-- KEY ALSO WITH AUTO_INCREMET

-- TO CHANGE AUTO_INCREMENT  NUMBER(suppose we want that it start from 20)

-- alter table xyz
-- auto_increment =20;

-- alter table xyz
-- modify column id int not null auto_increment primary key;



use classicmodels; 
select * from products 
-- Q-Here we are looking for productName, who has maximum buyprice for productline start with C; 

order by productName  asc;
select distinct productLine from products;

select * from products;

select productName from products where buyPrice =(
select  max(buyPrice) as Max_price
from products
where productLine like 'C%');

select productLine, max(buyPrice) as Max_Price from products
where productLine<>'Classic Cars'
group by productLine
having max(buyPrice)>68
order by max(buyPrice) desc; 

select productLine, max(buyPrice) as Max_Price from products
where productLine<>'Classic Cars'
group by productLine
having max(buyPrice)>68
order by max(buyPrice) desc
limit 2;

select productLine, max(buyPrice) as Max_Price from products
where productLine<>'Classic Cars'
group by productLine
having max(buyPrice)>68
order by max(buyPrice) desc
limit 1,1;

use windowfun;
create table if not exists some_detail(
id int,
Date_of_joining date not null,
salary int not null,
primary key(id)
); 
insert into some_detail(id,date_of_joining,salary)
values(1,'2022-10-24',34000),
(2,'2021-04-17',23000),
(3,'2022-02-10',20000),
(4,'2022-09-21',29000),
(5,'2020-02-15',70000),
(6,'2019-03-14',34000); 

select * from some_detail; 
update some_detail
set date_of_joining ='2020-05-21'
where id=5;

-- Q- finding monthname,month_no from table alomg with salary and then ascending order 
-- LearnAtKnowStar(youtube channel)

select monthname(date_of_joining) as Month_Name, month(date_of_joining)as  Month_Number,salary
from some_detail
order by month(date_of_joining) asc;

select monthname(date_of_joining) as Month_Name,salary
from some_detail
order by month(date_of_joining) asc;


-- AUTO_INCREMENT:When we mark any table's column as auto_incement(suppose id column) then 
-- while inserting record in a table,that column value get automaticaly
-- incremented by 1 for each new row ,we do not insert any value
-- supose auto_increment is there and we are changing values
-- alter table some_detail
-- auto_increment =100;

-- Q-finding current date month name 
select monthname(now()) as Month_Name_For_CurentDate;
select day(now()) as current_day;

-- Q-we are going to find number of product sold per month by using MONTHNAME() function.
-- first we create table product_1, to solve this query 
-- from geeksforgeeks

create table product_1(
Product_id int auto_increment,
Product_name varchar(100) not null,
Buying_price decimal(13,2) not null,
Selling_price decimal(13,2) not null,
Selling_date date not null,
primary key(Product_id)
);

select * from product_1;
insert into product_1(Product_name,Buying_price,Selling_price,Selling_date)
values
 ('Audi Q8', 10000000.00, 15000000.00, '2018-01-26' ),
  ('Volvo XC40', 2000000.00, 3000000.00, '2018-04-20' ),
  ('Audi A6', 4000000.00, 5000000.00, '2018-07-25' ),
  ('BMW X5', 5000500.00, 7006500.00, '2018-10-18'  ),
  ('Jaguar XF', 5000000, 7507000.00, '2019-01-27'  ),
  ('Mercedes-Benz C-Class', 4000000.00, 6000000.00, '2019-04-01'  ),
  ('Jaguar F-PACE', 5000000.00, 7000000.00, '2019-12-26'  ),
  ('Porsche Macan', 6500000.00, 8000000.00, '2020-04-16' ) ;
  
  select * from product_1;
 
--  Now, we are going to find number of product sold per month by using MONTHNAME() function 
select monthname(Selling_date) as MonthName, count(Product_id) as Total_Product_sold
from product_1
group by monthname(Selling_date)
order by monthname(Selling_date) asc;

-- VIEWS 
-- Views are basically the virtual tables that can be created by selecting the fields from one or more tables by using some conditions
-- Benifits of views
-- 1)It is used to store complex queries
-- 2) multiple views can be created on the same table 
-- 3-- )Hide the data complexity during table join

create table if not exists student_details(
s_id int auto_increment,
Name varchar(100) not null,
Address varchar(100) not null,
primary key(s_id)
);

insert into student_details(Name, Address)
values('Harsh','Kolkata'),
('Ashish','Durgapur'),
('Pratik','Delhi'),
('Dhanraj','Bihar'),
('Ram','Rajasthan');

select * from student_details; 
create table if not exists StudentMarks(
id int auto_increment,
Name varchar(100) not null,
Marks int not null,
Age int not null,
primary key(id)
);

insert into StudentMarks(Name,Marks,Age)
values('Harsh',90,19),
('Suresh',50,20),
('Pratik',80,19),
('Dhanraj',95,21),
('Ram',85,18);

select * from StudentMarks;
select * from student_details;

-- CREATING VIEW FROM SINGLE TABLE (from student_details)

create view student_details1 as
select Name, address
from Student_details
where s_id<3;

select * from student_details1;
-- Q-Now creating view from table StudentMarks 
create view studentage as
select Name,Age 
from studentmarks
where marks between 80 and 90;
select * from studentage;
 show triggers; 
 
--  Creating View from multiple tables 

-- creating view and taking name ,address from studentdetail and marks from studentmarks 

create view student_completedetails as
select sd.Name, sd.Address,sm.marks
from student_details sd,studentmarks sm 
where sd.name =sm.name;

-- CREATING VIEW FROM CLASSICMODELS DATABASE'S PRODUCT TABLE
-- we create view of table containing buyprice of product greater than avg price of products

use classicmodels;
select * from products; 

create view product_above_average_price as
select productName, buyprice from products
where buyprice>(select avg(buyprice) from products);

use windowfun;

-- HERE WE ARE CREATING AND THEN BACKING UP THE DATABASET TO A PARTICULAR LOCATION OF DRIVE D

create database faltu;
use faltu;
-- backup database = faltu
-- to disk = 'D:\backup\faltu.bak'
-- with differential;
select * from product_above_average_price;


select * from student_completedetails; 
-- now suppose we want to drop this above view 

-- TO DROP VIEW 
drop view student_completedetails; 
select * from student_completedetails; 
-- now again we have created deleted view 
-- UPDATING VIEWS
-- REMEMBER SOME POINTS WHILE UPDATING VIEWS 
-- 1)View should have all not null values
-- 2)SELECT statement should not include anny group by or order by clause
-- 3)SELECT stataement should not have any DISTINCT keyword
-- 4)view should not be created through nested or complex queries
-- 5)view should be created from single table

-- NOW SUPPOSE WE WANT TO ADD COLUMN 'AGE' TO THE EXISTING VIEW NAMED  STUDENT_COMPLETEDETAILS 

create or replace view student_completedetails as 
select sd.Name,sd.Address,sm.marks,sm.age
from student_details sd, studentmarks sm 
where sd.Name =sm.Name; 

select * from student_completedetails;

-- Inserting a row in a view: We can insert a row in a View in a same way as we do in a table

-- we are inserting record in view named student_details1 

insert into student_details1(Name, Address)
values('Jai','Gurgaon'),
('Rinni','Chennai'); 

select * from student_details1;
use windowfun; 
create table dimemployee(
emp_id int auto_increment,
fname varchar(56) not null,
lname varchar(23) not null,
Birthdate date not null,
primary key(emp_id)
); 

insert into dimemployee(fname,lname,Birthdate)
values('jai','Tiwari','2021-04-21'),
('vijay','Sharma','2020-03-24'),
('sam','Sharma','2019-07-19'),
('reena','vaid','2018-06-21'),
('Neraj','verma','2012-06-11'),
('Kevin','Brown','1986-12-01'),
('steven','yukis','1976-12-12'),
('Angela','Hines','1990-12-29'),
('Guy','Gillbert','1981-11-12'),
('Kim','Ralls','1983-11-29'),
('Tengiz','Loh','1979-11-27'),
('ravi','tiwari','1986-04-17'),
('Pinki','Dubey','1979-08-26'),
('Rinki','Chabey','1982-07-04'),
('tam','kaul','1992-08-08'),
('shiva','chandra','1983-06-25'),
('preeti','chandra','1987-04-11');
select * from dimemployee;

-- Q-Find age  from BirthDate from dimemployee table(Date function) 
-- Remember some functions below
-- 1)MonthName
-- 2)Datediff(foe days in mysql)
-- 3)DateAdd or Date_add(date interval) like adding 10 days= date_add(Date_add('2012-04-12',interval 10 day)
-- 4)Date_sub
-- 5)Timestampdiff(for year and month in mysql)
-- 6)DayName
select dayname('2022-12-17') as dayName;
select dayofyear('2022-12-17') as dayOfyear;
select dayofmonth('2022-12-17') as dayofmonth;
select day('2022-12-17') as day ;
-- finding last day of month of a date
select last_day('2022-10-24') as lastday;
-- FINDING CURRENTDATE
select current_date();
-- Creating date
select date('2022-10-24') as date;
-- FINDING CURRENT DATE& TIME
select now(); 
-- FINDING MONTH_NAME FROM A PARTICULAR DATE
select monthname('2022-11-17') as month_Name; 
-- finding monthname from a currentdate
select monthname(current_date()) as month_name2;
-- FINDING DAYNAME FROM A PARTICULAR DATE
select dayname('2022-12-17') as day_name;
-- ADDING 3 MONTH TO A DATE
 select date_add('2022-02-24', interval 3 month);
 -- ADDING 4 MONTH TO A currentdate
select date_add(current_date(), interval 4 month) as new_date;
-- ADDING 5 DAYS TO THE CURRENT DATE
select date_add(current_date(), interval 5 day) as new_date;
-- SUBTRACT 4 MONTH FROM CURRENTDATE
select date_sub(current_date(), interval 4 month) as new_date;
-- SUBTRACT 2 DAYS FROM CURRENTDATE
select date_sub(current_date(), interval 2 day) as new_date;
select * from dimemployee;
-- Q-FINDING DAYS FROM BIRTHDATE TILL TODAY
select datediff(current_date(),birthdate) as total_days from dimemployee;
-- Q-FINDING MONTHS FROM BIRTHDATE TILL TODAY
select timestampdiff(month, birthdate,current_date()) as Total_months from dimemployee;
-- finding total years from birthdate  till today
select timestampdiff(year, birthdate,current_date())as Total_yrs from dimemployee;
-- we are creating date format from a particular date 
select date_format('2022-10-24', '%Y,%d %b,%a');

select * from dimemployee; 

update dimemployee
set Birthdate ='1993-05-01'
where emp_id =5;

-- Now again question , we take here
select * from dimemployee;
-- Q-Find age from BirthDate from dimemployee table(Date function)
select fname, Birthdate,timestampdiff(year, Birthdate, current_date()) as Age from dimemployee;
-- now if we only want for month no =12 for birthdate,  then
select fname,lname,Birthdate,timestampdiff(year, Birthdate,current_date()) as Age
from dimemployee
where month(birthdate) =12;

-- so here age 36 is not right if we add age 36 to birthdate it will go beyond birthdate which mean here answer would be 35 and not 36
-- we do condition here 

-- This sql code below  is with respect sql server and not mysql, ok 
select fname,lname,Birthdate,
case
when dateadd(year, birthdate,datediff(yy,birthdate,getdate()))>getdate()
then datediff(yy,Birthdate, getdate())-1
else darediff(yy,Birthdate,getdate()) end as Age
from dimemployee
where month(birthdate)=12;

-- Q-LIST OR MATCHED THE CUSTOMERS WHICH ARE FROM  SAME CITY(FROM WWW.W3SCHOOL.COM)
-- self join


-- select A.customerName, B.customerName, A.City from customers A inner join customers B 
-- where A.customerID<> B.customerID
-- and A.City = B.City;
-- CASE STUDY (SWIGGY FOOD CHAIN)
/*CREATING NEW DATABASE*/ 
create database campus;
-- SWIGGY CASE STUDY ON SQL (FROM CampusX You Tube Channel name)
-- TABLES ARE  PRESENT IN THE DATABASE NAMED CAMPUS FOR PRACTICE 
use campus; 
-- Remember below points
-- order_details1 table act as Fact Table to orders1 and food1(It means orderDetails1 contains foreign key like orderId and f_id)
-- and Orders table act as a Fact Table to restaurants1 and users1 bacause it contains both user_id and r_id as a foreign key
-- and menu1 act as a Fact Table to  both restaurants1 and food1(contains f_id and r_id as foreign key

-- Q-FIND CUSTOMERS(we want name, ok) WHO HAVE NEVER ORDERED
-- refer orders1 and users1 table 
-- order_details1 do not connect with users1 table , so do not confused with it 
use campus;
select name from users1 where user_id not in(select user_id from orders1);

-- Q--FIND CUSTOMERS(we want name, ok) WHO HAVE ORDERED
select name from users1 where user_id in(select user_id from orders1);
insert into users1
values(8,'Jai','jaitiwari24@gmail.com', 'p302h');

-- Q-FIND OUT THE AVERAGE PRICE OF EACH FOOD ITEMS(metion food name)
-- refer table food1,restaurants1 and menu1 
-- here we use  group by on f_id because with respect to each food we want avg price 

select f.f_name as Food_Item, avg(m.price) as Food_Avg_Price 
from food1 f
inner join menu1 m 
on f.f_id = m.f_id 
group by f.f_name
order by Food_Avg_Price desc;

-- Q-ONLY TOP FOOD ITEM WITH AVERAGE PRICE
select f.f_name, avg(m.price) as Avg_Price
from food1 f inner join menu1 m 
on f.f_id= m.f_id
group by f.f_name
order by avg(m.price) desc
limit 1;

-- Q-FIND TOP RESTAURANT IN TERMS OF NUMBERS OF ORDERS FOR A GIVEN MONTH(Take month name of your choice may be  it ,June or May or any month)
-- we want order_details1,orders1,restaurants1 table
-- here order_details1 is fact to orders1 and orders1 is fact to restaurants1 and orders1 is connected to both orders_details and restaurants1

select *,monthname(date) as monthName
from orders1
order by month(date) asc;
--  Suppose we are looking for June month ,now do

select r.r_name,count(o.order_id) as Total_Orders 
from orders1 o
inner join restaurants1 r
on r.r_id  =o.r_id
where monthname(date) like 'June'
group by r.r_name
order by count(o.order_id) desc;

-- WE WANT SUPPOSE ONLY TOP RESTAURANTS NAME WITH MOST ORDERS IN MONTHN  MAY 
use campus;
select r.r_name,count(o.order_id) AS Total_Orders 
from orders1 o 
inner join restaurants1 r 
on o.r_id =r.r_id
where monthname(date) like 'May'
group by r.r_name 
order by count(o.order_id) desc
limit 1;

-- Q-RESTAURANTS WITH MONTHLY SALES GREATER THAN X(it means give restaurants name for any given month where its revenue suppose greater than 500)

select r.r_name ,sum(o.amount) as Total_Revenue 
from orders1 o
inner join restaurants1 r 
on o.r_id=r.r_id
where monthname(date) like 'June'
group by r.r_name
having sum(o.amount)>500
order by r.r_name asc;

-- Q-SHOW ALL ORDERS WITH ORDER DETAILS(orderID,restaurentname,f_name) FOR A PARTICULAR CUSTOMER IN A PARTICULAR DATE RANGE (IMPORTANT)
-- Q-FIND ONLY ORDERS PLACED BY ANKIT 
select * from orders1 where user_id in(select user_id from users1 where name like 'Ankit')
and (date >'2022-06-10' and date<'2022-07-10');

-- AGAIN


-- NOW WE GET THE ANKIT DETAIL FOR A PARTICULAR DATE AND NOW WE WANT OTHER DETAIL LIKE RESTAURANTS NAME

select o.order_id, f.f_name , r.r_name from orders1  o
inner join restaurants1 r
on o.r_id =r.r_id
inner join order_details1 od
on od.order_id = o.order_id
inner join food1 f
on f.f_id =od.f_id
where user_id in(select user_id from users1 where name like 'Ankit')
and (date>'2022-06-10' and date<'2022-07-10');

-- Q-FIND RESTAURANTS WITH MAXIMUM REPEATED CUSTOMERS
-- lets find with respect to each  restaurant and user how many counts are there 

select r_id,user_id,count(*) as visit from orders1
group by r_id,user_id
having visit>1;

-- now we again group by each restaurants because we want max users with respect to each restaurnat
select r_id, count(*) as "Loyal Customers" from(
select r_id,user_id,count(*) as Visits
from orders1
group by r_id,user_id
having Visits>1)t
group by r_id
order by "Loyal Customers";

-- NOW we want those restaurants name right so we join this table with restaurants 
use campus;

select r.r_name, count(*) as "Loyal_Customers" from(
select r_id, user_id,count(*) as Visits
from orders1 o
group by r_id,user_id
having Visits>1)t
inner join restaurants1 r 
on r.r_id = t.r_id
group by t.r_id
order by Loyal_Customers desc limit 1 ;

-- Q-FIND MOST LOYAL CUSTOMERS FOR ALL RESTAURANTS(it means each restaurants name and its most loyal customername who order most number of time)  important 
select r.r_name,u.name,count(*) as Loyal_Customers from(
select r_id, user_id, count(*) as visits
from orders1 o
group by r_id,user_id
having visits>1)t
inner join restaurants1 r 
on r.r_id = t.r_id
inner join users1 u 
on u.user_id = t.user_id
group by t.r_id
order by loyal_customers desc;

-- Q-WE WANT MONTH OVER MONTH REVENUE GROWTH (IMPORTANT QUESTION)
-- fi-- rst we simply select orders1 table and its month because we need months and sales and then previous sales and then
-- we divide current sales-prev sales/prev sales
select  *,monthname(date) as MonthName
from orders1
group by monthname(date)
order by month(date) asc;

select monthname(date) as MonthName,sum(Amount) as TotalAmount
from orders1
group by monthname(date)
order by month(date) asc;

-- now we need prev amount we find it through lag function

WITH sales as(
select monthname(date) as MonthName,sum(Amount) as TotalAmount
from orders1
group by monthname(date)
order by month(date) asc
)
select monthName,TotalAmount,lag(TotalAmount,1) over(order by TotalAmount) as prev_sales
from sales;

select MonthName, ((TotalAmount-prev_sales)/prev_sales)*100 as  MonthOnMonthGrowth from(
WITH sales as(
select monthname(date) as MonthName,sum(Amount) as TotalAmount
from orders1
group by monthname(date)
order by month(date) asc
)
select monthName,TotalAmount,lag(TotalAmount,1) over(order by TotalAmount) as prev_sales
from sales)t;

-- Q-EVERY CUSTOMER NAME AND THEIR FAVOURITE FOOD ITEM
select o.user_id, od.f_id,count(*) as TotalOrders
from orders1 o
inner join
order_details1 od
on o.order_id =od.order_id 
group by o.user_id, od.f_id
having count(*)>1
order by count(*) desc;
-- now

WITH temp as(
select o.user_id, od.f_id,count(*) as TotalOrders
from orders1 o
inner join
order_details1 od
on o.order_id =od.order_id 
group by o.user_id, od.f_id
having count(*)>1
order by count(*) desc
)
select u.name,f.f_name from temp t1
inner join
users1 u on u.user_id = t1.user_id
inner join
food1 f on f.f_id = t1.f_id
 where t1.TotalOrders in(select max(TotalOrders) from temp t2 where t1.user_id = t2.user_id);

-- ALL/ANY IN SQL(www.w3school.com) 
-- T-- he following SQL statement lists the ProductName if it finds ANY records in the OrderDetails table has Quantity equal to 10 
-- both table product_id common 
-- select productName from products where product_id = any(select product_id from orderDetails where Quantity =10); 

-- The following SQL statement lists the ProductName if it finds ANY records in the OrderDetails table has Quantity larger than 1000 

-- select productName from products where productID =any(select productId from OrderDetais where Quantity>1000; 


-- Q-The following SQL statement lists the ProductName if ALL the records in the OrderDetails table has Quantity equal to 10. 
-- select productName from Products where productId =  All(select productId from Orderdetails where Quantity =10);
-- create new table from old table (only structure)

-- select * into new_table
-- from old_table
-- where 1 =0;
-- CREATING NEW TABLE NAMED German_customers from customers and Orders for country Germany

-- select customers.name, customers.age,Orders.OrderId into German_Customers in 'jai84'
-- from  customers c left join Orders o
-- ON c.customerId= o.CustomerID
-- where c.Country = 'Germany';


-- Important SQL Interview Questions FOR DATASCIENCE & ANALYTICS(from Krish Naik channel) by Satyajit pattnaik

-- Q-First 5 character from a column
-- select  left(columnName,5) as first_5 from xyz table;
use campus;
select * from food1;
--  Q-First 5 character from a column 
select left(f_name,5) as new_fname from food1;
-- Q-Suppose last few number of credit card have to convert into ***(masking credit card number)
create table credit_card_details(
credit_card_no varchar(100) not null,
merchant_id varchar(100) not null,
credit_limit int not null,
card_type varchar(56)
)
select * from credit_card_details;
insert into credit_card_details(credit_card_no,merchant_id,credit_limit,card_type)
values('123456789','a476fr873',100000,'m'),
('348726598','hg3467nhd98',100000,'m'),
('258923309','g12gj87h23',100000,'m'),
('128976345','k2whd86g4',100000,'m');

select * from credit_card_details;
-- Q-SUPPOSE WE WANT FIRST 4 DIGIT FROM CREDIT CARD AND REST WANT  AS **, OK SO FIRST FIND FIRST 4 DIGIT
select left(credit_card_no, 4) as new from credit_card_details;
-- Now concat with '*****'
select concat(left(credit_card_no, 4),'*****') as new_mask_creditCardNumber,merchant_id from credit_card_details;

-- EXTRACT FROM 3RD TILL 6 CHARACTERS FROM CREDIT CARD
select substr(credit_card_no,3,6) as new_num from credit_card_details;

use jai_84;
select * from employee11;
-- Q-RETRIEVE THE NAME OF EMPLOYEES WHO HAVE ID GREATER THAN WHAT nikhil has
-- Q-Here ,first we want the id of nikhil, ok
select id from employee11 where name ='nikhil';
select name from employee11 where id>(select id from employee11 where name ='nikhil');
select name,id from employee11 where id>(select id from employee11 where name='nikhil');

-- NOW CREATE VIEW CONTAINING NAME OF EMPLOYEES WHO HAVE ID GREATER THAN NIKHIL ID
create view new_view as
select name from employee11 where id>(select id from employee11 where name='nikhil');
drop view new_view;
select * from new_view;

create table wifi(
wifi_id int not null,
wifi_speed varchar(100) not null,
wifi_latency int,
wifi_date datetime);

INSERT INTO wifi values (1, '500', 10, '2021-01-23');
INSERT INTO wifi values (2, '600', 10, '2021-01-23');
INSERT INTO wifi values (3, '200', 10, '2021-01-23');
INSERT INTO wifi values (4, '100', 10, '2021-01-23');
INSERT INTO wifi values (5, '100', 10, '2021-01-23');

INSERT INTO wifi values (1, '200', 10, '2022-06-19');
INSERT INTO wifi values (2, '300', 10, '2022-06-19');
INSERT INTO wifi values (3, '200', 10, '2022-06-19');
INSERT INTO wifi values (4, '100', 10, '2022-06-19');
INSERT INTO wifi values (5, '100', 10, '2022-06-19');

INSERT INTO wifi values (1, '500', 10, '2021-01-21');
INSERT INTO wifi values (2, '600', 10, '2021-01-21');
INSERT INTO wifi values (3, '200', 10, '2021-01-21');
INSERT INTO wifi values (4, '100', 10, '2021-01-21');
INSERT INTO wifi values (5, '100', 10, '2021-01-21');

select * from wifi;
-- Q-FIND AVERAGE WIFI SPEED FOR EACH WIFI 
select wifi_id, avg(wifi_speed) as Avg_Speed_for_each_wifi
from wifi
group by wifi_id
having avg(wifi_speed)>100
order by Avg(wifi_speed) desc;

-- Q-FIND AVERAGE WIFI SPEED FOR EACH WIFI IN THE LAST TWO DAYS
select wifi_id,wifi_date,avg(wifi_speed) as Avg_Wifi_speed
from wifi
-- where wifi_date>=date_add(sysdate(),interval -2 day)
group by wifi_id,wifi_date
order by wifi_date desc; 

select wifi_id,wifi_date,avg(wifi_speed) as Avg_Speed
from wifi
where wifi_date >= date_add(current_date(),interval -1 day)
group by wifi_id,wifi_date
order by wifi_date desc; 
 
create database if not exists youtube; 

CREATE TABLE empinfo(
first_name varchar(100),
last_name varchar(100),
id int, 
age int,
city varchar(100),
state varchar(100),
PRIMARY KEY (id)
);

INSERT INTO empinfo values ('John', 'Jones', 99980, 45, 'Payson', 'Arizona');
INSERT INTO empinfo values ('Mary', 'Jones', 88232, 25, 'Payson', 'California');
INSERT INTO empinfo values ('Eric', 'Edwards', 99981, 32, 'San Diego', 'Arizona');
INSERT INTO empinfo values ('Mary Ann', 'Edwards', 99982, 32, 'Phoenix', 'Arizona');
INSERT INTO empinfo values ('Ginger', 'Howell', 99983, 42, 'Cottonwood', 'Arizona');
INSERT INTO empinfo values ('Sebastian', 'Smith', 99984, 23, 'Gila Bend', 'Arizona');
INSERT INTO empinfo values ('Gus', 'Gray', 99985, 35, 'Bagdad', 'Arizona');
INSERT INTO empinfo values ('Mary Ann', 'May', 99920, 52, 'Tucson', 'Arizona');

select  * from empinfo;
create table project(
project_id int not null,
project_name varchar(100) not null,
student_id int
); 
-- We have to make student_id here foreign key so first we drop student_id
alter table project
drop column student_id;
-- now add student_id as  foreign key to project table
-- first add student_id in table
alter table project
add column student_id int not null;

alter table project
add foreign key(student_id) references empinfo(id);


show tables;
drop table projects;

insert into project(project_id,project_name,student_id)
values(1,'DataAnalytics',99980),
(1,'DataAnalytics',99981),
(1,'DataAnalytics',99983),
(2,'DataAnalytics',99984),
(2,'DataAnalytics',99985),
(3,'DataAnalytics',99980),
(3,'DataAnalytics',99981),
(4,'DataAnalytics',99981),
(4,'DataAnalytics',99920),
(4,'DataAnalytics',99982);

select * from project;
select distinct student_id from project; 
-- Q-All employeename and if they have project(left join)
select e.first_name, e.last_name,p.project_name
from empinfo e  left join project p
on e.id =p.student_id;

-- Q-we want all project name and if they have employyee assigned(right join)
select e.first_name,e.last_name,p.project_name 
from empinfo e right join project p
on e.id =p.student_id;

-- INNER JOIN
-- we want first employee name and their age and project name
select e.first_name,e.age,p.project_name
from empinfo e inner join project p 
on e.id = p.student_id;

-- UNION JOIN
select count(*)as total_records from empinfo;
select count(*) as total_records from project;

select e.first_name,e.age,p.project_name
from empinfo e left join project p 
on e.id =p.student_id
union
select e.first_name,e.age,p.project_name
from empinfo e right join project p
on e.id =p.student_id;

use youtube;
show tables;
select count(*) as all_records from churn_modelling; 
insert into churn_modelling
values(947, 999999, 'Tiwari', 600, 'France', 'Male', 32, 2, 0, 1, 1, 1, 111111, 1);
delete from churn_modelling where RowNumber =  947; 

-- Q-Each country and minimum EstimatedSalary
select Geography, min(EstimatedSalary) as Each_Country_MinSalary
from churn_modelling 
group by Geography;

select Geography,max(EstimatedSalary) as EachCountryHighestSalary
from churn_modelling
group by Geography
order by max(EstimatedSalary) desc;

-- Q-WE WANT WITH RESPECT TO EACH COUNTRY AND GENDER WE WANT MIN SALARY 
select Geography,Gender,min(EstimatedSalary) as Min_Salary_per_Gender_country
from churn_modelling
group by Geography,Gender
order by Geography asc;

select Geography,Gender,min(EstimatedSalary) as Min_Salary_per_Gender_country
from churn_modelling
group by Geography,Gender
order by Geography asc, Gender desc;

select Geography,Gender,min(EstimatedSalary) as Min_Salary_per_Gender_country 
from churn_modelling
group by Geography,Gender
order by min(EstimatedSalary) desc;
-- USE OF HAVING 

select Geography,Gender,min(EstimatedSalary) as MinDSalaryPerCountry
from churn_modelling
where Geography <>'Spain'
group by Geography,Gender
having min(EstimatedSalary)>400
order by min(EstimatedSalary) desc;

-- Q-First 7 records from churn_modelling table

select * from churn_modelling
limit 7; 
-- Q-WANT SECOND HIGHEST SALARY FROM CHURN_MODELLING TABLE
select Geography,Surname,EstimatedSalary as secondHighestSalary from  churn_modelling
order by EstimatedSalary desc
limit 1,1;

select concat(Geography,', ',Surname)as new_name from churn_modelling;

-- we want country and uppercase country for first 4 records

select Geography, upper(Geography) as new_name
from churn_modelling
limit 4;

CREATE table transaction_details(
prod_name varchar(50),
prod_id int NOT NULL,  
order_date datetime,
amount int);

INSERT INTO transaction_details VALUES ('Motorola', 1, '2020-01-01', 10000);
INSERT INTO transaction_details VALUES ('Canon Camera', 2, '2020-02-01', 60000);
INSERT INTO transaction_details VALUES ('Mousepad', 3, '2020-03-01', 2000);
INSERT INTO transaction_details VALUES ('Razer', 4, '2020-04-01', 3000);
INSERT INTO transaction_details VALUES ('ABC', 5, '2020-05-01', 1200);
INSERT INTO transaction_details VALUES ('DEF', 6, '2020-06-01', 2500);
INSERT INTO transaction_details VALUES ('XYZ', 7, '2020-07-01', 90000);
INSERT INTO transaction_details VALUES ('ABBBB', 8, '2020-08-01', 123100);
INSERT INTO transaction_details VALUES ('ASADASD', 9, '2020-09-01', 1500);
INSERT INTO transaction_details VALUES ('Pencil', 10, '2020-10-01', 10);

select * from transaction_details; 

-- Q- WE WANT TO FROM SPECIFIC DATE SUPPOSE '2021-01-01' to each mention order_date in the table ,
-- how many days happen for each product, ok(IMP)
select datediff('2021-01-01', order_date) as NumberOfDays,prod_name,order_date
from transaction_details; 
select date_format(order_date, '%Y') as Year, quarter(order_date), order_date
from transaction_details; 

select order_date, date_add(order_date, interval 2 day) as new_order_date
from transaction_details;

select * from churn_modelling 
where Surname like 'a%';
-- Q-Surname contains a,b,c,d
select * from churn_modelling
where Surname regexp '[abcd]';

select * from churn_modelling
where Surname regexp '[a-z]';

create table dep(
depid int,
depname varchar(20),
depaddress varchar(100),
PRIMARY KEY (depid)
);
 
 
insert into dep values (1, 'Physics', 'India');
insert into dep values(2,'computer','India');

create table employee(
empid int,
empname varchar(50),
empadd varchar(200),
depid int,
PRIMARY KEY (empid),
FOREIGN KEY (depid) references dep(depid)
);

insert into employee values (1, 'Sat', 'HK', 1);
insert into employee values (2, 'Ramesh', 'India', 1);
insert into employee values (3, 'Rajesh', 'India', 2);
select * from employee;

create table employee_new(
firstname varchar(100),
lastname varchar(100),
title varchar(3), 
age int,
salary int
);

insert into employee_new values ('Satyajit', 'Pattnaik', 'Mr', 32, 10000);
insert into employee_new values ('Ramesh', 'Verma', 'Mr', 31, 20000);
insert into employee_new values ('Shalini', 'Gupta', 'Ms', 25, 10000);

select * from employee_new;
update employee_new
set emp_id=3 where firstname = 'Shalini';

alter table employee_new
drop column salary;


drop table employee_new;

-- Q-NOW WE WANT TO ADD emp_id column to the employee_new table then 
alter table employee_new
add column emp_id int;

-- NOW USING EMPINFO TABLE FOR SOME QUERIES
-- all detail from arizona 
select * from empinfo where state ='Arizona';

-- Q-TOTAL COUNT OF EMPLOYEES WHO STAYS IN ARIZONA
select count(id) as TotalEmployees
from empinfo
where state = 'Arizona'; 

-- -Find the list of employees whose name starts with 'M'
select * from empinfo
where first_name like 'M%';

-- -Find the list of employees whose name ends with 'n'
select * from empinfo
where first_name like '%n';
-- -Find the list of employees whose name contains 'a'
select * from empinfo
where first_name like '%a%';
-- -Find the list of employees whose name start with 's' and end with 'n'
select * from empinfo
where first_name like 's%n';
-- Q-Find firstname whos second word start with 'u'
select * from empinfo
where first_name like '_u%';
-- Q-Name start with 'G' and has 5 characters
select * from empinfo
where first_name like 'G_____';
-- Q-Name having total 4 characters and end with 'y'
select * from empinfo
where first_name like '___y';

-- Q-Find all the employees that are staying in Arizona and age > 30
select * from empinfo
where state = "Arizona" and age>30;

-- Q- Find the list of employees whose name contains 'ar'
select * from empinfo
where first_name like '%ar%';
-- Q-Find the list of employees whose name starts with either M or J 
select * from empinfo
where first_name like 'M%' or first_name like 'J%';

select * from empinfo
where first_name ="Mary";

-- Modify empinfo table age =30 where name is 'Sebastian' 
update empinfo
set age =30,city='Gurgaon'
where first_name ='Sebastian';

select * from empinfo;

-- --Q-- DELETE ALL RECORDS WHERE FIRSTNAME START WITH MARY
delete from empinfo where first_name like 'M%';
-- WWW.MODE.COM
use youtube; 
-- Q-Write a query that surfaces all rows for top-10 hits for which Ludacris is part of the Group. 
-- use table artistsreport table from youtube database 
select * from youtube.artistsreport;

select * from artistsreport
where year_rank<=10 and
"group" like '%ludacris%';
-- NOTE:-	IN above table ,column name is group which is also a function name in sql, so we use here "group" instead of group 
-- but in mysql "group" is not working  and uper wala query returns nothing, either we able to change its name see below 
-- alter table artistsreport
-- rename column group to GroupName;

-- NOW WE HAVE CHANGE GROUP column name to any other name in excel file only ,from where we have uploaded the file artistsreport ok 
-- and again import in youtube database

-- Q-Write a query that surfaces all rows for top-10 hits for which Ludacris is part of the Group.
select * from artistsreport2
where year_rank<=10 and GroupName like '%ludacris%';

-- Q-Write a query that surfaces the top-ranked records in 1990, 2000, and 2010. 
select * from artistsreport2
where year_rank = 1 and year IN(1990,2000,2010);

-- Q-Write a query that lists all songs from the 1960s with "love" in the title. 
select * from artistsreport2
where year between 1960 and 1969 and song_name like '%Love%';

-- Q-record with no artists 
select * from artistsreport2
where artist is null;

-- Q-WE WANT TOP 10 SONG FOR 2007 FOR GROUP HAVING OR CONTAINING FEAT 
select * from artistsreport2
where year = 2007 and year_rank <=10 and GroupName like '%feat%';
-- Q-WE WANT RANK=5 OR TAKE GROUP NAME 'Gotye'
use youtube;
select * from artistsreport2
where year_rank = 5 or artist = 'Chingy';
-- Q- WE WANT YEAR=2003 AND GROUP CONTAINING 'Missy' or  'Yung'
select * from artistsreport2
where year = 2003 and(GroupName like '%Missy%' or GroupName like '%Yung%');

select * from artistsreport2
where year = 2004 and(GroupName like '%Missy%' or GroupName like '%ludacris%');

-- Q- WRITE QUERY THAT CONTAIN SONG TITLE 'STAND UP' AND YEAR EITHER 2000S OR 2020S 
select * from artistsreport2
where song_name like '%stand up%' and(year between 2000 and 2010 or year between 2011 and 2020);

-- Q-All Records that contain or feature 'Ludacris' before 2004 or after 2007
select * from artistsreport2
where GroupName like '%Ludacris%'and(year <=2004 or year>=8);

-- Q-SELECT YEAR 2004 AND RANK NOT 1 AND 7
select * from artistsreport2
where year =2004
and year_rank not between 1 and 7;

-- Q- we want year 2003 and rank less than 50
select * from artistsreport2
where year =2003
and year_rank <=50;

-- Q-write query where year =2003 and group not like featuring 'Usher'
select * from artistsreport2
where year = 2003 and GroupName not like '%Usher%';
-- Q-write query where year =2003 and artist should not empty (it should be there)
select * from artistsreport2
where year =2003 and artist is not null;

-- Q-Write a query that returns all rows for songs that were on the charts in 2005 and do not contain the letter "Jamie". 
select * from artistsreport2
where year =2005 and song_name not like '%jamie%';

-- Q- we want year 2005 and rank in ascending accordingly 
select * from artistsreport2
where year =2005
order by year_rank ;

select * from artistsreport2
order by artist;

-- Q-FILTER RECORDS IN SUCH A WAY THAT RANK SHOULD BE LESS THAN EQUAL TO 40 AND AND ARRANGE ACCORDINGLY
-- AND YEAR ACCODINGLY TO HIGHEST TO LOWEST 
select * from artistsreport2
where year_rank <=40
order by year_rank asc,year desc;

-- Q-Write a query that returns all rows from 2010 ordered by rank, with artists ordered alphabetically for each song 

select  * from artistsreport2
where year =2010
order by year_rank,artist asc;

-- Q-Write a query that shows all rows for which 'Ludacris'was a group member, 
-- ordered by rank on the charts, from lowest to highest rank (from 100 to 1).

select * from artistsreport2
where GroupName like '%Ludacris%'
order by year_rank desc;

-- Q-Write a query that returns songs that ranked between 20 and 70 (inclusive) in 2010, 2003,2005, or 2012. 
-- Order the results by year and rank 
select * from artistsreport2
where year in(2003,2005,2010,2011)
and year_rank between 20 and 70 
order by year,year_rank;

-- Q-Write a query that only shows rows for which the month_name starts with the letter "N" or
--  an earlier letter in the alphabet.
select * from xyz 
where month_name <o;

-- Q-Write a query that calculates the sum of all four regions in a separate column.
-- SELECT year,
--        month,
--        west,
--        south,
--        midwest,
--        northeast,
--        west + south + midwest +northeast AS usa_total
--   FROM tutorial.us_housing_units

-- Q-Write a query that returns all rows for which more units were produced in the West region than in the Midwest and Northeast combined.

-- select year,month,west,midwest,northeast
-- from xyz 
-- where west >(midwest+northeast);

-- Q-WANT ALL RECORD +AVERAGE OF NORTH,WEST REGION
-- select year,month,north,south,east,west,(north+west)/2 as Avg_of_northWest
-- from xyz

-- Q-Write a query that calculates the percentage of all houses completed in the United States represented by each region. 
-- Only return results from the year 2000 and later.
-- Hint: There should be four columns of percentages.

-- select year,month 
-- west/(west+south+midwest+northeast)*100 as west_pct,
-- south/(west+south+midwest+northeast)*100 as south_pct,
-- midwest/(west+south+midwest+northeast)*100 as midwest_pct,
-- northeast/(wwest+south+midwest+northeast)*100 as northeast_pct
-- from xyz
-- where year>=2000;
use youtube;
select month(current_date()) as d;

-- USE OF COALESCE FUNCTION
select coalesce(null,'jaiTiwari') as j;

select coalesce(null,null,'jaitiwari');
select coalesce(null,'jaitiwari',null);

select trim('  python pandas is a great analysis tool  '); 
select mod(43,5) as remainder;
select mod(30,5) as remainder;

select pow(2,4) as new_exponential_value;
select floor(5.67) as new_value;
select floor(45.0234) as new_value; 
select floor(-51.453) as new_value;
-- -52
select floor(-6.98) as new_value;
-- -7

select ceil(34.098) as new_value;
select ceil(4.012) as new_value; 
select ceil(-5.067) as new_value;
select ceil(-56.78) as new_value;
select least('jai', 'JAI');

-- IFNULL
-- If expr1 is not NULL, returns expr1; otherwise it returns expr2
-- ifnull take only 2 argument
select ifnull(0,100);
select ifnull(24,0);
select ifnull(0,0,24);
select ifnull(null,'jai');
select ifnull('sam',null);
select abs(-25)as new_value;
-- ADDING 1 WEEKS FROM TODAY
select date_add(current_date(), interval 1 week) as next_week;
-- days between birthday and now
select datediff(current_date(), '2022-10-24') as no_of_days_since_birthday;
-- No of months since my birthday
-- for month&year we use timestampdiff
select timestampdiff(month, '2022-10-24',current_date()) as No_Of_Month;
-- SUBSTRING()
-- The SUBSTRING() function extracts a substring from a string (starting at any position) 
select substring('JaiPrakashTiwari', 1,3) as extract_str;
select substring('Python Pandas', 8,6) as extract_str;
select substring("SQL Tutorial", -8,5) as extract_str;

select reverse('JaiTiwari') as reverse_name;
select reverse('Jai')as reverse_str; 
select reverse(depname) as reverse_column from dep;

-- REPLACE(string, substring, new_string)
select replace('Python Tutorial', 'Python','Pandas') as new_text;
select replace('Python Tutorial', 'Python','Numpy') as new_txt1;
select replace("XYZ FGH XYZ", "X","m") as new_txt;
select concat('jai','_','Tiwari') as new_txt;
select rtrim("  jaitiwati  ") as new_txt;

SELECT SUBSTRING_INDEX("www.w3schools.com", ".", 2);
-- FROM DAYS TO DATE
select from_days(985467);
select from_days(885469) as date;

-- FROM DATE TO DAY
select to_days('2022-10-24') as nw_date;
select to_days('2021-10-24') as noofdays;
select to_days('2020-10-24') as total_days; 

-- from youtube database take employee_new table

-- --Q- where emp_id is 3 ,then age multiply by 2 and age multiply by 3 where epm_id=2
use youtube;
select firstname,age,emp_id,
case when emp_id=2 then 3*age
when emp_id =3 then 2*age
else age
end as "new_age"
from employee_new; 

-- Q-Consider a table column product_id,product_name,buying_price,selling_price,selling_date(eg-'2022-10-02') 
-- Q-Now, we are going to find the number of products sold per month(month_no)
-- select month(selling_date) as month,count(product_id) as Total_Product
-- from xyz table
-- group by month(selling_date)
-- order by month(selling_date); 

-- Male who geting salary more than 3000
-- select gender, salary from xyz 
-- where gender ='male' and salary>3000;


-- Q-SOME ANNALYSIS ON MUSIC STORE BY USING SQL 
use campus;
-- Q-- -FIND ODD ROWS
select * from food1 where mod(f_id,2)<>0;
-- Q-FIND EVEN ROWS 
select * from food1; 
select * from food1 where mod(f_id,2)=0;

use campus;
create table worker(
worker_id varchar(100) not null,
first_name varchar(100),
last_name varchar(100),
salary int,
joining_date datetime,
department varchar(100)
);  

INSERT INTO worker values ("001", "Monika", "Arora", 100000, '2014-02-20 09:00:00', "HR");
INSERT INTO worker values ("002", "Niharika", "Verma", 80000, '2014-06-11 09:00:00', "Admin");
INSERT INTO worker values ("003", "Vishal", "Singhal", 300000, '2014-02-20 09:00:00', "HR");
INSERT INTO worker values ("004", "Amitabh", "Singh", 500000, '2014-02-20 09:00:00', "Admin");
INSERT INTO worker values ("005", "Vivek", "Bhati", 500000, '2014-06-11 09:00:00', "Admin");
INSERT INTO worker values ("006", "Vipul", "Diwan", 200000, '2014-06-11 09:00:00', "Account");
INSERT INTO worker values ("007", "Satish", "Kumar", 75000, '2014-01-20 09:00:00', "Account");
INSERT INTO worker values ("008", "Geetika Chauhan", "Arora", 90000, '2014-04-11 09:00:00', "Admin"); 
select * from worker;

CREATE table title(
worker_ref_id int,
worker_title varchar(100), 
affected_from datetime);

INSERT INTO title values (1,'Manager','2016-02-20 00:00:00');
INSERT INTO title values (2,'Executive','2016-06-11 00:00:00');
INSERT INTO title values (8,'Executive','2016-06-11 00:00:00');
INSERT INTO title values (5,'Manager','2016-06-11 00:00:00');
INSERT INTO title values (4,'Asst. Manager','2016-06-11 00:00:00');
INSERT INTO title values (7,'Executive','2016-06-11 00:00:00');
INSERT INTO title values (6,'Lead','2016-06-11 00:00:00');
INSERT INTO title values (3,'Lead','2016-06-11 00:00:00');

 
-- Q-# Sql query to print details of the workers who are managers
-- using campus database
select * from title;
select * from worker;

select w.first_name, t.worker_title from 
worker w inner join title t 
on w.worker_id =t.worker_ref_id 
where t.worker_title ="Manager";

-- Q-# Sql query to print name of employees having the highest salary in each department 
-- here first we will find each department and their highest salary and then use upper query 
select t.first_name,t.department,t.salary from
(select department, max(salary) as max_salary
from worker 
group by department) as tempnew 
inner join worker t 
on t.department =tempnew.department and
t.salary =tempnew.max_salary;

use storage24;
select * from demotable;
select min(joiningdate)as firstdate,max(joiningdate) as lastdate
from demotable;