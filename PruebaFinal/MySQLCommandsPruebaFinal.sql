create database estudiantes

use estudiantes

create table students
(
    Id int,
    Nombre varchar(30),
    Nota int,
    Estado varchar(30)
)

insert into students (Id, Nombre, Nota, Estado) 
values (123456779, 'Carlos Perez', 0, 'Aprobado')

insert into students (Id, Nombre, Nota, Estado) 
values (123456788, 'Juan Martinez', 0, 'Aprobado')

insert into students (Id, Nombre, Nota, Estado) 
values (123856789, 'Eulogio Cuesta', 0, 'Aprobado')

insert into students (Id, Nombre, Nota, Estado) 
values (123456756, 'Gorka Haro', 0, 'Aprobado')

insert into students (Id, Nombre, Nota, Estado) 
values (133455789, 'Gines Jaime', 0, 'Aprobado')

insert into students (Id, Nombre, Nota, Estado) 
values (153459789, 'Eladio Camps', 0, 'Aprobado')

insert into students (Id, Nombre, Nota, Estado) 
values (123456789, 'Thiago Abril', 0, 'Aprobado')

insert into students (Id, Nombre, Nota, Estado) 
values (123851789, 'Jairo Tome', 0, 'Aprobado')

insert into students (Id, Nombre, Nota, Estado) 
values (123253789, 'Ander Barcelo', 0, 'Aprobado')

insert into students (Id, Nombre, Nota, Estado) 
values (123459189, 'Baldomero Rivas', 0, 'Aprobado')


select * from students

select * from students where Id = '123456779'

update students set Nota = '0' where Id = '123456779'

update students set Estado = 'Aprobado' where Id = '123456779'

