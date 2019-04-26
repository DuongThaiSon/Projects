create database QLBanTraSua
use QLBanTraSua
drop database QLTraSua
create table Users (
	id int identity(1,1) primary key not null,
	name nvarchar(30) not null,
	birthday varchar(30) not null,
	email varchar(30) not null,
	phone varchar(30) not null,
	address nvarchar(50) not null
)

create table Orders (
	id int identity(1,1) primary key not null,
	total_price float(24) not null,
	total_amount float(11) not null,
	order_time varchar(30) not null,
	note nvarchar(255),
	user_id int not null,
	constraint fk_user foreign key (user_id) references Users(id)
)

create table Category(
	id int identity(1,1) primary key not null,
	name nvarchar(50) not null,
	total_product int not null,
)

create table Product(
	id int identity(1,1) primary key not null,
	name nvarchar(50) not null,
	price int not null,
	status varchar(20) not null,
	category_id int not null,
	quantity int not null,
	constraint fk_category foreign key (category_id) references Category(id)
)

create table OrdersDetail(
	id int identity(1,1) primary key not null,
	product_id int not null,
	order_id int not null,
	quantity int not null,
	price int not null,
	constraint fk_Product foreign key (product_id) references Product(id),
	constraint fk_Orders foreign key (order_id) references Orders(id)
)

