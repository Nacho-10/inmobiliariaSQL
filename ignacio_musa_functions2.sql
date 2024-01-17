DELIMITER //

CREATE FUNCTION ObtenerPrecioPromedioPorTipo(tipoPropiedad VARCHAR(50))
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE precioPromedio DECIMAL(10, 2);

    SELECT AVG(Precio) INTO precioPromedio
    FROM Propiedades
    WHERE TipoDePropiedad = tipoPropiedad;

    RETURN precioPromedio;
END //

DELIMITER ;