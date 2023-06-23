#creacion de las tablas

create table pub(
cod_pub varchar(100),
nombre varchar(100) not null,
licencia varchar(100) not null,
domicilo varchar(100),
f_apertura date not null,
horario varchar(100) not null,
cod_prov int not null
);

alter table pub add constraint optHorario check (horario ='HOR1' or horario ='HOR2' or horario ='HOR3');

create table titular(
dni_titular varchar(100),
nombre varchar(100) not null,
domicilo varchar(100),
cod_pub varchar(100) not null
);

create table empleado(
dni_emp varchar(100),
nombre varchar(100) not null,
domicilo varchar(100)
);

create table stock(
cod_prod varchar(100),
nombre varchar(100) not null,
cantidad int not null,
precio int not null,
cod_pub varchar(100) not null
);

create table localidad(
cod_prov int,
nombre varchar(100) not null
);

create table pub_empleado(
cod_pub varchar(100),
dni_empleado varchar(100),
cargo varchar(100)
);

#Las claves primarias vienen marcadas con (*)
alter table pub add constraint pkCod_pub primary key(cod_pub);
alter table titular add constraint pkTitular primary key (dni_titular);
alter table empleado add constraint pkEmpleado primary key (dni_emp);
alter table stock add constraint pkStock primary key (cod_prod);
alter table localidad add constraint pkLocalidad primary key (cod_prov);
alter table pub_empleado add constraint pkPubEmpleado primary key (cod_pub,dni_empleado,cargo);

#Se ha de mantener la integridad referencial entre las tablas.
alter table pub add constraint fkCod_priv foreign key (cod_prov) references localidad(cod_prov);
alter table titular add constraint fkCod_pub foreign key (cod_pub) references pub(cod_pub);
alter table stock add constraint fkCod_pub_stock foreign key (cod_pub) references pub(cod_pub);
alter table pub_empleado add constraint fkCod_pub_empleado foreign key (cod_pub) references pub(cod_pub);

#No es posible dar de alta STOCK a precio 0.
alter table stock add constraint precioVal check (precio > 0);

#El campo CARGO de la tabla PUB_EMPLEADO sólo puede tener los valores CAMARERO, SEGURIDAD, LIMPIEZA.
alter table pub_empleado add constraint cargoval check (cargo = 'CAMARERO'or cargo = 'SEGURIDAD'or cargo = 'LIMPIEZA');

#Crea entradas en cada una de las tablas. (se adjunta fichero datos)




 # Datos de la LOCALIDAD
  insert into localidad values (15002, 'La Coruña');
  insert into localidad values (15165, 'Bergondo');
  insert into localidad values (15160, 'Sada');
  insert into localidad values (15170, 'Betanzos');
  insert into localidad values (15001, 'Ayuntamiento Coruña');
  insert into localidad values (15004, 'Centro Coruña');  
  
  # Datos del PUB
insert into pub values('01','Borges','Homologada1', 'Polvorin','2020-05-15', 'HOR1', '15002');
insert into pub values('02','Agua Mineral','Comprada', 'Orzan','1985-05-15', 'HOR1', '15001'); 
insert into pub values('03','Grietas','Robada', 'Matogrande','2002-02-10', 'HOR2', '15004'); 
insert into pub values('04','OH Coruña','Homologada', 'Orillamar','2020-05-15','HOR1', '15002');  
insert into pub values('05','Borges','Homologada1', 'Polvorin','2020-05-15', 'HOR1', '15002');
insert into pub values('06','Nueces','No  Homologada', 'Vereda','2010-05-15', 'HOR4', '15002');
  
 # Datos del TITULAR
insert into titular values ('12345678X', 'Manolo','Orillamar','01');
insert into titular values ('23456789c', 'Pepe','Riobao', '02');
insert into titular values ('56498712x', 'Tomas','Cacharrete', '02');
insert into titular values ('5644564c','Antonio','Mandin','01');
 
 # Datos EMPLEADO
insert into empleado values ('12356434X', 'Manuel','Orillamar');
insert into empleado values ('45345678X', 'Lucas','Orzan');
insert into empleado values ('12348876X', 'Luis','Monte Alto');

# DATOS EMPLEADOS DEL PUB
insert into pub_empleado values('01','12348876X','CAMARERO');
insert into pub_empleado values('03','12356434X','SEGURIDAD');
insert into pub_empleado values('04','45345678X','CAMARERO');
insert into pub_empleado values('05','46345678X','tocada de huevos');
