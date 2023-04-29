create database Products

use Products

create table productos 
(
	Id int,
	Name varchar(50),
	Category varchar(50),
	Price int,    
	Fecha Date
)

insert into productos (Id, Name, Category, Price, Date) 
values (1, 'Tomatoes', 'Vegetables', 395, '10/20/2022')

insert into productos (Id, Name, Category, Price, Date) 
values (2, 'Coca-Cola 3L', 'non alcoholic beverage', 1800, '09/22/2022')

insert into productos (Id, Name, Category, Price, Date) 
values (3, 'Nesquik', 'Cereals', 2200, '05/21/2022')

select * from productos

delete from productos where Id = 1 and Name = 'Tomatoes'

update productos set Name = 'Nesquik' where Id = 333 and Name = 'Froot Loops'

select * from productos where Id = 222