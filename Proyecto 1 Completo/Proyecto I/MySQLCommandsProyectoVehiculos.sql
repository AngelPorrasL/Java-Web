create database vehiculos

use vehiculos

create table vehiculos
(
matricula int,
marca varchar(20),
modelo int,
annofabricacion int,
estilo varchar (20)
)

insert INTO vehiculos(matricula,marca,modelo,annofabricacion,estilo)
values(123,'toyota',2020,2020,'hilux');


select * from vehiculos

update vehiculos set marca = 'toyota', modelo = '2020', annofabricacion = '2020', estilo = 'hilux' where matricula = '123'

delete from vehiculos where matricula = '123'

select * from vehiculos where matricula = '123'

select * from vehiculos where marca like 'toyo' and estilo like 'prad'

select * from vehiculos where annofabricacion like 2020
