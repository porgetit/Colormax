-- Utilizar la base de datos
USE colormax;

-- Insertar datos en la tabla de categorías si está vacía
INSERT INTO categorias (nombre)
SELECT * FROM (SELECT 'Herramientas') AS tmp
WHERE NOT EXISTS (
    SELECT * FROM categorias WHERE nombre = 'Herramientas'
);

-- Insertar datos en la tabla de subcategorías si está vacía
INSERT INTO subcategorias (categoria_id, nombre)
SELECT * FROM
(
  SELECT 1, 'Herramientas de mano' UNION ALL
  SELECT 1, 'Herramientas eléctricas' UNION ALL
  SELECT 1, 'Herramientas de medición' UNION ALL
  SELECT 1, 'Herramientas de corte' UNION ALL
  SELECT 1, 'Herramientas de jardín' UNION ALL
  SELECT 2, 'Albañilería' UNION ALL
  SELECT 2, 'Carpintería' UNION ALL
  SELECT 2, 'Pintura' UNION ALL
  SELECT 2, 'Fontanería' UNION ALL
  SELECT 3, 'Tornillería y fijaciones' UNION ALL
  SELECT 3, 'Bisagras cerraduras y herrajes' UNION ALL
  SELECT 3, 'Cadenas, cuerdas y cables' UNION ALL
  SELECT 3, 'Ganchos, abrazaderas y colgadores' UNION ALL
  SELECT 4, 'Equipos de protección personal' UNION ALL
  SELECT 4, 'Sistemas de seguridad para el hogar' UNION ALL
  SELECT 4, 'Extintores y sistemas contra incendios' UNION ALL
  SELECT 5, 'Cables, alambres y conductores' UNION ALL
  SELECT 5, 'Enchufes, interruptores y tomas de corriente' UNION ALL
  SELECT 5, 'Iluminación y lámparas' UNION ALL
  SELECT 5, 'Herramientas y accesorios eléctricos y electrónicos'
) AS tmp
WHERE NOT EXISTS (
    SELECT * FROM subcategorias WHERE nombre = tmp.nombre
);

-- Insertar datos en la tabla de proveedores si está vacía
INSERT INTO proveedores (nombre, direccion, ciudad, telefono, correo_electronico, sitio_web, persona_contacto)
SELECT * FROM
(
  SELECT 'Proveedor A', 'Calle 123', 'Bogota', '+57 123456789', 'proveedora@example.com', 'www.proveedora.com', 'Juan Perez' UNION ALL
  SELECT 'Proveedor B', 'Carrera 456', 'Medellin', '+57 987654321', 'proveedorb@example.com', 'www.proveedorb.com', 'Pedro Gomez'
) AS tmp
WHERE NOT EXISTS (
    SELECT * FROM proveedores WHERE nombre = tmp.nombre
);
