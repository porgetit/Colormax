-- Utilizar la base de datos
USE colormax;

-- Crear la tabla de categorías si no existe
CREATE TABLE IF NOT EXISTS categorias (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL
);

-- Crear la tabla de subcategorías si no existe
CREATE TABLE IF NOT EXISTS subcategorias (
  id INT PRIMARY KEY AUTO_INCREMENT,
  categoria_id INT,
  nombre VARCHAR(100) NOT NULL,
  FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- Crear la tabla de proveedores si no existe
CREATE TABLE IF NOT EXISTS proveedores (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  direccion VARCHAR(100),
  ciudad VARCHAR(50),
  pais VARCHAR(50) DEFAULT 'Colombia',
  telefono VARCHAR(20),
  correo_electronico VARCHAR(100),
  sitio_web VARCHAR(100),
  persona_contacto VARCHAR(100),
  cargo_contacto VARCHAR(50) DEFAULT 'Vendedor'
);

-- Crear la tabla de productos si no existe
CREATE TABLE IF NOT EXISTS productos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  subcategoria_id INT,
  precio DECIMAL(10, 2) NOT NULL,
  cantidad INT NOT NULL,
  proveedor_id INT,
  fecha_creacion DATE,
  fecha_modificacion DATE,
  FOREIGN KEY (subcategoria_id) REFERENCES subcategorias(id),
  FOREIGN KEY (proveedor_id) REFERENCES proveedores(id)
);
