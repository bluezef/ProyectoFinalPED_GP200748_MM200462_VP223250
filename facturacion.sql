CREATE DATABASE Facturacion;
use Facturacion;

CREATE TABLE categoria(
	idcategoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) UNIQUE
);

CREATE TABLE cargos(
	idcargo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) UNIQUE
);

CREATE TABLE producto (
    idproducto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    cantidad_inventario INT NOT NULL,
    categoria varchar(45),
    descripcion TEXT,
    FOREIGN KEY (categoria) REFERENCES categoria(nombre) 
);

CREATE TABLE usuario (
    idusuario INT AUTO_INCREMENT PRIMARY KEY,
    nombres varchar(255),
    apellidos varchar(255),
    telefono varchar(9),
    direccion varchar(255),
    cargo varchar(45),
    usuario VARCHAR(50) NOT NULL UNIQUE,
    pass VARCHAR(255) NOT NULL,
    FOREIGN KEY (cargo) REFERENCES cargos(nombre)
);

CREATE TABLE Venta (
    VentaID INT AUTO_INCREMENT PRIMARY KEY,
    FechaVenta DATETIME NOT NULL,
    NombreCliente VARCHAR(255),
    usuarioempleado VARCHAR(50) NOT NULL,
    Total DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (usuarioempleado) REFERENCES usuario(usuario)
);

CREATE TABLE DetalleVenta (
    DetalleVentaID INT AUTO_INCREMENT PRIMARY KEY,
    VentaID INT NOT NULL,
    idproducto INT NOT NULL,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10, 2) NOT NULL,
    Subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (VentaID) REFERENCES Venta(VentaID),
    FOREIGN KEY (idproducto) REFERENCES Producto(idproducto)
);

insert into usuario(nombres,apellidos,usuario,pass) VALUES('TEST','TEST','test','test');
insert into usuario(nombres,apellidos,usuario,pass) VALUES('Admin','istrador','admin','password');
insert into categoria(nombre) VALUES ('Productos frescos'),( 'Abarrotes'),( 'Lacteos'),( 'Higiene'),( 'Cuidado del Hogar'),( 'Bebidas'),( 'Electrodomesticos');