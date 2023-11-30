use master 
go
if DB_ID('Badminton') is not null 
	drop database Badminton
go
create database Badminton
go
use Badminton
go
use Badminton
go
create table tb_Role (
	id int identity(1,1) not null primary key,
	rolename nvarchar(20) not null
)
go
create table tb_User (
	id int identity(1,1) not null primary key,
	fullname nvarchar(50) not null,
	username varchar(50) unique not null,
	phonenumber varchar(15),
	addr nvarchar(200),
	passwd varchar(32) not null,
	role_id int foreign key references tb_role(id)
)
go
create table tb_Category (
	id int identity(1,1) not null primary key,
	categoryname nvarchar(100) not null,
)
go
create table tb_Brand (
	id int identity(1,1) not null primary key,
	brandname nvarchar(50) not null,
	logo text
)
go
create table tb_Product (
	id int identity(1,1) not null primary key,
	title nvarchar(350) not null,
	price float not null,
	price_new float not null,
	img text,
	descript text,
	size int,
	stt bit,
	category_id int foreign key references tb_Category(id),
	brand_id int foreign key references tb_Brand(id)
)
go
create table tb_Order (
	id int identity(1,1) not null primary key,
	fullname nvarchar(50) not null,
	sdt varchar(15) not null,
	addr nvarchar(200) not null,
	note nvarchar(500),
	orderdate date not null,
	stt nvarchar(50) not null,
	userid int foreign key references tb_user(id)
)
go
create table tb_OrderDetail (
	id int identity(1,1) not null primary key,
	order_id int foreign key references tb_Order(id),
	product_id int foreign key references tb_Product(id),
	num int not null
)
go
