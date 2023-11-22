USE inmobiliaria; 

-- Crear tabla de LOG para Propiedades--
CREATE TABLE Log_Propiedades (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    Operacion VARCHAR(50),
    PropiedadID INT,
    Usuario VARCHAR(100),
    FechaOperacion DATE,
    HoraOperacion TIME
);

-- Crear tabla de LOG para Clientes--
CREATE TABLE Log_Clientes (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    Operacion VARCHAR(50),
    ClienteID INT,
    Usuario VARCHAR(100),
    FechaOperacion DATE,
    HoraOperacion TIME
);


-- Trigger BEFORE para la tabla Propiedades--
DELIMITER //
CREATE TRIGGER Before_Propiedades
BEFORE INSERT ON Propiedades
FOR EACH ROW
BEGIN
    INSERT INTO Log_Propiedades (Operacion, PropiedadID, Usuario, FechaOperacion, HoraOperacion)
    VALUES ('INSERT', NEW.PropiedadID, CURRENT_USER(), CURDATE(), CURTIME());
END;
//
DELIMITER ;

-- Trigger AFTER para la tabla Propiedades--
DELIMITER //
CREATE TRIGGER After_Propiedades
AFTER DELETE ON Propiedades
FOR EACH ROW
BEGIN
    INSERT INTO Log_Propiedades (Operacion, PropiedadID, Usuario, FechaOperacion, HoraOperacion)
    VALUES ('DELETE', OLD.PropiedadID, CURRENT_USER(), CURDATE(), CURTIME());
END;
//
DELIMITER ;


-- Trigger BEFORE para la tabla Clientes--
DELIMITER //
CREATE TRIGGER Before_Clientes
BEFORE UPDATE ON Clientes
FOR EACH ROW
BEGIN
    INSERT INTO Log_Clientes (Operacion, ClienteID, Usuario, FechaOperacion, HoraOperacion)
    VALUES ('UPDATE', NEW.ClienteID, CURRENT_USER(), CURDATE(), CURTIME());
END;
//
DELIMITER ;

-- Trigger AFTER para la tabla Clientes--
DELIMITER //
CREATE TRIGGER After_Clientes
AFTER INSERT ON Clientes
FOR EACH ROW
BEGIN
    INSERT INTO Log_Clientes (Operacion, ClienteID, Usuario, FechaOperacion, HoraOperacion)
    VALUES ('INSERT', NEW.ClienteID, CURRENT_USER(), CURDATE(), CURTIME());
END;
//
DELIMITER ;