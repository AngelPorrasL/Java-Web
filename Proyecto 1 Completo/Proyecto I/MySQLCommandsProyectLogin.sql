create database users

use users

create table usuarios
(
    Name varchar(20),
    PhoneNumber int,
    Email varchar(50),
    Password varchar(20)
)

insert into usuarios (Name, PhoneNumber, Email, Password)
values ('Pedro', 85645732, 'pedro@gmail.com', 'pedro1234')

select * from usuarios

select * from usuarios where PhoneNumber = '85645732'

select * from usuarios where Email = 'pedro@gmail.com' and Password = 'pedro1234'