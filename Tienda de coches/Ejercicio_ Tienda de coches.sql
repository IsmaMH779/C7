use ejerciciosmysql;

#0 Crea las tablas y las relaciones.
create table FABRICANTES(
codigo int,
nombre nvarchar(100),
primary key(codigo)
);

create table articulo(
codigo int,
nombre nvarchar(100),
precio int,
fabricante int,
primary key(codigo),
foreign key(fabricante) references fabricantes(codigo)
);

insert into fabricantes values(1,'seat'); 
insert into fabricantes values(2,'audi'); 
insert into fabricantes values(3,'mercedes');

insert into articulo values(1,'leon',23000,1);
insert into articulo values(2,'ibiza',14000,1);
insert into articulo values(3,'arona',8000,1);
insert into articulo values(4,'a7',80000,2);
insert into articulo values(5,'a5',49000,2);
insert into articulo values(6,'q8',87000,2);
insert into articulo values(7,'a3',32000,2);
insert into articulo values(8,'CLA',42000,3);
insert into articulo values(9,'gt-4',154000,3);
insert into articulo values(10,'CLS-coupe',80000,3);


#1 Obtener los nombres de los productos de la tienda.
select nombre from articulo;

#2 Obtener los nombres y los precios de los productos de la tienda.
select nombre, precio from articulo;

#3 Obtener el nombre de los productos cuyo precio sea menor o igual a 20 €.
select nombre from articulo where precio <= 20;

#4 Obtener todos los datos de los artículos cuyo precio esté entre los 60 € y los 120 € (ambas cantidades incluidas).
select a.*,f.nombre 
from articulo as a 
join fabricantes as f 
on f.codigo = a.fabricante
where precio > 60000 && precio <120000;

#5. Obtener el nombre y el precio multiplicado por 166,386, la columna debe presentarse como precio_total.
select nombre, (precio * 166.386) as precio_total from articulo;

#6. Seleccionar el precio medio de todos los productos.
select avg(precio) from articulo;

#7. Obtener el precio medio de los artıculos cuyo código de fabricante sea 2.
select avg(precio) from articulo where fabricante = 2;

#8. Obtener el número de artículos cuyo precio sea mayor o igual a 180 €.
select count(codigo) from articulo where precio >= 180;

#9. Obtener el nombre y precio de los artículos cuyo precio sea mayor o igual a 180 € y ordenarlos descendentemente por precio, y luego ascendentemente por nombre.
select nombre, precio from articulo where precio >= 180 order by precio desc; 
select nombre, precio from articulo where precio >= 180 order by nombre asc;

#10. Obtener un listado completo de artículos, incluyendo por cada artículo los datos del artículo y de su fabricante. 
select a.*,f.nombre
from articulo as a
join fabricantes as f
on f.codigo = a.fabricante;

#11. Obtener un listado de artículos, incluyendo el nombre del artículo, su precio, y el nombre de su fabricante.
select a.nombre,a.precio,f.nombre
from articulo as a
join fabricantes as f
on f.codigo = a.fabricante;

#12. Obtener el precio medio de los productos de cada fabricante, mostrando solo los códigos de fabricante.
select fabricante, avg(precio) from articulo group by fabricante;

#13. Obtener el precio medio de los productos de cada fabricante, mostrando el nombre del fabricante.
select f.nombre, avg(a.precio)
from articulo as a
join fabricantes as f
on f.codigo =a.fabricante group by f.nombre;

#14. Obtener los nombres de los fabricantes que ofrezcan productos cuyo precio medio sea mayor o igual a 150 €. Indicar el precio medio.
select f.nombre
from articulo as a
join fabricantes as f
on f.codigo = a.fabricante where avg(a.precio) >= 15000 group by f.nombre ;