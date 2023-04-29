create database Products

use Products

create table productos 
(
	Id int,
	Name varchar(50),
	Category varchar(50),
	Price int,    
	Fecha varchar(50)
)

insert into productos (Id, Name, Category, Price, Fecha) 
values (1, 'Tomatoes', 'Vegetables', 395, '10/20/2022')

insert into productos (Id, Name, Category, Price, Fecha) 
values (2, 'Watermelon', 'Fruits', 1000, '10/20/2022')

insert into productos (Id, Name, Category, Price, Fecha) 
values (3, 'Coca-Cola', 'Beverages', 1600, '10/20/2022')

select * from productos