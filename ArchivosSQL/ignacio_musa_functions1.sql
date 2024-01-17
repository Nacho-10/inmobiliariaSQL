DELIMITER //

CREATE FUNCTION ContarReservasPorPropiedad(propiedadID INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE numReservas INT;

    SELECT COUNT(*) INTO numReservas
    FROM Reservas
    WHERE PropiedadID = propiedadID;

    RETURN numReservas;
END //

DELIMITER ;