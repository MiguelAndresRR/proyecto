create database if not exists proyecto;

use proyecto;

create table if not exists t_usuarios(
    id_usuario INT(11) AUTO_INCREMENT NOT NULL,
    nombre varchar(100)               NOT NULL,
    apellidos varchar(100)            NOT NULL,
    email varchar(200)                NOT NULL,
    password varchar(200)             NOT NULL,
    rol varchar(20)                   NOT NULL,
    imagen varchar(255),
    CONSTRAINT pk_usuario PRIMARY KEY (id_usuario),
    CONSTRAINT uq_email UNIQUE(email) 
);
insert into t_usuarios values(NULL,'Admin','Admin','admin@admin.com', 'contraseña','admin','imagen');

CREATE TABLE IF NOT exists t_categorias(
    id_categoria int (11) AUTO_INCREMENT not null,
    nombre_categoria varchar(100) not null,
    CONSTRAINT pk_categoria PRIMARY KEY (id_categoria)
);
insert into t_categorias values(NULL,'Domesticos');
create table if not exists t_productos(
    id_producto int (11) AUTO_INCREMENT not null,
    nombre_producto varchar(100) not null,
    descripcion varchar(255),
    precio float (100,2),
    stock int (11),
    oferta varchar (100),
    fecha date,
    imagen varchar (255),
    id_categoria int (11),
    CONSTRAINT pk_producto PRIMARY KEY (id_producto),
    CONSTRAINT fk_categoria FOREIGN KEY(id_categoria) REFERENCES t_categorias(id_categoria)
);
insert into t_producto values(NULL,'Collar','Collar en lana',100.10,'en venta',curdate(),null,1);

create table if not exists t_pedidos(
    id_pedido int (11) AUTO_INCREMENT not null,
    id_usuario int (11) not null,
    ciudad varchar (100) not null,
    direccion varchar (200) not null,
    costo float (100,2) not null,
    estado varchar (20) not null,
    fecha date not null,
    hora time,
    CONSTRAINT pk_pedidos PRIMARY KEY (id_pedido),
    CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES t_usuarios (id_usuario)
);
create table if not exists t_lineapedido(
    id_lineapedido int (11) AUTO_INCREMENT not null,
    id_pedido int (11) not null,
    id_producto int (11) not null,
    unidades int (100) not null,
    CONSTRAINT pk_lineapedido PRIMARY KEY (id_lineapedido),
    CONSTRAINT fk_pedido FOREIGN KEY (id_pedido) REFERENCES t_pedidos (id_pedido),
    CONSTRAINT FOREIGN KEY (id_producto) REFERENCES t_productos (id_producto)
);
