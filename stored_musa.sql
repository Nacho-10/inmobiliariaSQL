USE inmobiliaria;

DELIMITER //
CREATE PROCEDURE OrdenarTabla(IN campoOrden VARCHAR(50), IN orden VARCHAR(10))
BEGIN
    SET @query = CONCAT('SELECT * FROM Propiedades ORDER BY ', campoOrden, ' ', orden);
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //

DELIMITER ;
CALL OrdenarTabla('Precio', 'ASC');
DELIMITER ; 

DELIMITER //
CREATE PROCEDURE InsertarRegistro(
    IN p_TipoDePropiedad VARCHAR(50),
    IN p_Direccion VARCHAR(100),
    IN p_Precio DECIMAL(10, 2),
    IN p_AgenteID INT
)
BEGIN
    INSERT INTO Propiedades (TipoDePropiedad, Direccion, Precio, AgenteID)
    VALUES (p_TipoDePropiedad, p_Direccion, p_Precio, p_AgenteID);
END //

DELIMITER ;
CALL InsertarRegistro('Departamento', 'Av. Oroño 123', 200000, 1);
DELIMITER ; 