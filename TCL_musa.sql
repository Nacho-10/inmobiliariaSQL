USE inmobiliaria;

START TRANSACTION;

-- Realizo las modificaciones en la tabla Agentes --
UPDATE Agentes
SET Telefono = 'NuevoTelefono'
WHERE AgenteID = 1;

-- Realizo las modificaciones en la tabla Clientes --
UPDATE Clientes
SET Telefono = 'NuevoTelefono'
WHERE ClienteID = 1;

-- Confirmo la transacción --
COMMIT;