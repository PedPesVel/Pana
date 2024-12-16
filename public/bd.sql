CREATE DATABASE IF NOT EXISTS panaderia;
USE panaderia;
CREATE TABLE IF NOT EXISTS clientes (
id_cliente INT AUTO_INCREMENT PRIMARY KEY, 
username VARCHAR(255) NOT NULL, 
password VARCHAR(255) NOT NULL,
dinero decimal (10,2) not null
);

INSERT INTO clientes (username, password,dinero) VALUES
('cliente2', '123456a','50'),
('cliente3', '123456','50');

CREATE TABLE IF NOT EXISTS desarrolladores (
id_desarrollador INT AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(255) NOT NULL,
password VARCHAR(255) NOT NULL
);
INSERT INTO desarrolladores (username, password) VALUES
('ad1', '123'),
('ad2' , '456');

CREATE TABLE IF NOT EXISTS productos(
id_producto INT auto_increment primary key not null,
nombre VARCHAR(255) NOT NULL,
precio DECIMAL(10, 2) NOT NULL, 
cantidad_stock INT NOT NULL ,
imagen varchar (255));
INSERT INTO productos (nombre, precio, cantidad_stock,imagen) VALUES
('Pan de Caja', 15.50, 100,'/imagenes/pan_de_caja.jpg'),
('Baguette', '12.00', 58,'/imagenes/baguette.jpg'),
('Rosca de reyes', 300.00, 200,'/imagenes/ros.jpg');

CREATE TABLE IF NOT EXISTS carrito_compras (
    id_cliente INT NOT NULL,
    id_producto INT NOT NULL,
    producto varchar (100),
    cantidad INT NOT NULL,
    precio_unitario decimal (10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto));

CREATE TABLE IF NOT EXISTS pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    detalles JSON NOT NULL,
    fecha_compra TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente));