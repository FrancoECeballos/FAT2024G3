drop database PRONTAENTREGA;

-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS PRONTAENTREGA;

USE PRONTAENTREGA;

-- Crear tabla Organizacion
CREATE TABLE IF NOT EXISTS Organizacion (
    id_Organizacion INT PRIMARY KEY,
    descripcion VARCHAR(255)
);


-- Crear tabla TipoUsuario
CREATE TABLE IF NOT EXISTS TipoUsuario (
    id_tipoUsuario INT PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion VARCHAR(255)
);


-- Crear tabla Usuario
CREATE TABLE IF NOT EXISTS Usuario (
    id_usuario INT PRIMARY KEY,
    nombre VARCHAR(255),
    apellido VARCHAR(255),
    dni VARCHAR(20),
    telefono VARCHAR(20),
    email VARCHAR(255),
    id_tipoUsuario INT,
	CONSTRAINT fk_tipo_usuario FOREIGN KEY (id_tipoUsuario) REFERENCES TipoUsuario(id_tipoUsuario)

);

-- Crear tabla Casa
CREATE TABLE IF NOT EXISTS Casa (
    id_casa INT PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion VARCHAR(255),
    id_Organizacion INT,
    CONSTRAINT fk_organizacion_casa FOREIGN KEY (id_Organizacion) REFERENCES Organizacion(id_Organizacion)
);

-- Crear tabla DetalleCasaUsuario
CREATE TABLE IF NOT EXISTS DetalleCasaUsuario (
    id_detalleCasaUsuario INT PRIMARY KEY,
    descripcion VARCHAR(255),
    id_casa INT,
    id_usuario INT,
    CONSTRAINT fk_casa_detalle FOREIGN KEY (id_casa) REFERENCES Casa(id_casa),
    CONSTRAINT fk_usuario_detalle FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);


-- Crear tabla CategoriaProducto
CREATE TABLE IF NOT EXISTS CategoriaProducto (
    id_categoriaProducto INT PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion VARCHAR(255)
);

-- Crear tabla Producto
CREATE TABLE IF NOT EXISTS Producto (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion VARCHAR(255),
    id_categoriaProducto INT,
    CONSTRAINT fk_categoria_producto FOREIGN KEY (id_categoriaProducto) REFERENCES CategoriaProducto(id_categoriaProducto)
);


-- Crear tabla StockProducto
CREATE TABLE IF NOT EXISTS StockProducto (
    id_stockProducto INT PRIMARY KEY,
    id_casa INT,
    id_producto INT,
    cantidad INT,
    CONSTRAINT fk_producto_stock FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
	CONSTRAINT fk_casa_stockProducto FOREIGN KEY (id_casa) REFERENCES Casa(id_casa)

);


-- Crear tabla Pedido
CREATE TABLE IF NOT EXISTS Pedido (
    id_pedido INT PRIMARY KEY,
    fecha DATE,
    id_casa INT,
    id_detallePedidoProducto INT,
    id_usuario INT,
	CONSTRAINT fk_usuario_pedido FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    CONSTRAINT fk_casa_pedido FOREIGN KEY (id_casa) REFERENCES Casa(id_casa)
);

-- Crear tabla DetallePedidoProducto
CREATE TABLE IF NOT EXISTS DetallePedidoProducto (
    id_detallePedidoProducto INT PRIMARY KEY,
    descripcion VARCHAR(255),
    id_pedido INT,
    id_producto INT,
    CONSTRAINT fk_pedido_detalle FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    CONSTRAINT fk_producto_detalle FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);



-- Crear tabla Oferta
CREATE TABLE IF NOT EXISTS Oferta (
    id_oferta INT PRIMARY KEY,
    fecha DATE,
    id_usuario INT,
    id_detalleOfertaProducto INT,
    id_casa INT,
    CONSTRAINT fk_casa_oferta FOREIGN KEY (id_casa) REFERENCES Casa(id_casa),
    CONSTRAINT fk_usuario_oferta FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

-- Crear tabla DetalleOfertaProducto
CREATE TABLE IF NOT EXISTS DetalleOfertaProducto (
    id_detalleOfertaProducto INT PRIMARY KEY,
    descripcion VARCHAR(255),
    id_oferta INT,
    id_producto INT,
    CONSTRAINT fk_oferta_detalle FOREIGN KEY (id_oferta) REFERENCES Oferta(id_oferta),
    CONSTRAINT fk_producto_detalle_oferta FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

-- Crear tabla Transporte
CREATE TABLE IF NOT EXISTS Transporte (
    id_transporte INT PRIMARY KEY,
    marca VARCHAR(255),
    modelo VARCHAR(255),
    patente VARCHAR(20),
    kilometraje INT,
    estadoITV VARCHAR(255),
    anio DATETIME,
    id_Organizacion INT,
    CONSTRAINT fk_organizacion_transporte FOREIGN KEY (id_Organizacion) REFERENCES Organizacion(id_Organizacion)
);