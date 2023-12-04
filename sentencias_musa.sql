USE inmobiliaria; 

-- Creo usuario1 y le asigno permisos
CREATE USER 'usuario1'@'localhost' IDENTIFIED BY 'contrasena1';
GRANT SELECT, INSERT, UPDATE ON inmobiliaria.Propiedades TO 'usuario1'@'localhost';
GRANT SELECT ON inmobiliaria.Agentes TO 'usuario1'@'localhost';

-- Creo usuario2 y le asigno permisos
CREATE USER 'usuario2'@'localhost' IDENTIFIED BY 'contrasena2';
GRANT SELECT, INSERT ON inmobiliaria.Clientes TO 'usuario2'@'localhost';
