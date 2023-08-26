use mydb;
create table campaign(
id int primary key,
course_name varchar(50) not null,
start_date date,
end_date date,
instructor_name varchar(50) unique,
constraint check_date check (end_date <= start_date + interval '3' month)
);

desc campaign;

INSERT INTO campaign VALUES 
(1, 'SQL basics', STR_TO_DATE('12-06-2023', '%d-%m-%Y'), '2023-09-12', 'jimin'),
(2, 'Data Visualization', STR_TO_DATE('03-20-2023', '%m-%d-%Y'), '2023-05-21', 'smith'),
(3, 'ML Fundamentals', STR_TO_DATE('08-01-2023', '%m-%d-%Y'), '2023-10-01', 'jhope'),
(4, 'Python Fundamentals', STR_TO_DATE('12-31-2023', '%m-%d-%Y'), STR_TO_DATE('03-31-2024', '%m-%d-%Y'), 'jessica'),
(5, 'data mining', '2023-05-05', '2023-08-05', 'nam joon'),
(6, 'statistical analysis', '2024-01-22','2024-02-22', 'taehyung'),
(7,'data warehousing', '2023-02-28', STR_TO_DATE('28-04-2023', '%d-%m-%Y'), 'jin'),
(8,'big data analytics', '2023-04-15', '2023-06-15','williams'),
(9, 'data science bootcamp','2023-09-06','2023-12-06','suga'),
(10,'predective analysis','2023-07-07','2023-08-08','jung kook');

select * from campaign;
===================================================================================================================================================
create table customer_1(
cus_id int , 
cus_name varchar (20),
email varchar (50),
phone_no bigint check (length (phone_no)=10),
primary key (cus_id,phone_no)
); 

desc customer_1;

INSERT INTO customer_1 VALUES 
(001, 'amrith', 'amrith@gmail.com', '9894542649'),
(002, 'banu', 'banu@gmail.com', '9894542612'),
(003, 'catherine', 'catherine@gmail.com', '9894542623'),
(004, 'daisy', 'daisy@gmail.com', '9894542634'),
(005, 'fahad', 'fahad@gmail.com', '9894542645'),
(006, 'guru', 'guru@gmail.com', '9894542656'),
(007, 'lizy', 'lizy@gmail.com', '9894542667'),
(008, 'madhan', 'madhan@gmail.com', '9894542678'),
(009, 'nehru', 'nehru@gmail.com', '9894542689'),
(010, 'perumal', 'perumal@gmail.com', '9894542690');

select * from customer_1;
===================================================================================================================================================

create table advertisement(
ad_id varchar(5) primary key,
campaign_id int,
ad_name varchar(30) not null,
ad_type varchar(15),
cost decimal,
foreign key (campaign_id) references campaign(id)
);

desc advertisement; 

INSERT INTO advertisement VALUES 
('A001', 7, 'Data warehousing banner', 'Banner', 550),
('A002', 2, 'data viz discount ad', 'text', 200),
('A003', 5, 'data mining promo', 'Banner', 700),
('A004', 4, 'Python analysis ad', 'text', 300),
('A005', 3, 'ML fundamentals banner', 'Banner', 600),
('A006', 1, 'SQL basics banner', 'Banner', 500),
('A007', 6, 'statistical analysis ad', 'text', 250),
('A008', 3, 'ML fundamentals video', 'video', 900),
('A009', 7, 'Data warehousing video', 'video', 850),
('A010', 1, 'SQL basics video', 'video', 800);

select * from advertisement;
===================================================================================================================================================

create table performance(
p_id varchar(5) primary key,
advertisement_id varchar(5),
customer_id int,
date date,
clicks int,
impressions int,
conversions int,
foreign key (customer_id) references customer_1(cus_id),
foreign key (advertisement_id) references advertisement(ad_id)
);

desc performance;

INSERT INTO performance VALUES
('P001', 'A003', 006, '2023-06-10', 100, 5000, 10),
('P002', 'A006', 001, '2023-08-13', 150, 6000, 12),
('P003', 'A004', 010, '2024-01-02', 120, 5500, 11),
('P004', 'A008', 004, '2023-09-06', 200, 7000, 15),
('P005', 'A010', 009, '2023-07-26', 80, 4000, 8),
('P006', 'A001', 001, '2023-03-05', 90, 4500, 9),
('P007', 'A005', 005, '2023-08-31', 130, 5500, 10),
('P008', 'A007', 002, '2024-01-24', 130, 5500, 10),
('P009', 'A002', 008, '2023-04-19', 180, 6500, 14),
('P010', 'A009', 009, '2023-03-28', 95, 4800, 11),
('P011', 'A001', 004, '2023-04-04', 105, 5200, 13),
('P012', 'A005', 010, '2023-09-18', 160, 6000, 16),
('P013', 'A007', 006, '2024-02-04', 140, 5700, 12),
('P014', 'A003', 003, '2023-07-20', 170, 6300, 15),
('P015', 'A009', 007, '2023-03-02', 125, 5100, 11); 

select * from performance;
===================================================================================================================================================

select * from campaign a inner join advertisement b on a.id = b.campaign_id;
