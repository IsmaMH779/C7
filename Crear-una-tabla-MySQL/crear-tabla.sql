create table usuarios(
ID int,
Nombre varchar(10),
Descripcion text,
Precio float,
stock int,
Fecha date,
Activo bool,
Categoria varchar(10),
Imagen blob,
Peso float,
Estado enum("Disponible", "Agotado", "En espera")
);

insert into usuarios(ID, Nombre, Descripcion, Precio, stock, Fecha, Activo, Categoria, Imagen, Peso, Estado)
values(1234567890, "Manzana","Manzanas de murcia",0.30,200,20230620,1,"frutas","https://biotrendies.com/wp-content/uploads/2015/06/manzana.jpg",0.020,"Disponible");

select * from usuarios;

alter table usuarios modify column Imagen longblob;
update usuarios set Peso = 0.25 where ID=1234567890;

use ejerciciosmysql;
