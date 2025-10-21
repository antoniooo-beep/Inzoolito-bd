drop database if exists Proyecto;
create database Proyecto;
use Proyecto;
create table Usuario (
id_Usuario int primary key auto_increment,
nombre varchar (15),
apellido varchar (15),
correo varchar (30),
contraseña varchar (14)
);

create table Chef_Ejecutivo (
id_Chef_Ejecutivo int primary key auto_increment,
foreign key (id_Chef_Ejecutivo) references Usuario(id_Usuario)
);

create table Gerente_General (
id_Gerente_General int primary key auto_increment,
foreign key (id_Gerente_General) references Usuario(id_Usuario)
);

create table Mozos (
id_Mozos int primary key auto_increment,
foreign key (id_Mozos) references Usuario(id_Usuario)
);

create table Clientes (
id_Clientes int primary key auto_increment,
foreign key (id_Clientes) references Usuario(id_Usuario)
);

create table Platos (
id_Plato int primary key auto_increment,
nombre_Plato varchar (100) unique,
descripcion varchar (200),
tiempo_Preparacion time,
precio decimal (10,2),
categoria varchar (20),
imagen varchar (260) default null
);

create table Plato_Alergeno (
id_Plato int primary key,
alergeno varchar (50),
foreign key (id_Plato) references Platos(id_Plato)
);

create table Pedido (
id_Pedido int primary key auto_increment,
total decimal (10,2),
tipo varchar (20),
hora_Pedido time,
metodo_Consumo varchar (50),
estado varchar (50),
id_Clientes int,
foreign key (id_Clientes) references Clientes(id_Clientes)
);

create table Cliente_Plato_Favorito (
id_Clientes int primary key,
id_Plato int,
foreign key (id_Clientes) references Clientes(id_Clientes),
foreign key (id_Plato) references Platos(id_Plato)
);

create table Cliente_Historial_Pedido (
id_Clientes int primary key,
id_Pedido int,
foreign key (id_Clientes) references Clientes(id_Clientes),
foreign key (id_Pedido) references Pedido(id_Pedido)
);

create table Restricciones_Alimentarias (
id_Clientes int primary key, 
restriccion varchar (50),
foreign key (id_Clientes) references Clientes(id_Clientes)
);

create table Cocineros (
id_Cocineros int primary key auto_increment,
foreign key (id_Cocineros) references Usuario(id_Usuario)
);

create table Gerente_Turno (
id_Gerente_Turno int primary key auto_increment, 
foreign key (id_Gerente_Turno) references Usuario(id_Usuario)
);

create table Inventario (
id_Inventario int primary key auto_increment, 
nombre_Producto varchar (30),
cantidad int,
fecha_Ingreso date, 
vencimiento date,
id_Chef_Ejecutivo int,
foreign key (id_Chef_Ejecutivo) references Chef_Ejecutivo(id_Chef_Ejecutivo)
);

create table Inventario_Platos (
id_Inventario int,
id_Plato int,
primary key (id_Inventario, id_Plato),
foreign key (id_Inventario) references Inventario(id_Inventario),
foreign key (id_Plato) references Platos(id_Plato)
);

create table Plato_Pedido_Clientes (
id_Plato int,
id_Pedido int,
id_Clientes int,
primary key (id_Plato, id_Pedido, id_Clientes),
foreign key (id_Plato) references Platos(id_Plato),
foreign key (id_Pedido) references Pedido(id_Pedido),
foreign key (id_Clientes) references Clientes(id_Clientes)
);

create table Comandas (
id_Comanda int primary key auto_increment, 
observaciones varchar (50),
orden_Llegada int
);

create table Restriccion_Alimentaria (
id_Comanda int primary key, 
restriccion varchar (50),
foreign key (id_Comanda) references Comandas(id_Comanda)
);

create table Pedido_Cliente_Comanda (
id_Pedido int,
id_Plato int,
id_Clientes int,
id_Comanda int,
primary key (id_Pedido, id_Plato, id_Clientes, id_Comanda),
foreign key (id_Pedido) references Pedido(id_Pedido),
foreign key (id_Plato) references Platos(id_Plato),
foreign key (id_Clientes) references Clientes(id_Clientes),
foreign key (id_Comanda) references Comandas(id_Comanda) 
);

create table Mozos_Comanda (
id_Mozos int,
id_Comanda int,
primary key (id_Mozos, id_Comanda),
foreign key (id_Mozos) references Mozos(id_Mozos),
foreign key (id_Comanda) references Comandas(id_Comanda) 
);

create table Cuentas (
id_Cuenta int primary key auto_increment, 
forma_Pago varchar (50),
precio decimal (10,2),
descuento_Aplicado boolean default false,
propina boolean default false
);
create table Cuentas_Items (
id_Cuenta int primary key, 
items varchar (50),
foreign key (id_Cuenta) references Cuentas(id_Cuenta)
);

create table Mozos_Cuentas (
id_Mozos int,
id_Cuenta int,
primary key (id_Mozos, id_Cuenta),
foreign key (id_Mozos) references Mozos(id_Mozos),
foreign key (id_Cuenta) references Cuentas(id_Cuenta)
);

create table Mesa (
id_Mesa int primary key auto_increment,
ubicacion varchar (20),
estado_Mesa varchar (15),
capacidad int
);

create table Reserva (
id_Reserva int primary key auto_increment,
fecha date,
hora time, 
cantidad_Personas int,
estado_Reserva varchar (50),
id_Clientes int,
id_Mesa int,
id_Mozos int,
foreign key (id_Clientes) references Clientes(id_Clientes),
foreign key (id_Mesa) references Mesa(id_Mesa),
foreign key (id_Mozos) references Mozos(id_Mozos)
);

create table Reportes (
id_Reporte int primary key auto_increment,
descripion_Reporte varchar (50),
fecha_Reporte date,
tipo_Reporte varchar (50),
id_Gerente_General int,
foreign key (id_Gerente_General) references Gerente_General(id_Gerente_General)
);

create table Comentario (
id_Comentario int primary key auto_increment, 
fecha_Comentario date, 
texto varchar (30),
puntuacion int
);

create table Clientes_Comentario (
id_Clientes int,
id_Comentario int,
primary key (id_Clientes, id_Comentario),
foreign key (id_Clientes) references Clientes(id_Clientes),
foreign key (id_Comentario) references Comentario(id_Comentario)
);

create user 'profe'@'mysql' identified by 'pword123';
create user 'tomas'@'mysql' identified by 'pword456';
create user 'maria'@'mysql' identified by 'pword789';
create user 'gabriel'@'mysql' identified by 'pword012';
create user 'alejandro'@'mysql' identified by 'pword345';

create role 'Cliente';
create role 'Mozo';
create role 'Cocinero';
create role 'GerenteGeneral';
create role 'GerenteTurno';
create role 'ChefEjecutivo';

grant all privileges on Proyecto.* to 'GerenteGeneral';

grant select, update on Proyecto.Usuario to 'Cliente';
grant select on Proyecto.Clientes to 'Cliente';
grant select, insert, update on Proyecto.Pedido to 'Cliente';
grant select on Proyecto.Platos to 'Cliente';
grant select on Proyecto.Plato_Alergeno to 'Cliente';
grant select, insert on Proyecto.Cliente_Plato_Favorito to 'Cliente';
grant select on Proyecto.Cliente_Historial_Pedido to 'Cliente';
grant select, insert, update on Proyecto.Restricciones_Alimentarias to 'Cliente';
grant select, insert on Proyecto.Comandas to 'Cliente';
grant select, insert on Proyecto.Restriccion_Alimentaria to 'Cliente';
grant select on Proyecto.Cuentas to 'Cliente';
grant select, insert, update on Proyecto.Mesa to 'Cliente';
grant select, insert, update on Proyecto.Comentario to 'Cliente';
grant select, update on Proyecto.Inventario to 'Cliente';

grant select, update on Proyecto.Usuario to 'Mozo';
grant select on Proyecto.Mozos to 'Mozo';
grant select, insert, update, delete on Proyecto.Pedido to 'Mozo';
grant select, insert, update, delete on Proyecto.Comandas to 'Mozo';
grant select, insert, update, delete on Proyecto.Restriccion_Alimentaria to 'Mozo';
grant select on Proyecto.Restricciones_Alimentarias to 'Mozo';
grant select, insert, update, delete on Proyecto.Cuentas to 'Mozo';
grant select, insert, update, delete on Proyecto.Cuentas_Items to 'Mozo';
grant select, insert, update, delete on Proyecto.Reserva to 'Mozo';
grant select, insert, update on Proyecto.Mesa to 'Mozo';
grant select on Proyecto.Clientes to 'Mozo';

grant select, update on Proyecto.Usuario to 'Cocinero';
grant select on Proyecto.Cocineros to 'Cocinero';
grant select on Proyecto.Comandas to 'Cocinero';
grant select on Proyecto.Restriccion_Alimentaria to 'Cocinero';

grant select, update on Proyecto.Usuario to 'GerenteTurno';
grant select on Proyecto.Gerente_Turno to 'GerenteTurno';
grant select on Proyecto.Inventario to 'GerenteTurno';
grant select on Proyecto.Mozos_Comanda to 'GerenteTurno';
grant select on Proyecto.Cuentas to 'GerenteTurno';
grant select on Proyecto.Mozos_Cuentas to 'GerenteTurno';
grant select on Proyecto.Mesa to 'GerenteTurno';
grant select on Proyecto.Reserva to 'GerenteTurno';

grant select, update on Proyecto.Usuario to 'ChefEjecutivo';
grant select on Proyecto.Chef_Ejecutivo to 'ChefEjecutivo';
grant select, insert, update, delete on Proyecto.Platos to 'ChefEjecutivo';
grant select, insert, update, delete on Proyecto.Inventario to 'ChefEjecutivo';
grant select, insert, update, delete on Proyecto.Plato_Alergeno to 'ChefEjecutivo';
grant select on Proyecto.Comandas to 'ChefEjecutivo';

grant 'Cliente' to 'profe'@'mysql';
grant 'Mozo' to 'tomas'@'mysql';
grant 'Cocinero' to 'maria'@'mysql';
grant 'GerenteGeneral' to 'alejandro'@'mysql';
grant 'GerenteTurno' to 'gabriel'@'mysql';

INSERT INTO Platos (nombre_Plato, descripcion, tiempo_Preparacion, precio, categoria, imagen) values ('Mini Cheddar Burgers', 'Mini hamburguesa de carne 100% vacuna, fetas de queso cheddar, tomate y lechuga.', '00:15:00', 500.00, 'Nuestros Destacados', 'burgers.jpg');
INSERT INTO Platos (nombre_Plato, descripcion, tiempo_Preparacion, precio, categoria, imagen) values ('Mini Palta Burgers', 'Mini hamburguesa de carne 100% vacuna, salsa de Palta, tomate y lechuga.', '00:20:00', 550.00, 'Nuestros Destacados', 'burgers palta.jpg');
INSERT INTO Platos (nombre_Plato, descripcion, tiempo_Preparacion, precio, categoria, imagen) values ('Mini Cheddar Burgers + Balde de Cheddar', 'Mini hamburguesa de carne 100% vacuna, fetas de queso cheddar, tomate y lechuga. Acompañado de un super balde de Cheddar.', '00:20:30', 570.00, 'Nuestros Destacados', 'burger con chedar.jpg');
INSERT INTO Platos (nombre_Plato, descripcion, tiempo_Preparacion, precio, categoria, imagen) values ('Mega Imperdible de Lunes', 'Mega balde de papas fritas con Mini Cheddar Burgers.', '00:30:00', 620.00, 'Nuestros Destacados', 'megabalde.jpg');
INSERT INTO Platos (nombre_Plato, descripcion, tiempo_Preparacion, precio, categoria, imagen) values ('Brochetas de Mini Burgers', 'Mini hamburguesas de carne 100% vacuna, fetas de queso cheddar, tomate y lechuga.','00:25:00', 300.00, 'Nuestros Destacados', 'burger brochetas.jpg');
INSERT INTO Platos (nombre_Plato, descripcion, tiempo_Preparacion, precio, categoria, imagen) values ('Mini Burgers + Balde de Papas con Cheddar', 'Mini hamburguesas de carne 100% vacuna, fetas de queso cheddar y lechuga. Acompañado de un balde de papas con cheddar y bacon.', '00:35:00', 640.00, 'Nuestros Destacados', 'burgers con papas.jpg');
INSERT INTO Platos (nombre_Plato, descripcion, tiempo_Preparacion, precio, categoria, imagen) values ('Papas Solas', 'Doradas y sabrosas, el acompañamiento perfecto para cualquier plato o para disfrutar solas con tu salsa favorita.', '00:10:00', 250.00, 'Extras', 'papas.jpg');
INSERT INTO Platos (nombre_Plato, descripcion, tiempo_Preparacion, precio, categoria, imagen) values ('Nuggets', '10 McNuggets. Irresistibles trozos de pollo rebozados y fritos hasta lograr un sabor crujiente y delicioso en cada bocado.', '00:15:00', 350.00, 'Extras', 'nuggets.jpg');
INSERT INTO Platos (nombre_Plato, descripcion, tiempo_Preparacion, precio, categoria, imagen) values ('Papas con Cheddar y Bacon', 'Papas fritas cubiertas con queso cheddar fundido y trozos de bacon crocante, una combinación perfecta de sabor y textura.', '00:15:00', 230.00, 'Extras', 'papas con chedar.jpg');
INSERT INTO Platos (nombre_Plato, descripcion, tiempo_Preparacion, precio, categoria, imagen) values ('Coca Cola', 'Refrescante y con el sabor clásico de siempre, ideal para acompañar cualquier comida y disfrutar bien fría.', '00:05:00', 150.00, 'Extras', 'lata coca.webp');
INSERT INTO Platos (nombre_Plato, descripcion, tiempo_Preparacion, precio, categoria, imagen) values ('Fanta', 'Bebida burbujeante con un intenso sabor a naranja, perfecta para refrescarte.', '00:05:00', 150.00, 'Extras', 'fanta.webp');
INSERT INTO Platos (nombre_Plato, descripcion, tiempo_Preparacion, precio, categoria, imagen) values ('Agua Salus', 'Agua mineral natural, ideal para hidratarte y disfrutar de un sabor único y equilibrado.', '00:05:00', 100.00, 'Extras', 'agua.jpg');
INSERT INTO Platos (nombre_Plato, descripcion, tiempo_Preparacion, precio, categoria, imagen) values ('Mini Pollo Burgers', 'Mini hamburguesas de pollo, fetas de queso muzzarella, tomate y lechuga.', '00:25:00', 400.00, 'Colaboración', 'colab.jpg');
INSERT INTO Platos (nombre_Plato, descripcion, tiempo_Preparacion, precio, categoria, imagen) values ('Helado de Oreo', 'Cremoso helado con trozos de galleta Oreo, una mezcla irresistible del sabor y textura en cada cucharada.', '00:12:00', 210.00, 'Postres', 'oreo.jpg');
INSERT INTO Platos (nombre_Plato, descripcion, tiempo_Preparacion, precio, categoria, imagen) values ('Helado de Ricardito', 'Delicioso helado inspirado en el clásico Ricardito uruguayo, con suave crema y cobertura de chocolate que se derrite en tu boca.', '00:12:00', 210.00, 'Postres', 'ricardito.jpg');
INSERT INTO Platos (nombre_Plato, descripcion, tiempo_Preparacion, precio, categoria, imagen) values ('Helado de M&M`s', 'Cremoso helado con coloridos M&M`s, combinando dulzura, textura y diversión en cada bocado.', '00:15:00', 210.00, 'Postres', 'mym.jpg');
INSERT INTO Platos (nombre_Plato, descripcion, tiempo_Preparacion, precio, categoria, imagen) values ('Helado de KitKat', 'Suave helado con trozos de KitKat, una deliciosa mezcla de chocolate y galleta crujiente en cada cucharada.', '00:15:00', 210.00, 'Postes', 'kitkat.png');
INSERT INTO Platos (nombre_Plato, descripcion, tiempo_Preparacion, precio, categoria, imagen) values ('Helado de Snickers', 'Cremoso helado con trozos de Snickers, combinando chocolate, maní y caramelo para un sabor irresistible.', '00:15:00', 210.00, 'Postres', 'snicker.jpg');
INSERT INTO Platos (nombre_Plato, descripcion, tiempo_Preparacion, precio, categoria, imagen) values ('Próximamente', 'Descubre lo nuevo que llegará a nuestro menú, lleno de sabores innovadores y deliciosas sorpresas para disfrutar.','00:00:00', 0.00, 'Postres', ' ');
SELECT * FROM Platos;