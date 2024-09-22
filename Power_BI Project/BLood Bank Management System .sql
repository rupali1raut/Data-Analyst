-- *******************************PROJECT ON BLOOD BANK MANAGMENT SYSTEM.*******************************

-- create table donor
create table donor(
  donor_id int primary key auto_increment,
  d_name varchar(20),
  d_age int,
  d_blood_group varchar(20),
  d_contact_no int,
  health_status varchar(50)
  );
  
-- describe table donor.
  desc donor;

-- create table recipients 
  create table recipients(
  recipient_id int primary key,
  r_name varchar(20),
  r_age int ,
  r_blood_group varchar(20),
  r_contact_no varchar(20),
  hospital_id int
);
-- describe table recipients
desc recipients;

-- create table hospital
create table hospital(
  hospital_id int primary key,
  h_name varchar(30),
  h_location VARCHAR(50),
  h_contact_no varchar(20)
);
-- describe table hospital
desc hospital;

-- create table blood_bank
CREATE TABLE blood_bank(
  blood_bank_id int primary key ,
  donor_id INT,
  recipient_id int,
  blood_type VARCHAR(3),
  quantity INT,
  testing_results TEXT,
  quality_status VARCHAR(20),
  donation_date DATE
);
-- describe table blood_bank
desc blood_bank;

-- change table donor's data type.
alter table donor modify d_contact_no varchar(20);
desc donor;

-- insert one record into donot table
insert into donor values(1,"sameer",24,"B+","1234567898","healthy");

-- fetching records from donor
select * from donor;

-- insert multiple records into table at a time.
insert into donor values(2,"rupali",24,"A+","2345678998","healthy"),
(3,"rohini",34,"o+","2345378998","unhealthy"),
(4,"sakshi",27,"o+","2322378998","unhealthy"),
(5,"sunil",29,"AB+","2341118998","healthy"),
(6,"kunal",25,"o+","1345378998","healthy"),
(7,"kajal",26,"A+","2345370998","healthy"),
(8,"priya",44,"A-","2345000098","unhealthy"),
(9,"saurabh",28,"B-","2304478998","unhealthy"),
(10,"sanket",29,"o+","234500298","healthy"),
(11,"rohan",34,"o+","23453777998","healthy"),
(12,"poonam",44,"o-","2344448998","unhealthy"),
(13,"shivani",31,"o+","23425378998","healthy");
select * from donor;

-- insert multiple record into table recipients.
insert into recipients values(1,'John Doe', 25, 'A+', "1234567890", 1001),
(2, 'Jane Smith', 30, 'B-', "9876543210", 1002),
(3, 'Michael', 40, 'AB+', "5555555555", 1001),
(4, 'Emily Davis', 28, 'O-', "1111111111", 1002),
(5, 'David Lee', 35, 'A-', "2222222222", 1001),
(6, 'Olivia Taylor', 22, 'B+', "3333333333", 1002),
(7, 'Noah Miller', 45, 'AB-', "4444444444", 1001),
(8, 'Emma Wilson', 38, 'O+', "5555555555", 1002),
(9, 'Oliver Carter', 27, 'A+', "6666666666", 1001),
(10, 'Ava Johnson', 32, 'B-', "7777777777",1002),
(11, 'Jacob Thomas', 42, 'AB+', "8888888888", 1001),
(12, 'Sophia Brown', 29, 'O-', "9999999999", 1002),
(13, 'William Jones', 37, 'A-', "0000000000", 1001),
(14, 'Amelia Davis', 24, 'B+', "1111111111", 1002),
(15, 'Liam Miller', 33, 'AB-', "2222222222", 1001);
select * from recipients;

-- insert record into table hospital.
insert into hospital values(1001,"Pune goverment hospital","Pune,Maharashtra", "2222222444"),
(1002,"city hospital","Pimpari-chonchwad","9999992344");
select * from hospital;

-- remove 2 columns at a time from table using drop.
alter table blood_bank drop column donor_id ,drop column recipient_id;

-- insert record into table blood_bank
insert into blood_bank values(10,'B+',2,"match","pure","2024-01-01"),
(11, 'A-', 3, "partial", "impure", "2023-12-25"),
(12, 'AB+', 4, "partial", "pure", "2024-02-15"),
(13, 'O-', 5, "partial", "impure", "2023-11-10"),
(14, 'A+', 6, "full", "pure", "2024-03-01"),
(15, 'B-', 7, "partial", "impure", "2023-10-05"),
(16, 'AB+', 8, "full", "pure", "2024-04-15"),
(17, 'O-', 9, "partial", "impure", "2023-09-01"),
(18, 'A+', 10, "full", "pure", "2024-05-15"),
(19, 'B-', 11, "partial", "impure", "2023-08-01");

select * from blood_bank;

-- change d_age value where id=8
update donor set d_age=45 where donor_id=8;
select * from donor where donor_id=8;

-- ===============================================================================

-- As per our table we will find out the following data analysis quetions for DONOR.

-- Quetion 1. who is senior donor based on their age.
select * from donor order by d_age desc limit 1;
select * from donor;

-- Quetion 2.Find out max age in every blood group.
select d_blood_group,max(d_age) from donor 
group by d_blood_group;

-- Quetion 3. Count the total number of donors
select count(donor_id) from donor;

-- Quetion 4.Find the average age of donors
select avg(d_age) from donor;

-- Quetion 5.Determine the count of every blood group:
select d_blood_group, count(donor_id) from donor
group by d_blood_group;

-- Quetion 6.Determine the most common blood group:
select d_blood_group,count(donor_id) from donor
group by d_blood_group
order by count(donor_id) desc limit 1;

-- Quetion 7.finding count of quality_status in every blood type ,quality_status.
select blood_type,quality_status,count(quality_status) from blood_bank 
group by blood_type,quality_status;

-- Quetion 8. write a query to return blood_bank_id,blood_type,testing_results where quality states pure,
-- return ur list ordered alphabitically by blood type started with A.
select blood_bank_id,blood_type,testing_results,quality_status from blood_bank
where quality_status='pure'
order by blood_type asc;

-- Quetion 9.Identify the oldest and youngest donors:
select * from donor
order by d_age asc limit 1;

select * from donor
order by d_age desc limit 1;

-- OR --

select d_name,d_age from donor 
where d_age=(select max(d_age) from donor);

select d_name,d_age from donor 
where d_age=(select min(d_age) from donor);

-- ==================================================================================================

-- As per our table we will find out the following data analysis quetions for table recipients.

-- Quetion 1.Find the distribution of recipients by age group:
select case
  when r_age between 18 and 25 then "18-25"
  when r_age between 26 and 33 then "26-33"
  when r_age between 34 and 40 then "34-40"
  else "greater than 40"
  End as age_group,
  count(*) from recipients
  group by age_group;
  
-- add new column in table
alter table recipients add gender VARCHAR(20);

-- add data in new column for existing records.
UPDATE recipients set gender = "F" where recipient_id=1;
UPDATE recipients set gender = "F" where recipient_id=2;
UPDATE recipients set gender = "M" where recipient_id=3;
UPDATE recipients set gender = "F" where recipient_id=4;
UPDATE recipients set gender = "F" where recipient_id=5;
UPDATE recipients set gender = "F" where recipient_id=6;
UPDATE recipients set gender = "F" where recipient_id=7;
UPDATE recipients set gender = "M" where recipient_id=8;
UPDATE recipients set gender = "M" where recipient_id=9;
UPDATE recipients set gender = "F" where recipient_id=10;
UPDATE recipients set gender = "M" where recipient_id=11;
UPDATE recipients set gender = "F" where recipient_id=12;
UPDATE recipients set gender = "M" where recipient_id=13;
UPDATE recipients set gender = "F" where recipient_id=14;
UPDATE recipients set gender = "F" where recipient_id=15;
select * from recipients;


-- insert one duplicate record in recipients TABLE
insert into recipients values(20, 'Jane Smith', 30, 'B-', "9876543210", 1002,"F"),
(30, 'Michael', 40, 'AB+', "5555555555", 1001,"F");

select * from recipients;

-- Quetion 2. count of female recipients
select count(*) from recipients where gender ="F";

-- Quetion 3.count of female,Male recipients
select gender,count(*) from recipients 
group by gender;

-- Quetion 4.list out the female recipients count according to blood groups.
select r_blood_group,count(gender) from recipients where gender ="F"
group by r_blood_group;

-- Quetion 5.find out most commonly which blood group required for female recipients.
select r_blood_group,count(gender) from recipients where gender="F"
group by r_blood_group
order by count(gender) desc limit 1;

-- Quetion 6.find out least common which blood group require for female recipients.
select r_blood_group,count(gender) from recipients where gender="F"
group by r_blood_group
having count(gender) <=1;

-- Quetion 7.list out male  recipients count according to blood group
select r_blood_group,count(gender) from recipients where gender="M"
group by r_blood_group;

-- Quetion 8.find out most common which blood group require for male recipients.
select r_blood_group,count(gender) from recipients where gender="M"
group by r_blood_group
order by count(gender) desc limit 1;

-- Quetion 9.find out least commonly which blood group required for female recipients.
select r_blood_group,count(gender) from recipients where gender="M"
group by r_blood_group
having count(gender)<=1;

-- Quetion 10.which hospital has the highest no. of recipients
select hospital_id,count(*) from recipients 
group by hospital_id
order by count(*) desc limit 1;

--  Quetion 11.certain blood groups use at specific hospitals(1001 hospital_id)
select hospital_id,r_blood_group,count(hospital_id) from recipients
where hospital_id=1001
group by r_blood_group,hospital_id
order by count(hospital_id) desc limit 1;

--  Quetion 12.certain blood groups use at specific hospitals(1002 hospital_id)
select  hospital_id,r_blood_group,count(hospital_id) from recipients
where hospital_id=1002
group by hospital_id,r_blood_group
order by count(hospital_id) desc limit 1;
 
-- Quetion 13.What is the average age of recipients at each hospital?
select hospital_id,avg(r_age) from recipients
group by hospital_id;

-- Quetion 14.count of age_ distribution of recipients according to age;

select case 
  when r_age between 25 and 33 then "25 to 33"
  when r_age between 34 and 40 then "34 to 40"
  else "40+"
  End as age_distribution,
  count(*) from recipients
  group by age_distribution;
  
-- ===============================================================================================

-- -- As per our table we will find out the following data analysis quetions for table hospital.

-- Quetion 1.Count the number of hospitals in each location.
select h_location,count(hospital_id) from hospital
group by h_location;

-- insert 3 more records
insert into hospital values(1003,"city care","Pimpari-chonchwad",3433848385),
(1004,"pune speciality ","Pimpari-chonchwad",3433848385),
(1005,"sasun","Loni",3433848385);

select * from hospital;

-- Quetion 2.Find the most common hospital location:
select h_location, count(hospital_id) from hospital
group by h_location
order by count(hospital_id) desc limit 1;

-- Quetion 3.Calculate the average length of hospital names:
select avg(length(h_name)) from hospital;

-- =============================================================================================

-- As per our table we will find out the following data analysis quetions for table blood bank.

-- Quetion 1.max of blood quantity with respect to blood group.
select blood_type,max(quantity) from blood_bank
group by blood_type;

-- Quetion 2.Distribution of Blood Types
select blood_type ,count(*) from blood_bank
group by blood_type;

-- Quetion 3.count of testing result of each quality_status & testing_results.
select quality_status,testing_results,count(testing_results) from blood_bank
group by quality_status,testing_results;

-- Quetion 4.Which blood types are most frequently donated?
select blood_type,count(*) from blood_bank
group by blood_type
order by count(*) desc limit 1;

-- desc blood_bank;

-- Quetion 5.finding out days since donation
select blood_bank_id, donation_date, DATEDIFF(donation_date, CURDATE()) AS days_since_donation
FROM blood_bank;

-- =============================================================================================

-- create table blood units
CREATE TABLE blood_units (
    unit_id INT ,
    donor_id INT,
    recipient_id INT,
    blood_group VARCHAR(3),
    quantity INT,
    testing_results TEXT,
    quality_status VARCHAR(20),
    donation_date DATE,
    FOREIGN KEY (donor_id) REFERENCES donor(donor_id),
    FOREIGN key (recipient_id) REFERENCES recipients(recipient_id)
    );
  desc blood_units;
  
-- insert record in blood units
insert into blood_units values(1,2,1,"A+",2,"match","pure","2024-01-01"),
(2,3,2,"B+",5,"partial","impure","2024-03-01"),
(1,2,1,"A+",2,"match","pure","2024-01-01");

-- Quetion 1.finding unique records from table using distinct.
select distinct * from blood_units;

select * from blood_units;

-- Quetion 2.join 2 tables
select d_name,d_age,unit_id,quality_status from donor
join blood_units on donor.donor_id=blood_units.donor_id
where quality_status="pure"
order by blood_group asc;

-- ---------------------------------------------------------------------------------------------------------
-- removing Duplicates, using subquery nd rowid


-- select * from employees where rowid not in (select min(rowid) from employees group by first_name, last_name, department_id)

